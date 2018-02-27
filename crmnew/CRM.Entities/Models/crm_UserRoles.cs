using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
using System.ComponentModel.DataAnnotations;

namespace CRM.Entities.Models
{
    public partial class crm_UserRoles : Entity
    {
        [Key]
        public int ID { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> RoleID { get; set; }
    }
}
