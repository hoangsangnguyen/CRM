using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;
using CRM.Core;

namespace CRM.Admin.Models
{
    public class UserGroupModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public string PermissionTypeName { get; set; }
        public int PermissionTypeID { get; set; }
        public string TenantName { get; set; }
        public string Description { get; set; }
        public Dictionary<int, string> ListPermType { get; set; }

        public int TenantId { get; set; }
        public Dictionary<int, string> ListTenant { get; set; }
    }

    public class UserGroupList
    {
        public List<ColumnRoleModel> column { get; set; }
        public List<crm_Roles> data { get; set; }
        public int total { get; set; }
    }

    public class UserGroupSubmitModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Active { get; set; }
        public string Description { get; set; }
        public int PermissionTypeID { get; set; }
        public string OldName { get; set; }
        public int TenantId { get; set; }
    }
}
