using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CRM.Entities.Models
{
    public partial class crm_Logs: Entity
    {
        public int LogId { get; set; }
        public int TenantId { get; set; }
        public int LogTypeActionId { get; set; }
        public int UserId { get; set; }
        public string Content { get; set; }
        public Nullable<System.DateTime> LoginDate { get; set; }
        public Nullable<System.DateTime> LogoutDate { get; set; }
        public string AccessBrowser { get; set; }
        public string DetectedIp { get; set; }
        public string ComputerName { get; set; }
        public string Platform { get; set; }
        public string Component { get; set; }
        public bool IsSuccess { get; set; }
    }
}
