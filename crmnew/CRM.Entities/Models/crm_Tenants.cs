using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CRM.Entities.Models
{
    public partial class crm_Tenants : Entity
    {
        #region Properties
        public int TenantId { get; set; }
        public int AssignedUserId { get; set; }
        public string TenantName { get; set; }
        public string TenantNameAlias { get; set; }
        public string DbName { get; set; }
        public string DbUsername { get; set; }
        public string DbPassword { get; set; }
        public string Email { get; set; }
        public Nullable<int> PaymentDays { get; set; }
        public Nullable<int> DataSpace { get; set; }
        public Nullable<int> Subscribers { get; set; }
        public Nullable<int> PlanType { get; set; }
        public string OrgNumber { get; set; }       
        public string PostedAddress { get; set; }
        public string VisitingAddress { get; set; }
        public string Fax { get; set; }
        public string Rating { get; set; }
        public string Street { get; set; }
        public string Website { get; set; }
        public string City { get; set; }
        public Nullable<int> State { get; set; }
        public Nullable<int> CountryId { get; set; }
        public string ZipCode { get; set; }
        public string Description { get; set; }
        public string CompanyLogo { get; set; }
        public string CompanyGroup { get; set; }
        public string CompanyAdditionalInfo { get; set; }
        public string LinkedURL { get; set; }
        public string FacebookURL { get; set; }
        public string TwitterURL { get; set; }
        public string GoogleplusURL { get; set; }
        public string Information { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public bool Active { get; set; }
        #endregion

        #region Navigation properties
        /// <summary>
        /// Gets or sets the crm_Countries
        /// </summary>
        public virtual crm_Countries crm_Countries { get; set; }

        #endregion

    }
}
