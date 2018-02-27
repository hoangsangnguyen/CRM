using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;

namespace CRM.Entities.Models
{
    public class crm_Contacts:Entity
    {
        #region Properties
        public int ContactId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ContactPhone { get; set; }
        public string MobilePhone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public Nullable<bool> Active { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> CustomerId { get; set; }
        public Nullable<bool> IsDefault { get; set; }
        public string Gender { get; set; }
        #endregion
    }
}
