using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;

namespace CRM.Admin.Models
{
    public class CustomerModel
    {
        public int CustomerId { get; set; }
        public int ContactId { get; set; }
        public string CustomerName { get; set; }
        public string Email { get; set; }
        public string MobilePhone { get; set; }
        public string ContactPhone { get; set; }
        public string CustomerLogo { get; set; }
        public string OrgNumber { get; set; }
        public string PostedAddress { get; set; }
        public string VisitingAddress { get; set; }
        public string Fax { get; set; }
        public string Website { get; set; }
        public int CountryId { get; set; }
        public string Description { get; set; }
        public string LinkedURL { get; set; }
        public string FacebookURL { get; set; }
        public string TwitterURL { get; set; }
        public string GoogleplusURL { get; set; }
        public string OldCustomerLogo { get; set; }
        public string Address { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }

    public class CustomerList
    {
        public List<ColumnRoleModel> column { get; set; }
        public List<CustomerContactModel> data { get; set; }
        public int total { get; set; }
    }
}
