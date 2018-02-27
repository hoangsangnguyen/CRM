using CRM.Entities.Models;
using Repository.Pattern.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Repository.Repositories
{
    public static class PhraseRepository
    {
        public static IEnumerable<LanguageModel> GetLanguage(this IRepository<crm_Phrases> repository, string languagecode = "nb-NO")
        {
            var phrase = repository.GetRepository<crm_Phrases>().Queryable();
            var phraseLanguage = repository.GetRepository<crm_PhraseLanguages>().Queryable();
            IEnumerable<LanguageModel> query;
            query = (from ph in phrase
                     join lg in phraseLanguage on new { a = ph.Id }
                         equals new { a = lg.PhraseId }
                         where lg.LanguageCode ==languagecode
                     select new LanguageModel
                     {
                         Id = ph.Id,
                         PhraseName = ph.PhraseName,
                         PhraseType = ph.PhraseType,
                         PhraseValue = lg.PhraseValue
                     }).AsEnumerable();


            return query;
        }
        

    }
}
