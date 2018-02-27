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


namespace CRM.Controls
{
    public static class GoLuceneTenants
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
                return _directoryTemp;
            }
        }

        // search methods
        public static IEnumerable<crm_Tenants> GetAllIndexRecords()
        {
            // validate search index
            if (!System.IO.Directory.EnumerateFiles(_luceneDir).Any()) return new List<crm_Tenants>();

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

        public static IEnumerable<crm_Tenants> Search(string input, string fieldName = "")
        {
            if (string.IsNullOrEmpty(input)) return new List<crm_Tenants>();

            var terms = input.Trim().Replace("-", " ").Split(' ')
                .Where(x => !string.IsNullOrEmpty(x)).Select(x => x.Trim() + "*");

            input = string.Join(" ", terms);

            return _search(input, fieldName);
        }

        public static IEnumerable<crm_Tenants> SearchDefault(string input, string fieldName = "")
        {
            return string.IsNullOrEmpty(input) ? new List<crm_Tenants>() : _search(input, fieldName);
        }

        // main search method
        private static IEnumerable<crm_Tenants> _search(string searchQuery, string searchField = "")
        {
            // validation
            if (string.IsNullOrEmpty(searchQuery.Replace("*", "").Replace("?", ""))) return new List<crm_Tenants>();

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
                        (Version.LUCENE_30, new[] { "TenantId", "AssignedUserId", "TenantName", "TenantNameAlias", "DbName", "DbUsername", "DbPassword", 
                            "PaymentDays", "DataSpace", "Subscribers", "PlanType", "FirstName", "LastName", "OrgNumber", "ContactEmail", "ContactPhone","MobilePhone","Rating",
                            "Street","Website","City","State","CountryId","ZipCode","Description","CompanyLogo","CompanyGroup","CompanyAdditionalInfo",
                            "CreatedBy","CreatedDate","ModifiedBy","ModifiedDate"}, analyzer);
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
        private static IEnumerable<crm_Tenants> _mapLuceneToDataList(IEnumerable<Document> hits)
        {
            return hits.Select(_mapLuceneDocumentToData).ToList();
        }

        private static IEnumerable<crm_Tenants> _mapLuceneToDataList(IEnumerable<ScoreDoc> hits, IndexSearcher searcher)
        {
            // v 2.9.4: use 'hit.doc'
            // v 3.0.3: use 'hit.Doc'
            return hits.Select(hit => _mapLuceneDocumentToData(searcher.Doc(hit.Doc))).ToList();
        }

        private static crm_Tenants _mapLuceneDocumentToData(Document doc)
        {
            return new crm_Tenants
            {
                Active = Convert.ToBoolean(doc.Get("Active")),
                AssignedUserId = Convert.ToInt32(doc.Get("AssignedUserId")),
                City = doc.Get("City"),
                CompanyAdditionalInfo = doc.Get("CompanyAdditionalInfo"),
                CompanyGroup = doc.Get("CompanyGroup"),
                CompanyLogo = doc.Get("CompanyLogo"),
                //ContactEmail = doc.Get("ContactEmail"),
                //ContactName = doc.Get("ContactName"),
                //ContactPhone = doc.Get("ContactPhone"),
                CountryId = Convert.ToInt32(doc.Get("CountryId")),
                CreatedBy = Convert.ToInt32(doc.Get("CreatedBy")),
                CreatedDate = Convert.ToDateTime(doc.Get("CreatedDate")),
                DataSpace = Convert.ToInt32(doc.Get("DataSpace")),
                DbName = doc.Get("DbName"),
                DbPassword = doc.Get("DbPassword"),
                DbUsername = doc.Get("DbUsername"),
                Description = doc.Get("Description"),
                Email = doc.Get("Email"),
                FacebookURL = doc.Get("FacebookURL"),
                Fax = doc.Get("Fax"),
                GoogleplusURL = doc.Get("GoogleplusURL"),
                Information = doc.Get("Information"),
                LinkedURL = doc.Get("LinkedURL"),
                //MobilePhone = doc.Get("MobilePhone"),
                ModifiedBy = Convert.ToInt32(doc.Get("ModifiedBy")),
                ModifiedDate = Convert.ToDateTime(doc.Get("ModifiedDate")),
                OrgNumber = doc.Get("OrgNumber"),
                //Password = doc.Get("Password"),
                PaymentDays = Convert.ToInt32(doc.Get("PaymentDays")),
                PlanType = Convert.ToInt32(doc.Get("PlanType")),
                PostedAddress = doc.Get("PostedAddress"),
                Rating = doc.Get("Rating"),
                State = Convert.ToInt32(doc.Get("State")),
                Street = doc.Get("Street"),
                Subscribers = Convert.ToInt32(doc.Get("Subscribers")),
                TenantId = Convert.ToInt32(doc.Get("TenantId")),
                TenantName = doc.Get("TenantName"),
                TenantNameAlias = doc.Get("TenantNameAlias"),
                TwitterURL = doc.Get("TwitterURL"),
                //Username = doc.Get("Username"),
                VisitingAddress = doc.Get("VisitingAddress"),
                Website = doc.Get("Website"),
                ZipCode = doc.Get("ZipCode")
            };
        }

        // add/update/clear search index data 
        public static void AddUpdateLuceneIndex(crm_Tenants data)
        {
            AddUpdateLuceneIndex(new List<crm_Tenants> { data });
        }

        public static void AddUpdateLuceneIndex(IEnumerable<crm_Tenants> sampleDatas)
        {
            // init lucene
            var analyzer = new StandardAnalyzer(Version.LUCENE_30);
            using (var writer = new IndexWriter(_directory, analyzer, IndexWriter.MaxFieldLength.UNLIMITED))
            {
                // add data to lucene search index (replaces older entries if any)
                foreach (var sampleData in sampleDatas) _addToLuceneIndex(sampleData, writer);

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
                var searchQuery = new TermQuery(new Term("TenantId", record_id.ToString()));
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
        private static void _addToLuceneIndex(crm_Tenants data, IndexWriter writer)
        {
            // remove older index entry
            var searchQuery = new TermQuery(new Term("TenantId", data.TenantId.ToString()));
            writer.DeleteDocuments(searchQuery);

            // add new index entry
            var doc = new Document();

            // add lucene fields mapped to db fields
            doc.Add(new Field("Active", data.Active.ToString(), Field.Store.YES, Field.Index.NOT_ANALYZED));
            doc.Add(new Field("AssignedUserId", data.AssignedUserId.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("City", data.City, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("CompanyAdditionalInfo", data.CompanyAdditionalInfo, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("CompanyGroup", data.CompanyGroup, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("CompanyLogo", data.CompanyLogo, Field.Store.YES, Field.Index.ANALYZED));
            //doc.Add(new Field("ContactName", data.ContactName, Field.Store.YES, Field.Index.ANALYZED));
           // doc.Add(new Field("ContactPhone", data.ContactPhone, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("CountryId", data.CountryId.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("CreatedBy", data.CreatedBy.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("CreatedDate", data.CreatedDate.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("DataSpace", data.DataSpace.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("DbName", data.DbName, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("DbPassword", data.DbPassword, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("DbUsername", data.DbUsername, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Description", data.Description, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Email", data.Email, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("FacebookURL", data.FacebookURL, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Fax", data.Fax, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("GoogleplusURL", data.GoogleplusURL, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Information", data.Information, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("LinkedURL", data.LinkedURL, Field.Store.YES, Field.Index.ANALYZED));
            //doc.Add(new Field("MobilePhone", data.MobilePhone, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("ModifiedBy", data.ModifiedBy.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("ModifiedDate", data.ModifiedDate.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("OrgNumber", data.OrgNumber, Field.Store.YES, Field.Index.ANALYZED));
            //doc.Add(new Field("Password", data.Password, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("PaymentDays", data.PaymentDays.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("PlanType", data.PlanType.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("PostedAddress", data.PostedAddress, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Rating", data.Rating, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("State", data.State.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Street", data.Street, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Subscribers", data.Subscribers.ToString(), Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("TenantId", data.TenantId.ToString(), Field.Store.YES, Field.Index.NOT_ANALYZED));            
            doc.Add(new Field("TenantName", data.TenantName, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("TenantNameAlias", data.TenantNameAlias, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("TwitterURL", data.TwitterURL, Field.Store.YES, Field.Index.ANALYZED));
            //doc.Add(new Field("Username", data.Username, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("VisitingAddress", data.VisitingAddress, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("Website", data.Website, Field.Store.YES, Field.Index.ANALYZED));
            doc.Add(new Field("ZipCode", data.ZipCode, Field.Store.YES, Field.Index.ANALYZED));
            
            // add entry to index
            writer.AddDocument(doc);
        }

    }
}
