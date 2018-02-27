using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Core.EntityClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;
using System.Web;
using System.Data.SqlClient;
using System.Web.Caching;
using CRM.Service;
using System.Data.Entity.Core.Objects;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
namespace CRM.Admin
{
    public static class Caching
    {
       private static string LanguageCode = ConfigurationManager.AppSettings["Language_Code"];
       public static string GetValue(string phrasename, string languagecode="")
       {
          try
            {
                if (string.IsNullOrEmpty(languagecode))
                {
                    languagecode = LanguageCode;
                }
                CRMContext dbcontext = new CRMContext();
                var phrase = dbcontext.crm_Phrases.AsQueryable();
                var phraseLanguage = dbcontext.crm_PhraseLanguages.AsQueryable();
                IEnumerable<PhraseLanguageModel> query;
                query = (from ph in phrase
                         join lg in phraseLanguage on new { a = ph.Id }
                             equals new { a = lg.PhraseId }
                         where lg.LanguageCode == languagecode && phrasename == ph.PhraseName
                         select new PhraseLanguageModel
                         {
                             PhraseName = ph.PhraseName,
                             PhraseValue = lg.PhraseValue
                         }).AsEnumerable();

                if (query.Count() > 0)
                {
                    return query.FirstOrDefault().PhraseValue;
                }

            }
            catch (Exception)
            {

            }
            return phrasename;
        }

        // private static EntityConnectionStringBuilder entityConnectionString = new EntityConnectionStringBuilder(ConfigurationManager.ConnectionStrings["CRMContext"].ConnectionString);
        
        //public static IEnumerable<crm_Phrases> GetLanguage(string languagecode)
        //{
        //    IEnumerable<crm_Phrases> categoryData = HttpContext.Current.Cache.Get("Language") as IEnumerable<crm_Phrases>;
            
        //    if (categoryData == null)
        //    {
        //        using (var context = new CRMContext())
        //        {
        //            IQueryable<crm_Phrases> languageDataCache = context.crm_Phrases.AsQueryable();
        //            using (SqlConnection connection = new SqlConnection(entityConnectionString.ProviderConnectionString))
        //            {
        //                connection.Open();
        //                SqlCommand command = new SqlCommand(((ObjectQuery)languageDataCache).ToTraceString(), connection);
        //                SqlCacheDependency dependency = new SqlCacheDependency(command);
        //                categoryData = languageDataCache.ToList();
        //                HttpContext.Current.Cache.Insert("Language", categoryData, dependency);
        //                command.ExecuteNonQuery();
        //            }
        //        }
        //    }
        //    return categoryData;
        //}


    }
}
