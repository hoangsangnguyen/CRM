using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel;
using CRM.Entities.ViewModel;
using System.Web.Mvc;
using CRM.Entities.Models;
namespace CRM.Admin.Models
{
    public class UsersModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "* Required")]
        [DisplayName("User name")]
        [Remote("DoesUserNameExist", "User", HttpMethod = "POST", ErrorMessage = "User name already exists. Please enter a different user name.")]
        public string Username { get; set; }

        //[Range(6, 12, ErrorMessage = "Sorry, you must be between 6 and 12 to register.")]
        [Required(ErrorMessage = "* Required")]
        [DataType(DataType.Password)]
        [DisplayName("Password")]
        public string Password { get; set; }

        [NotMapped]
        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [System.Web.Mvc.Compare("Password", ErrorMessage = "Confirm Password not matching")]
        public string ConfirmPassword { get; set; }

        public string PasswordSalt { get; set; }

        [DisplayName("Email")]
        [Required(ErrorMessage = "* Required")]
        [Remote("CheckDuplicatedEmail", "User", HttpMethod = "POST", AdditionalFields = "ID", ErrorMessage = "Email already exists. Please enter a different Email."),]
        //[Remote("DoesEmailExist", "User", HttpMethod = "POST", ErrorMessage = "Email already exists. Please enter a different email.")]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Please enter a valid e-mail adress")]
        public string Email { get; set; }

        public string DisplayName { get; set; }

        [Required(ErrorMessage = "* Required")]
        [DisplayName("Full name")]
        public string FullName { get; set; }
        public Nullable<bool> Active { get; set; }


        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> CreatedDate { get; set; }
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> UpdatedDate { get; set; }

        //[Required(ErrorMessage = "* Required")]
        public int TenantId { get; set; }

        [DisplayName("Avatar")]
        public string Image { get; set; }
        public string LinkedURL { get; set; }
        public string FacebookURL { get; set; }
        public string TwitterURL { get; set; }
        public string GoogleplusURL { get; set; }

        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Entered phone format is not valid.")]
        [DisplayName("Phone")]
        public string Phone { get; set; }

        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Entered Mobile format is not valid.")]
        [DisplayName("Mobile")]
        public string Mobile { get; set; }

        [NotMapped]
        public int SelectedRoleIds { get; set; }
        [NotMapped]
        public IEnumerable<crm_Roles> crm_Roles { get; set; }
        [NotMapped]
        public IEnumerable<crm_UserRoles> crm_UserRoles { get; set; }
    }

}
