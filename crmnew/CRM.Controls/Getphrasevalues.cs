using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities;
using CRM.Entities.Models;
using CRM.Service;
namespace CRM.Controls
{
   public class GetPhraseValues
   {
       private static IPhraseLanguageService _phraselanguageservice;
       public GetPhraseValues(IPhraseLanguageService phraselanguageservice)
       {
           _phraselanguageservice = phraselanguageservice;
       }
       public static string GetValue(string phrasename)
       {
           IEnumerable<PhraseLanguageModel> phraselanguage = _phraselanguageservice.GetPhraseValue(phrasename);
           return phraselanguage.FirstOrDefault().PhraseValue;
       }
   }
}
