using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel;
using CRM.Entities.ViewModel;
using System.Web.Mvc;
namespace CRM.Entities.Models
{
    public partial class crm_Users : Entity
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string PasswordSalt { get; set; }
        public string Email { get; set; }
        public string DisplayName { get; set; }
        public string FullName { get; set; }
        public Nullable<bool> Active { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public int TenantId { get; set; }
        [DisplayName("Avatar")]
        public string Image { get; set; }
        public string LinkedURL { get; set; }
        public string FacebookURL { get; set; }
        public string TwitterURL { get; set; }
        public string GoogleplusURL { get; set; }

        //[NotMapped]
        //public int SelectedRoleIds { get; set; }
        //[NotMapped]
        //public IEnumerable<crm_Roles> crm_Roles { get; set; }
        //[NotMapped]
        //public IEnumerable<crm_UserRoles> crm_UserRoles { get; set; }

    }
}
