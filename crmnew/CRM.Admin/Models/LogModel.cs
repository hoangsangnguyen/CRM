using CRM.Admin.Extensions;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Admin.Models
{
    /// <summary>
    /// LogModel
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 10/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    public class LogModel
    {
        #region Properties

        public int LogId { get; set; }
        public int TenantId { get; set; }
        public int LogTypeActionId { get; set; }
        public int UserId { get; set; }

        [LocalizedDisplayName("Log.Content")]
        public string Content { get; set; }

        [LocalizedDisplayName("Global.DateTime")]
        public Nullable<System.DateTime> LoginDate { get; set; }

        public Nullable<System.DateTime> LogoutDate { get; set; }

        [LocalizedDisplayName("Global.Browser")]
        public string AccessBrowser { get; set; }

        [LocalizedDisplayName("Global.IP")]
        public string DetectedIp { get; set; }

        [LocalizedDisplayName("Log.Computer")]
        public string ComputerName { get; set; }

        [LocalizedDisplayName("Log.Platform")]
        public string Platform { get; set; }

        [LocalizedDisplayName("Log.Component")]
        public string Component { get; set; }

        public bool IsSuccess { get; set; }

        #endregion

        #region Other Properties

        [LocalizedDisplayName("Global.Active")]
        public string ActionName { get; set; }

        [LocalizedDisplayName("Global.Result")]
        public string Result { get; set; }

        [LocalizedDisplayName("Global.Account")]
        public string CreatedLogBy { get; set; }

        #endregion 
    }
}
