using System;
using CRM.Entities.Models;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Repository.Pattern.Ef6;
using System.Collections.Generic;
namespace CRM.Service
{
    public interface IPhraseService: IService<crm_Phrases>
    {
        IEnumerable<LanguageModel> GetLanguage(string languagecode);
    }
}
