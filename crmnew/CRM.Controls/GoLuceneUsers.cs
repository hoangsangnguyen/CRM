using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Lucene.Net.Analysis.Standard;
using Lucene.Net.Documents;
using Lucene.Net.Index;
using Lucene.Net.QueryParsers;
using Lucene.Net.Search;
using Lucene.Net.Store;
using Version = Lucene.Net.Util.Version;
using CRM.Entities.Models;
using Lucene.Net.Analysis;
using Lucene.Net.Search.Highlight;

namespace CRM.Controls
{
    public static class GoLuceneUsers
    {
        public static string _luceneDir = Path.Combine(HttpContext.Current.Request.PhysicalApplicationPath, "lucene_index");

        private static FSDirectory _directoryTemp;

        private static FSDirectory _directory
        {
            get
            {
                if (_directoryTemp == null) _directoryTemp = FSDirectory.Open(new DirectoryInfo(_luceneDir));
                if (IndexWriter.IsLocked(_directoryTemp)) IndexWriter.Unlock(_directoryTemp);
                var lockFilePath = Path.Combine(_luceneDir, "write.lock");
                if (File.Exists(lockFilePath)) File.Delete(lockFilePath);
                return _directoryTemp;       }
        }

       
        // search methods
        public static IEnumerable<crm_Users> GetAllIndexRecords()
        {
            // validate search index
            if (!System.IO.Directory.EnumerateFiles(_luceneDir).Any()) return new List<crm_Users>();

            // set up lucene searcher
            var searcher = new IndexSearcher(_directory, false);
            var reader = IndexReader.Open(_directory, false);
            var docs = new List<Document>();
            var term = reader.TermDocs();
            // v 2.9.4: use 'hit.Doc()'
            // v 3.0.3: use 'hit.Doc'
            while (term.Next()) docs.Add(searcher.Doc(term.Doc));
            reader.Dispose();
            searcher.Dispose();
            return _mapLuceneToDataList(docs);
        }

        public static IEnumerable<crm_Users> Search(string input, string fieldName = "")
        {
            if (string.IsNullOrEmpty(input)) return new List<crm_Users>();

            var terms = input.Trim().Replace("-", " ").Split(' ')
                .Where(x => !string.IsNullOrEmpty(x)).Select(x => x.Trim() + "*");

            input = string.Join(" ", terms);

            return _search(input, fieldName);
        }

        public static IEnumerable<crm_Users> SearchDefault(string input, string fieldName = "")
        {
            return string.IsNullOrEmpty(input) ? new List<crm_Users>() : _search(input, fieldName);
        }

        // main search method
        private static IEnumerable<crm_Users> _search(string searchQuery, string searchField = "")
        {
            // validation
            if (string.IsNullOrEmpty(searchQuery.Replace("*", "").Replace("?", ""))) return new List<crm_Users>();

            // set up lucene searcher
            using (var searcher = new IndexSearcher(_directory, false))
            {
                var hits_limit = 1000;
                var analyzer = new StandardAnalyzer(Version.LUCENE_30);

                // search by single field
                if (!string.IsNullOrEmpty(searchField))
                {
                    var parser = new QueryParser(Version.LUCENE_30, searchField, analyzer);
                    parser.AllowLeadingWildcard = true;
                    var query = parseQuery(searchQuery, parser);
                    var hits = searcher.Search(query, hits_limit).ScoreDocs;
                    var results = _mapLuceneToDataList(hits, searcher);
                    analyzer.Close();
                    searcher.Dispose();
                    return results;
                }
                // search by multiple fields (ordered by RELEVANCE)
                else
                {
                    var parser = new MultiFieldQueryParser
                        (Version.LUCENE_30, new[] { "ID", "Username", "Password", "PasswordSalt", "Email", "DisplayName", "FullName", "Active", "CreatedDate", "UpdatedDate", "TenantId"}, analyzer);
                    var query = parseQuery(searchQuery, parser);
                    var hits = searcher.Search(query, null, hits_limit, Sort.INDEXORDER).ScoreDocs;
                    var results = _mapLuceneToDataList(hits, searcher);
                    analyzer.Close();
                    searcher.Dispose();
                    return results;
                }
            }
        }

        private static Query parseQuery(string searchQuery, QueryParser parser)
        {
            Query query;
            try
            {
                query = parser.Parse(searchQuery.Trim());
            }
            catch (ParseException)
            {
                query = parser.Parse(QueryParser.Escape(searchQuery.Trim()));
            }
            return query;
        }

        // map Lucene search index to data
        private static IEnumerable<crm_Users> _mapLuceneToDataList(IEnumerable<Document> hits)
        {
            return hits.Select(_mapLuceneDocumentToData).ToList();
        }

        private static IEnumerable<crm_Users> _mapLuceneToDataList(IEnumerable<ScoreDoc> hits, IndexSearcher searcher)
        {
            // v 2.9.4: use 'hit.doc'
            // v 3.0.3: use 'hit.Doc'
            return hits.Select(hit => _mapLuceneDocumentToData(searcher.Doc(hit.Doc))).ToList();
        }

        private static crm_Users _mapLuceneDocumentToData(Document doc)
        {
            return new crm_Users
            {
                ID = Convert.ToInt32(doc.Get("ID")),
                Username = doc.Get("Username"),
                Password = doc.Get("Password"),
                PasswordSalt = doc.Get("PasswordSalt"),
                Email = doc.Get("Email"),
                DisplayName = doc.Get("DisplayName"),
                FullName = doc.Get("FullName"),
                Active = Convert.ToBoolean(doc.Get("Active")),
                CreatedDate = Convert.ToDateTime(doc.Get("CreatedDate")),
                UpdatedDate = Convert.ToDateTime(doc.Get("UpdatedDate")),
                TenantId = Convert.ToInt32(doc.Get("TenantId")),
                Image = doc.Get("Image"),
                LinkedURL = doc.Get("LinkedURL"),
                FacebookURL = doc.Get("FacebookURL"),
                TwitterURL = doc.Get("TwitterURL"),
                GoogleplusURL = doc.Get("GoogleplusURL")
            };
        }

        // add/update/clear search index data 
        public static void AddUpdateLuceneIndex(crm_Users data)
        {
            AddUpdateLuceneIndex(new List<crm_Users> { data });
        }

        public static void AddUpdateLuceneIndex(IEnumerable<crm_Users> datas)
        {
            // init lucene
            var analyzer = new StandardAnalyzer(Version.LUCENE_30);
            using (var writer = new IndexWriter(_directory, analyzer, IndexWriter.MaxFieldLength.UNLIMITED))
            {
                // add data to lucene search index (replaces older entries if any)
                foreach (var data in datas) _addToLuceneIndex(data, writer);

                // close handles
                analyzer.Close();
                writer.Dispose();
            }
        }

        public static void ClearLuceneIndexRecord(int record_id)
        {
            // init lucene
            var analyzer = new StandardAnalyzer(Version.LUCENE_30);
            using (var writer = new IndexWriter(_directory, analyzer, IndexWriter.MaxFieldLength.UNLIMITED))
            {
                // remove older index entry
                var searchQuery = new TermQuery(new Term("ID", record_id.ToString()));
                writer.DeleteDocuments(searchQuery);

                // close handles
                analyzer.Close();
                writer.Dispose();
            }
        }

        public static bool ClearLuceneIndex()
        {
            try
            {
                var analyzer = new StandardAnalyzer(Version.LUCENE_30);
                using (var writer = new IndexWriter(_directory, analyzer, true, IndexWriter.MaxFieldLength.UNLIMITED))
                {
                    // remove older index entries
                    writer.DeleteAll();

                    // close handles
                    analyzer.Close();
                    writer.Dispose();
                }
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }

        public static void Optimize()
        {
            var analyzer = new StandardAnalyzer(Version.LUCENE_30);
            using (var writer = new IndexWriter(_directory, analyzer, IndexWriter.MaxFieldLength.UNLIMITED))
            {
                analyzer.Close();
                writer.Optimize();
                writer.Dispose();
            }
        }
        private static void _addToLuceneIndex(crm_Users data, IndexWriter writer)
        {
            // remove older index entry
            var searchQuery = new TermQuery(new Term("ID", data.ID.ToString()));
            writer.DeleteDocuments(searchQuery);

            // add new index entry
            var doc = new Document();
                
            // add lucene fields mapped to db fields
            doc.Add(new Field("ID", data.TenantId.ToString(), Field.Store.YES, Field.Index.NOT_ANALYZED));
            doc.Add(new Field("Username", data.Username.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Password", data.Password, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("PasswordSalt", data.PasswordSalt, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Email", data.Email, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("DisplayName", data.DisplayName, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("FullName", data.FullName, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Active", data.Active.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("CreatedDate", data.CreatedDate.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("UpdatedDate", data.UpdatedDate.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("TenantId", data.TenantId.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Image", data.Image, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("LinkedURL", data.LinkedURL, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("FacebookURL", data.FacebookURL, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("TwitterURL", data.TwitterURL, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("GoogleplusURL", data.GoogleplusURL, Field.Store.YES, Field.Index.ANALYZED));
            
            // add entry to index
            writer.AddDocument(doc);
        }

    }
}
