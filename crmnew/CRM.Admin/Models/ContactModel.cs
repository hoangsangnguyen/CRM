using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using CRM.Entities.Models;
using CRM.Admin.Extensions;

namespace CRM.Admin.Models
{
    public class ContactModel
    {
        public int ContactId { get; set; }
        public string DisplayName { get; set; }
        public string ContactPhone { get; set; }
        public string MobilePhone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public Nullable<bool> Active { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string Customer { get; set; }
        public Nullable<bool> IsDefault { get; set; }
             
    }
    public class ContactAddEditModel
    {
        public ContactAddEditModel()
        {
            AvailableCustomer = new List<SelectListItem>();
            AvailableGender = new List<SelectListItem>() { new SelectListItem { Text = "Male", Value = "Male" }, new SelectListItem { Text = "Female", Value = "Female" } };
        }
        public int ContactId { get; set; }
        [Required(ErrorMessage = " * Required ")]

        [LocalizedDisplayName("Contact.FirstName")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = " * Required ")]
        [LocalizedDisplayName("Contact.LastName")]
        public string LastName { get; set; }
        [LocalizedDisplayName("Customer.ContactPhone")]
        public string ContactPhone { get; set; }
        [LocalizedDisplayName("Customer.ContactPhone")]
        public string MobilePhone { get; set; }
        [LocalizedDisplayName("Contact.Address")]
        public string Address { get; set; }

        [Required(ErrorMessage = " * Required ")]
        [RegularExpression("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", ErrorMessage = "Email Invalid!")]
        [LocalizedDisplayName("Tenant.Email")]
        public string Email { get; set; }

        [LocalizedDisplayName("Contact.Gender")]
        public string Gender { get; set; }
        [LocalizedDisplayName("Tenant.Active")]
        public bool Active { get; set; }

        [LocalizedDisplayName("Contact.CreatedDate")]
        public Nullable<System.DateTime> CreatedDate { get; set; }

        [LocalizedDisplayName("Contact.Customer")]
        public Nullable<int> CustomerId { get; set; }

        public Nullable<bool> IsDefault { get; set; }
        public IList<SelectListItem> AvailableCustomer { get; set; }
        public IList<SelectListItem> AvailableGender { get; set; }
        public string FacebookURL { get; set; }
        public string TwitterURL { get; set; }
        public string GoogleplusURL { get; set; }
        public string LinkedURL { get; set; }
        public string Website { get; set; }
        public string CustomerLogo { get; set; }
        public CustomerContactModel Summary { get; set; }

    }

}
