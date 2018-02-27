using System;
using CRM.Entities.Models;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Repository.Pattern.Ef6;
using System.Collections.Generic;
namespace CRM.Service
{
    public interface IPhraseLanguageService : IService<crm_PhraseLanguages>
    {
        IEnumerable<PhraseLanguageModel> GetPhraseValue(string phrasename, string languagecode = "nb-NO");
    }
}
