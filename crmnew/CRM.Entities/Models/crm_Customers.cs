using Repository.Pattern.Ef6;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Entities.Models
{
    public partial class crm_Customers : Entity
    {
        #region Properties

        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        public string OrgNumber { get; set; }
        public string PostedAddress { get; set; }
        public string VisitingAddress { get; set; }
        public string Email { get; set; }
        public string Fax { get; set; }
        public string Street { get; set; }
        public string Website { get; set; }
        public string City { get; set; }
        public Nullable<int> State { get; set; }
        public string ZipCode { get; set; }
        public Nullable<int> CountryId { get; set; }
        public string Description { get; set; }
        public string CustomerLogo { get; set; }
        public string CustomerGroup { get; set; }
        public string CustomerAdditionalInfo { get; set; }
        public string LinkedURL { get; set; }
        public string FacebookURL { get; set; }
        public string TwitterURL { get; set; }
        public string GoogleplusURL { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<DateTime> CreatedDate { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<DateTime> ModifiedDate { get; set; }

        #endregion
    }

    public class CustomerContactModel
    {
        public int CustomerId{get;set;}
        public Nullable<int> ContactId { get; set; }
        public string CustomerName { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string MobilePhone { get; set; }
        public string ContactPhone { get; set; }
        public string CustomerLogo { get; set; }
        public string OrgNumber { get; set; }
        public Nullable<DateTime> CreatedDate { get; set; }
        public string PostedAddress { get; set; }
        public string VisitingAddress { get; set; }
        public string Fax { get; set; }
        public string Street { get; set; }
        public string Website { get; set; }
        public string City { get; set; }
        public Nullable<int> State { get; set; }
        public string ZipCode { get; set; }
        public Nullable<int> CountryId { get; set; }
        public string Description { get; set; }
        public string CustomerGroup { get; set; }
        public string CustomerAdditionalInfo { get; set; }
        public string LinkedURL { get; set; }
        public string FacebookURL { get; set; }
        public string TwitterURL { get; set; }
        public string GoogleplusURL { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public string CountryName { get; set; }
        public string Address { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string OldCustomerLogo { get; set; }
        public int TotalContact { get; set; }
        public List<crm_Countries> ListCountry { get; set; }
    }
}
