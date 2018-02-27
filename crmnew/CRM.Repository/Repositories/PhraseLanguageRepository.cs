using CRM.Entities.Models;
using Repository.Pattern.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Repository.Repositories
{
    public static class PhraseLanguageRepository
    {
        public static IEnumerable<PhraseLanguageModel> GetPhraseValue(this IRepository<crm_PhraseLanguages> repository, string phrasename, string languagecode = "nb-NO")
        {
            var phrase = repository.GetRepository<crm_Phrases>().Queryable();
            var phraseLanguage = repository.GetRepository<crm_PhraseLanguages>().Queryable();
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
            
            return query;
        }
            
    }
}
