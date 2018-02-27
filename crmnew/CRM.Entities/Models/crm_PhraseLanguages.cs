using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CRM.Entities.Models
{
    public partial class crm_PhraseLanguages : Entity
    {
        public int Id { get; set; }
        public string PhraseValue { get; set; }
        public string LanguageCode { get; set; }
        public int PhraseId { get; set; }
    }
    public class PhraseLanguageModel
    {
        public string PhraseName { get; set; }
        public string PhraseValue { get; set; }
    }
}
