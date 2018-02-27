using CRM.Admin.Extensions;
using CRM.Entities.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CRM.Admin.Models
{
    /// <summary>
    /// Tenant model
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 07/07/2014		thuyhk@cateno.no                created.        
    /// </summary>
    /// 

    public class TenantModel
    {
        public TenantModel()
        {
            AvailableCountries = new List<SelectListItem>();
            AvailableUsers = new List<SelectListItem>();
        }

        #region Properties
        public int TenantId { get; set; }       

        [LocalizedDisplayName("Tenant.AssignedUserId")]
        [LocalizedRequired("Tenant.AssignedUserId_Required")]
        public int AssignedUserId { get; set; }

        [LocalizedDisplayName("Tenant.TenantName")]
        [LocalizedRequired("Tenant.TenantName_Required")]
        public string TenantName { get; set; }

        [LocalizedDisplayName("Tenant.TenantNameAlias")]
        [LocalizedRequired("Tenant.TenantNameAlias_Required")]
        [RegularExpression(@"(\S)+", ErrorMessage = "White space is not allowed.")]
        public string TenantNameAlias { get; set; }

        [LocalizedDisplayName("Tenant.DbName")]
        public string DbName { get; set; }
       
        [LocalizedDisplayName("Tenant.DbUsername")]
        [LocalizedRequired("Tenant.DbUsername_Required")]
        public string DbUsername { get; set; }

        [LocalizedDisplayName("Tenant.DbPassword")]
        [LocalizedRequired("Tenant.DbPassword_Required")]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string DbPassword { get; set; }

        [LocalizedDisplayName("Tenant.Email")]
        [LocalizedRequired("Tenant.Email_Required")]
        [RegularExpression("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", ErrorMessage = "Email Invalid!")]
        public string Email { get; set; }

        [LocalizedDisplayName("Tenant.PaymentDays")]
        public Nullable<int> PaymentDays { get; set; }

        [LocalizedDisplayName("Tenant.DataSpace")]
        public Nullable<int> DataSpace { get; set; }

        [LocalizedDisplayName("Tenant.Subscribers")]
        public Nullable<int> Subscribers { get; set; }

        [LocalizedDisplayName("Tenant.PlanType")]
        public Nullable<int> PlanType { get; set; }

        [LocalizedDisplayName("Tenant.OrgNumber")]
        public string OrgNumber { get; set; }

        [LocalizedDisplayName("Tenant.PostedAddress")]
        public string PostedAddress { get; set; }

        [LocalizedDisplayName("Tenant.VisitingAddress")]
        public string VisitingAddress { get; set; }

        [LocalizedDisplayName("Tenant.Fax")]
        public string Fax { get; set; }

        [LocalizedDisplayName("Tenant.Rating")]
        public string Rating { get; set; }

        [LocalizedDisplayName("Tenant.Street")]
        public string Street { get; set; }

        [LocalizedDisplayName("Tenant.Website")]
        public string Website { get; set; }

        [LocalizedDisplayName("Tenant.City")]
        public string City { get; set; }

        [LocalizedDisplayName("Tenant.State")]
        public Nullable<int> State { get; set; }

        [LocalizedDisplayName("Tenant.CountryId")]
        [LocalizedRequired("Tenant.CountryId_Required")]
        public Nullable<int> CountryId { get; set; }

        [LocalizedDisplayName("Tenant.ZipCode")]
        public string ZipCode { get; set; }

        [LocalizedDisplayName("Tenant.Description")]
        public string Description { get; set; }

        [LocalizedDisplayName("Global.Logo")]        
        public string CompanyLogo { get; set; }

        [LocalizedDisplayName("Tenant.CompanyGroup")]
        public string CompanyGroup { get; set; }

        [LocalizedDisplayName("Tenant.CompanyAdditionalInfo")]
        public string CompanyAdditionalInfo { get; set; }

        [LocalizedDisplayName("Tenant.LinkedURL")]
        public string LinkedURL { get; set; }

        [LocalizedDisplayName("Tenant.FacebookURL")]
        public string FacebookURL { get; set; }

        [LocalizedDisplayName("Tenant.TwitterURL")]
        public string TwitterURL { get; set; }

        [LocalizedDisplayName("Tenant.GoogleplusURL")]
        public string GoogleplusURL { get; set; }

        [LocalizedDisplayName("Tenant.Information")]
        public string Information { get; set; }

        [LocalizedDisplayName("CreatedBy")]
        public Nullable<int> CreatedBy { get; set; }

        [LocalizedDisplayName("Tenant.CreatedDate")]        
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> CreatedDate { get; set; }

        [LocalizedDisplayName("Tenant.ModifiedBy")]
        public Nullable<int> ModifiedBy { get; set; }

        [LocalizedDisplayName("Tenant.ModifiedDate")]
        public Nullable<System.DateTime> ModifiedDate { get; set; }

        [LocalizedDisplayName("Global.Active")]
        public bool Active { get; set; }
        #endregion

        #region Other properties       
        [LocalizedDisplayName("Tenant.ContactName")]
        [LocalizedRequired("Tenant.ContactName_Required")]
        public string ContactName { get; set; }

        [DisplayName("Phone")]
        [LocalizedDisplayName("Tenant.ContactPhone")]
        public string ContactPhone { get; set; }

        [DisplayName("Mobile")]
        [LocalizedDisplayName("Tenant.MobilePhone")]
        public string MobilePhone { get; set; }

        [LocalizedDisplayName("Tenant.ContactEmail")]
        [LocalizedRequired("Tenant.ContactEmail_Required")]
        [Remote("CheckDuplicatedContactEmail", "User", HttpMethod = "POST", ErrorMessage = "Email already exists. Please enter a different Email."),]
        [RegularExpression("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", ErrorMessage = "Email Invalid!")]        
        public string ContactEmail { get; set; }
       
        [RegularExpression(@"(\S)+", ErrorMessage = "White space is not allowed.")]
        [LocalizedDisplayName("Tenant.Username")]
        [LocalizedRequired("Tenant.Username_Required")]
        public string Username { get; set; }

        [LocalizedDisplayName("Tenant.Password")]
        [LocalizedRequired("Tenant.Password_Required")]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [LocalizedDisplayName("Tenant.CountryName")]
        public string CountryName { get; set; }
       
        public IList<SelectListItem> AvailableCountries { get; set; }

        public IList<SelectListItem> AvailableUsers { get; set; }

        #endregion
    }
}
