using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
using System.ComponentModel.DataAnnotations.Schema;

namespace CRM.Entities.Models
{
    public partial class crm_Roles: Entity
    {
        public int ID { get; set; }
        public string RoleName { get; set; }
        public string Description { get; set; }
        public Nullable<bool> Active { get; set; }
        public Nullable<long> MaskPermission { get; set; }
        public int TenantId { get; set; }
        public Nullable<int> PermissionType { get; set; }

        // Others
        [NotMapped]
        public string TenantName { get; set; }
    }

    public class RoleUserModel
    {
        public int ID { get; set; }
        public string RoleName { get; set; }
        public string Description { get; set; }
        public Nullable<bool> Active { get; set; }
        public Nullable<long> MaskPermission { get; set; }
        public int TenantId { get; set; }
    }
}
