using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
namespace CRM.Entities.Models
{
    public partial class crm_EmailQueues : Entity
    {
        public int ID { get; set; }
        public Nullable<bool> Active { get; set; }
        public string EmailSubject { get; set; }
        public string DisplayNameFrom { get; set; }
        public string EmailFrom { get; set; }
        public string DisplayNameTo { get; set; }
        public string EmailTo { get; set; }
        public string EmailCc { get; set; }
        public string EmailBcc { get; set; }
        public string EmailBody { get; set; }
        public Nullable<bool> IsHtmlContent { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string SenderIP { get; set; }
        public int SendBy { get; set; }

    }
}
