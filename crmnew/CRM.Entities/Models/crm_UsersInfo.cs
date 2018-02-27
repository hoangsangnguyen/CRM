using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
namespace CRM.Entities.Models
{
    public partial class crm_UsersInfo : Entity
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string PasswordSalt { get; set; }
        public string Email { get; set; }
        public string DisplayName { get; set; }
        public string FullName { get; set; }
        public Nullable<bool> Active { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public int TenantId { get; set; }
        public string Image { get; set; }
        public string LinkedURL { get; set; }
        public string FacebookURL { get; set; }
        public string TwitterURL { get; set; }
        public string GoogleplusURL { get; set; }

        public string Groupname { get; set; }

    }
}
