using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CRM.Entities.Models
{
    public partial class crm_Phrases : Entity
    {
        public int Id { get; set; }
        public string PhraseName { get; set; }
        public string PhraseType { get; set; }
        
    }
    public class LanguageModel
    {
        public int Id { get; set; }
        public string PhraseName { get; set; }
        public string PhraseType { get; set; }
        public string PhraseValue { get; set; }
    }
    
}
