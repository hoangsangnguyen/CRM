using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using CRM.Admin.Filters;
using Kendo.Mvc.UI;
using Kendo.Mvc;
using System.ComponentModel;
using CRM.Entities.Models;
using CRM.Admin.Models;
using CRM.Service;
using Repository.Pattern.UnitOfWork;
using Microsoft.Practices.Unity;
using CRM.Admin.Extensions;
using System.Net;
using System.Linq.Expressions;
namespace CRM.Admin.Controllers
{
    [AuthFilter]
    public class ContactController : Controller
    {
        private readonly IContactService _contactService;
        private readonly ICustomerService _customerService;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUnitOfWork _contactUnitOfWork;
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
        private static LogoModel _logoModel = new LogoModel();
        public ContactController([Dependency("CRMNAUnitOfWork")]   IUnitOfWork unitOfWork,
           IContactService contactService, ICustomerService customerService)
        {
            this._unitOfWork = unitOfWork;
           // this._contactUnitOfWork = contactUnitOfWork;
            this._contactService = contactService;
            this._customerService = customerService;
        }
        public ActionResult Index()
        {
            List<SelectListItem> AvailableGender = new List<SelectListItem>() { new SelectListItem { Text = "Mr", Value = "1" }, new SelectListItem { Text = "Mrs", Value = "2" } };
            return View();
        }
        public ActionResult List([DataSourceRequest] DataSourceRequest request)
        {
            int total = 0;
            SortDescriptor sortDescriptor = (request.Sorts != null && request.Sorts.Count > 0) ? request.Sorts.FirstOrDefault() : new SortDescriptor("CreatedDate", ListSortDirection.Descending);
            sortDescriptor.Member = sortDescriptor.Member ?? "ContactName";
            Func<IQueryable<crm_Contacts>, IOrderedQueryable<crm_Contacts>> order;
            var data = new List<crm_Contacts>();
            switch (sortDescriptor.Member)
            {
                case "ContactName":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => (y.FirstName + " " + y.LastName));
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => (y.FirstName + " " + y.LastName));
                    }
                    break;
                case "ContactAddress":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.Address);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.Address);
                    }
                    break;
                default:
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.CreatedDate);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.CreatedDate);
                    }
                    break;
            }
            data = _contactService.Select(null, order, null, request.Page, request.PageSize).ToList();
            total = _contactService.Select(null, order, null, null, null).Count();
            var _lstContactModel = new List<ContactModel>();
            var _customer = new crm_Customers();
            var _contactModel = new ContactModel();
            foreach (var item in data)
            {
                _contactModel = item.ToModel();
                if (_contactModel != null)
                {
                    _contactModel.DisplayName = item.FirstName + " " + item.LastName;
                    _contactModel.Address = item.Address;
                    _contactModel.CreatedDate = item.CreatedDate;
                    _contactModel.Email = item.Email;
                    if (item.CustomerId ==null)
                    {
                        _contactModel.Customer = "";
                    }
                    else
	                {
                        _contactModel.Customer = _customerService.GetCustomerByID(item.CustomerId.Value).CustomerName;
	                }
                   
                                    }
                _lstContactModel.Add(_contactModel);

            }
            ViewBag.total = total;
            var result = new DataSourceResult()
            {
                Data = _lstContactModel,
                Total = total
            };
            return Json(result);
        }

        // GET: /Tenant/Create
        public ActionResult Create()
        {
            var model = new ContactAddEditModel();
            model.CreatedDate = DateTime.Now;
            //model.AvailableCountries.Add(new SelectListItem() { Text = "Choose country", Value = "0" });
            foreach (var c in _customerService.GetAllCustomers())
                model.AvailableCustomer.Add(new SelectListItem() { Text = c.CustomerName, Value = c.CustomerId.ToString() });
            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ContactAddEditModel contactModel)
        
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var _contactEntity = contactModel.ToEntityContact();
                    _contactEntity.CreatedDate = contactModel.CreatedDate;
                    _contactEntity.Gender = contactModel.AvailableGender.Where(x => x.Value == contactModel.Gender).FirstOrDefault().Text;
                    _contactEntity.Email = contactModel.Email;
                    _contactEntity.FirstName = contactModel.FirstName;
                    _contactEntity.LastName = contactModel.LastName;
                    _contactEntity.MobilePhone = contactModel.MobilePhone;
                    _contactEntity.Address = contactModel.Address;
                    _contactEntity.Active = contactModel.Active;
                    _contactEntity.CustomerId = contactModel.CustomerId;
                    _contactService.Insert(_contactEntity);
                    _contactUnitOfWork.SaveChanges();
                }
            }
            catch (Exception)
            {
                
               
            }
            
            return View("Index");
        }

        // GET: /Tenant/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var _contactEntity = _contactService.Find(id);
            if (_contactEntity == null)
                return HttpNotFound();

            // static path files
            //_pathFiles = "/Tenants/" + _tenant.TenantNameAlias;

            var _contactModel = _contactEntity.ToModelContact();
            int _customId = Convert.ToInt32(_contactModel.CustomerId);
            
            
            if (_customId >0)
            {
                var customer = _customerService.GetCustomerInfor(_customId);
                _contactModel.CustomerLogo = customer.CustomerLogo;
                _contactModel.FacebookURL = customer.FacebookURL;
                _contactModel.GoogleplusURL = customer.GoogleplusURL;
                _contactModel.LinkedURL = customer.LinkedURL;
                _contactModel.TwitterURL = customer.TwitterURL;
                _contactModel.Website = customer.Website;
                _contactModel.Summary = new CustomerContactModel();
                _contactModel.Summary.TotalContact = customer.TotalContact;
                // countries
                foreach (var c in _customerService.GetAllCustomers())
                    _contactModel.AvailableCustomer.Add(new SelectListItem() { Text = c.CustomerName, Value = c.CustomerId.ToString(), Selected = (c.CustomerId == _contactModel.CustomerId) });
                return View("EditFull", _contactModel);
            }
            else
            {
                return View("Edit", _contactModel);
            }
                
            //foreach (var gender in _userService.GetListUsersByTenantId(_tenant.TenantId))


            
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ContactAddEditModel contactModel)
        {

            try
            {
            var _contact = _contactService.Find(contactModel.ContactId);
            if (_contact != null)
            {
                _contact.ContactId = contactModel.ContactId;
                _contact.Active = contactModel.Active;
                _contact.Address = contactModel.Address;
                _contact.ContactPhone = contactModel.ContactPhone;
                _contact.Email = contactModel.Email;
                _contact.FirstName = contactModel.FirstName;
                _contact.Gender = contactModel.AvailableGender.Where(x => x.Value == contactModel.Gender).FirstOrDefault().Text;
                _contact.LastName = contactModel.LastName;
                _contact.CustomerId = contactModel.CustomerId;

                _contact.IsDefault = contactModel.IsDefault;
                _contactService.Update(_contact);
                _contactUnitOfWork.SaveChanges();
            }
            }
            catch (Exception)
            {
                
               
            }
            return View("index");
            //return View();
        }

        // deactive tenant
        [HttpPost, ActionName("Deactive")]
        public ActionResult DeactiveConfirmed(int id)
        {
            try
            {
                _contactService.Delete(id);
                _contactUnitOfWork.SaveChanges();
                return Json(new { Status = 0, Message = Caching.GetValue("Contact.DeleteSuccessfull") });
            }
            catch (Exception)
            {
                return Json(new { Status = 0, Message = Caching.GetValue("Contact.DeleteError") });
                
            }
           
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var _contact = _contactService.Find(id);
            if (_contact == null)
                return HttpNotFound();

            var _contactModel = _contact.ToModelContact();
            int _customId = Convert.ToInt32(_contactModel.CustomerId);
            
            if (_customId > 0)
            {
                var customer = _customerService.GetCustomerInfor(_customId);
                _contactModel.CustomerLogo = customer.CustomerLogo;
                _contactModel.FacebookURL = customer.FacebookURL;
                _contactModel.GoogleplusURL = customer.GoogleplusURL;
                _contactModel.LinkedURL = customer.LinkedURL;
                _contactModel.TwitterURL = customer.TwitterURL;
                _contactModel.Website = customer.Website;
                _contactModel.Summary = new CustomerContactModel();
                _contactModel.Summary.TotalContact = customer.TotalContact;  
                return View("ViewDetail", _contactModel);
            }
            else
            {
                return View("View", _contactModel);
            }

            return View("ViewDetail", _contactModel);
        }
        [HttpPost]
        public ActionResult Search([DataSourceRequest] DataSourceRequest request, string keyword)
        {
            int total = 0;
            SortDescriptor sortDescriptor = (request.Sorts != null && request.Sorts.Count > 0) ? request.Sorts.FirstOrDefault() : new SortDescriptor("CreatedDate", ListSortDirection.Ascending);

            sortDescriptor.Member = sortDescriptor.Member ?? "FirstName";
            Expression<Func<crm_Contacts, bool>> filter = x => x.FirstName.Contains(keyword);
            Func<IQueryable<crm_Contacts>, IOrderedQueryable<crm_Contacts>> order;
            var data = new List<crm_Contacts>();
            switch (sortDescriptor.Member)
            {
                case "FirstName":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.FirstName);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.FirstName);
                    }
                    break;
                case "LastName":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.LastName);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.LastName);
                    }
                    break;
                case "Email":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.Email);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.Email);
                    }
                    break;
                default:
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.CreatedDate);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.CreatedDate);
                    }
                    break;
            }
            data = _contactService.Select(filter, order, null, request.Page, request.PageSize).ToList();
            total = _contactService.Select(filter, order, null, null, null).Count();

            var _lstContactModel = new List<ContactModel>();
            var _customer = new crm_Customers();
            var _contactModel = new ContactModel();
            foreach (var item in data)
            {
                _contactModel = item.ToModel();
                if (_contactModel != null)
                {
                    _contactModel.DisplayName = item.FirstName + " " + item.LastName;
                    _contactModel.Address = item.Address;
                    _contactModel.CreatedDate = item.CreatedDate;
                    _contactModel.Email = item.Email;
                    _contactModel.Customer = _customerService.GetCustomerInfor(item.CustomerId.Value).CustomerName;
                }
                _lstContactModel.Add(_contactModel);

            }
            ViewBag.total = total;
            var result = new DataSourceResult()
            {
                Data = _lstContactModel,
                Total = total
            };
            return Json(result);
        }

    }
}
