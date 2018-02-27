using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using CRM.Admin.Filters;
using Repository.Pattern.UnitOfWork;
using CRM.Entities.Models;
using CRM.Admin.Models;
using CRM.Service;
using Repository.Pattern.Ef6;
using Microsoft.Practices.Unity;
using Newtonsoft.Json;
using System.Net;
using System.Globalization;
using System.Web;
using System.IO;
using CRM.Core;
using System.Transactions;
using CRM.Admin.Extensions;

namespace CRM.Admin.Controllers
{
    /// <summary>
    /// Common controller
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 10/07/2014		thuyhk@cateno.no                Created.
    /// 21/07/2014      thuyhk@cateno.no                Updated.
    /// </summary>
    /// 

    [AuthFilter]
    public class CustomerController : Controller
    {
        #region Fields
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUnitOfWork _tenantUnitOfWork;
        private readonly ICustomerService _customerService;
        private readonly ICountryService _countryService;
        private readonly IContactService _contactService;
        private readonly ILogService _logService;
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
        private static LogoModel _logoModel=new LogoModel();
        private static string _tempFiles = "/images/temps";
        private readonly HelperExtensions _helper = new HelperExtensions();
        #endregion

        #region Constructors
        public CustomerController([Dependency("CRMNAUnitOfWork")]  IUnitOfWork unitOfWork, [Dependency("CRMNATenantUnitOfWork")] IUnitOfWork tenantUnitOfWork, ICustomerService customerService, ICountryService countryService,IContactService contactService,ILogService logService)
        {
            _unitOfWork = unitOfWork;
            _tenantUnitOfWork = tenantUnitOfWork;
            this._customerService = customerService;
            _countryService = countryService;
            _contactService = contactService;
            _logService = logService;
        }
        #endregion

        #region Utilities

        public ActionResult _ViewListCustomers()
        {
            var _customer = new List<crm_Customers>();
            try
            {
                _customer = _customerService.GetAllCustomers();
                //var _entityInsert = _customer.FirstOrDefault();
                //_entityInsert.CustomerName = DateTime.Now.ToString();
                //_customerService.Insert(_entityInsert);
                //_tenantUnitOfWork.SaveChanges();
            }
            catch
            {
            }
            return PartialView(_customer);
        }

        /// <summary>
        /// Render columns of grid
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public string RenderGridUserGroup()
        {
            //variables
            CustomerList model;
            UserInfo usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;

            #region Definite column
            model = new CustomerList();
            model.column = new List<ColumnRoleModel>();

            ColumnRoleModel colCustomerName = new ColumnRoleModel() { title = "Name", field = "CustomerName", template = "#=CustomerName#" }; model.column.Add(colCustomerName);
            ColumnRoleModel colName = new ColumnRoleModel() { title = "Contact information", field = "", template = "<div>#=FullName# | #=Email# | #=MobilePhone#</div>" }; model.column.Add(colName);
            ColumnRoleModel colLogo = new ColumnRoleModel() { title = "Logo", field = "CustomerLogo", template = "<div style='text-align:center'><img src='#=CustomerLogo#' width='48px' height='48px' /></div>" }; model.column.Add(colLogo);
            ColumnRoleModel colOrgNumber = new ColumnRoleModel() { title = "OrgNumber", field = "OrgNumber" }; model.column.Add(colOrgNumber);
            ColumnRoleModel colCreatedDate = new ColumnRoleModel() { title = "CreatedDate", field = "CreatedDate", template = "#=kendo.toString(new Date(CreatedDate),'yyyy.MM.dd')#" }; model.column.Add(colCreatedDate);
            //model.total = _roleService.GetAllRoles(usInfo.IsTenant, false, usInfo.TenanID).Count();
            //var _lst = _roleService.GetAllRoles(usInfo.IsTenant, false, usInfo.TenanID).Count();
            #endregion

            return JsonConvert.SerializeObject(model);
        }

        /// <summary>
        /// Return list data of usergroup
        /// </summary>
        /// <param name="totalRow">total of record in db</param>
        /// <param name="take">Get n row</param>
        /// <param name="skip">skip n row</param>
        /// <returns></returns>
        public string GetDataPaging(int take = 10, int skip = 0)
        {
            CustomerList model = new CustomerList();
            UserInfo usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
            CultureInfo norwayCulture = new CultureInfo("nb-NO"); 

            model.total = _customerService.GetAllCustomers().Count();
            model.data = _customerService.GetAllCusTomerInfor(skip,take);

            for (int i = 0; i < model.data.Count;i++ )
            {
                model.data[i].FullName = WebUtility.HtmlDecode(model.data[i].FirstName == null ? "" : model.data[i].FirstName) + " " + WebUtility.HtmlDecode(model.data[i].LastName == null ? "" : model.data[i].LastName);
                model.data[i].MobilePhone = model.data[i].MobilePhone == null ? "" : model.data[i].MobilePhone;
                model.data[i].CustomerLogo = model.data[i].CustomerLogo == null ? "/Tenants/" + usInfo.TenantAlias + "/default.png" : "/Tenants/" + usInfo.TenantAlias +"/"+ model.data[i].CustomerLogo;
            }

            return JsonConvert.SerializeObject(model);
        }

        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// View customer's information
        /// </summary>
        /// <param name="id">id of customer</param>
        /// <returns></returns>
        public ActionResult ViewDetail(int id=0)
        {
            //variables
            crm_Countries country = null;
            CustomerContactModel model = null;

            model = _customerService.GetCustomerInfor(id);

            if (model == null)
                return RedirectToAction("Index");

            country=_countryService.GetCountryById(model.CountryId.HasValue?model.CountryId.Value:0);

            model.CountryName = country == null ? "" : country.CountryName;

            return View(model);
        }

        public ActionResult AddEdit(int id=0)
        {
            //Variables
            CustomerContactModel model = null;

            if (id > 0)
                model = _customerService.GetCustomerInfor(id);
            else
                model = new CustomerContactModel();
            model.ListCountry = new List<crm_Countries>();
            model.ListCountry = _countryService.GetAllCountries().ToList();
            return View(model);
        }

        //auto save image into folder images/temps
        public ActionResult SaveLogoUpload(HttpPostedFileBase file)
        {
            if (file != null)
            {
                // Upload file in to UploadFolder
                var _fileName = Path.GetFileName(file.FileName);
                var _physhicalPath = Path.Combine(Server.MapPath(_tempFiles), _fileName);

                //if (System.IO.File.Exists(_physhicalPath))
                //    _physhicalPath = Path.Combine(Server.MapPath(_tempFiles), _fileName); // rename file if exist

                _logoModel = new LogoModel() { FileName = _fileName, PictureUrl = _tempFiles + "/" + _fileName };
                file.SaveAs(_physhicalPath);
            }
            return Json(_logoModel, JsonRequestBehavior.AllowGet);
        }

        public ActionResult RemoveLogoUpload()
        {
            var physicalPath = string.Format("{0}/{1}", Server.MapPath(_tempFiles), _logoModel.FileName);
            if (System.IO.File.Exists(physicalPath))
                System.IO.File.Delete(physicalPath);
            _logoModel = null;
            return Json("");
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public string AddEditAction(CustomerModel model)
        {
            //Variables
            ActionResultModel resultModel = new ActionResultModel();
            crm_Customers customer=null;
            crm_Contacts contact = null;
            UserInfo usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
            bool isSaveImageSuccess = true;
            string pathFiles = "/Tenants/" + _userInfo.TenantAlias;
            long orgNumber = 0;

            try
            {
                //Check case add or edit
                if(model.CustomerId>0)
                {
                    customer = _customerService.GetCustomerByID(model.CustomerId);
                    if (model.ContactId > 0)
                        contact = _contactService.GetContactDefaultByCusID(model.CustomerId);
                }
                else
                {
                    customer = new crm_Customers();
                }
                #region Validate data
                //Check email vaild
                if(!GlobalFunctions.IsValidEmail(model.Email.Trim()))
                {
                    resultModel.IsSuccess = 0;
                    resultModel.Message = "Email is invalid!";
                    return JsonConvert.SerializeObject(resultModel);
                }

                if(_countryService.GetCountryById(model.CountryId)==null)
                {
                    resultModel.IsSuccess = 0;
                    resultModel.Message = "Country is not exist!";
                    return JsonConvert.SerializeObject(resultModel);
                }

                if(customer==null && model.CustomerId>0)
                {
                    resultModel.IsSuccess = 0;
                    resultModel.Message = "Customer is not exist!";
                    return JsonConvert.SerializeObject(resultModel);
                }
                
                if(!long.TryParse(model.OrgNumber,out orgNumber))
                {
                    resultModel.IsSuccess = 0;
                    resultModel.Message = "Org number must be numeric!";
                    return JsonConvert.SerializeObject(resultModel);
                }

                if(!_customerService.CheckOrgNumberExist(model.CustomerId,model.OrgNumber.Trim()))
                {
                    resultModel.IsSuccess = 0;
                    resultModel.Message = "Org number is exist!";
                    return JsonConvert.SerializeObject(resultModel);
                }
                #endregion
                #region Set value for customer entity
                customer.CustomerName = WebUtility.HtmlEncode(model.CustomerName.Trim());
                customer.Email = model.Email.Trim();
                customer.PostedAddress = WebUtility.HtmlEncode(model.PostedAddress.Trim());
                customer.VisitingAddress = WebUtility.HtmlEncode(model.VisitingAddress.Trim());
                customer.CountryId = model.CountryId;
                customer.Fax = WebUtility.HtmlEncode(model.Fax.Trim());
                customer.OrgNumber = model.OrgNumber;
                customer.CreatedDate = DateTime.Now;
                customer.CreatedBy = usInfo.ID;
                customer.Description = WebUtility.HtmlEncode(model.Description.Trim());
                customer.Website = WebUtility.HtmlEncode(model.Website);
                customer.LinkedURL = WebUtility.HtmlEncode(model.LinkedURL);
                customer.FacebookURL = WebUtility.HtmlEncode(model.FacebookURL);
                customer.TwitterURL = WebUtility.HtmlEncode(model.TwitterURL);
                customer.GoogleplusURL = WebUtility.HtmlEncode(model.GoogleplusURL);
                customer.CustomerLogo = _logoModel.FileName != null ? _logoModel.FileName : model.CustomerId>0?customer.CustomerLogo:"";
                #endregion

                #region Set value for contact entity
                if (model.FirstName.Trim() != string.Empty
                || model.LastName.Trim() != string.Empty
                || model.Address.Trim() != string.Empty
                || model.ContactPhone.Trim() != string.Empty
                || model.MobilePhone.Trim() != string.Empty)
                {
                    if (contact != null)
                    {
                        contact.FirstName = model.FirstName.Trim() != string.Empty ? WebUtility.HtmlEncode(model.FirstName.Trim()) : contact.FirstName;
                        contact.LastName = model.LastName.Trim() != string.Empty ? WebUtility.HtmlEncode(model.LastName.Trim()) : contact.LastName;
                        contact.ContactPhone = model.ContactPhone.Trim() != string.Empty ? WebUtility.HtmlEncode(model.ContactPhone.Trim()) : contact.ContactPhone;
                        contact.MobilePhone = model.MobilePhone.Trim() != string.Empty ? WebUtility.HtmlEncode(model.MobilePhone.Trim()) : contact.MobilePhone;
                        contact.Address = model.Address.Trim() != string.Empty ? WebUtility.HtmlEncode(model.Address.Trim()) : contact.Address;
                    }
                    else
                    {
                        contact = new crm_Contacts();
                        contact.FirstName = WebUtility.HtmlEncode(model.FirstName.Trim());
                        contact.LastName = WebUtility.HtmlEncode(model.LastName.Trim());
                        contact.ContactPhone = WebUtility.HtmlEncode(model.ContactPhone.Trim());
                        contact.MobilePhone = WebUtility.HtmlEncode(model.MobilePhone.Trim());
                        contact.Address = WebUtility.HtmlEncode(model.Address.Trim());
                        contact.IsDefault = true;
                    }
                }
                #endregion

                #region Perform save data
                //Save image
                try
                {
                    if (_logoModel != null && !string.IsNullOrEmpty(_logoModel.FileName))
                    {

                        //move a file from temps file to tenant folder
                        var _sourceFile = Path.Combine(Server.MapPath(_tempFiles), _logoModel.FileName);
                        var _destinationFile = Path.Combine(Server.MapPath(pathFiles), _logoModel.FileName);
                        if (System.IO.File.Exists(_destinationFile))
                            System.IO.File.Delete(_destinationFile);
                        System.IO.File.Move(_sourceFile, _destinationFile);

                        _logoModel = null;
                    }
                }
                catch
                {
                    isSaveImageSuccess = false;
                }
                if (isSaveImageSuccess)
                {
                    //Add
                    if (model.CustomerId <= 0)
                    {
                        using (TransactionScope scope = new TransactionScope())
                        {
                            _customerService.Insert(customer);
                            _tenantUnitOfWork.SaveChanges();
                            
                            if (contact != null)
                            {
                                contact.CustomerId = customer.CustomerId;
                                _contactService.Insert(contact);
                                _tenantUnitOfWork.SaveChanges();
                            }
                            scope.Complete();
                        }
                    }
                    else//Edit
                    {
                        using (TransactionScope scope = new TransactionScope())
                        {
                            _customerService.Update(customer);
                            _tenantUnitOfWork.SaveChanges();
                            if (contact != null)
                            {
                                contact.CustomerId = customer.CustomerId;
                                if (contact.ContactId > 0)
                                {
                                    _contactService.Update(contact);
                                }
                                else
                                {
                                    _contactService.Insert(contact);
                                }
                                _tenantUnitOfWork.SaveChanges();
                            }
                            scope.Complete();
                        }
                    }
                    resultModel.IsSuccess =1;
                    resultModel.Message = "Data were saved successfully!";
                    _helper.InsertLogActive(_logService, _unitOfWork, "Customers", model.CustomerId <= 0 ? "Insert new customer" : "Update customer", model.CustomerId <= 0 ? 1 : 2, true);
                }
                else
                {
                    resultModel.IsSuccess = 0;
                    resultModel.Message = "Save image unsuccessfully!";
                    _helper.InsertLogActive(_logService, _unitOfWork, "Customers", "Save avatar image.", 1, false);
                }
                #endregion

            }
            catch(TransactionAbortedException te)
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "Customers",model.CustomerId<=0? "Insert new customer":"Update customer", model.CustomerId<=0?1:2, false);
            }
            catch(ApplicationException ex)
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "Customers", model.CustomerId <= 0 ? "Insert new customer" : "Update customer", model.CustomerId <= 0 ? 1 : 2, false);
                resultModel.IsSuccess = 0;
                resultModel.Message = "Data were saved unsuccessfully!";
            }
            return JsonConvert.SerializeObject(resultModel);
        }

        /// <summary>
        /// Delete usergroup
        /// </summary>
        /// <param name="id">usergroup's id</param>
        /// <returns></returns>
        [HttpPost]
        public string Delete(int id = 0)
        {
            //variables
            crm_Customers customer = null;
            List<crm_Contacts> lstContact = new List<crm_Contacts>();
            ActionResultModel model = new ActionResultModel();
            int userRole = 0;

            try
            {
                //Check role has user role
                customer = _customerService.GetCustomerByID(id);
                if (customer == null)
                {
                    model.IsSuccess = 0;
                    model.Message = "The customer is not exist!";
                    return JsonConvert.SerializeObject(model);
                }
                lstContact = _contactService.GetListContactByCustomerID(id);

                using(TransactionScope scope=new TransactionScope())
                {
                    foreach(crm_Contacts item in lstContact)
                    {
                        _contactService.Delete(item);
                    }
                    _tenantUnitOfWork.SaveChanges();

                    _customerService.Delete(customer);
                    _tenantUnitOfWork.SaveChanges();

                    scope.Complete();
                }

                model.IsSuccess = 1;
                model.Message = "Delete customer successfully!";
                _helper.InsertLogActive(_logService, _unitOfWork, "Customers", "Delete customer.", 3, true);
                return JsonConvert.SerializeObject(model);
            }
            catch
            {
                model.IsSuccess = 0;
                model.Message = "Delete fail!";
                _helper.InsertLogActive(_logService, _unitOfWork, "Customers", "Delete customer.", 3, false);
                return JsonConvert.SerializeObject(model);
            }

        }

        public ActionResult CustomerSummary(int id)
        {
            CustomerContactModel model = null;
            model = _customerService.GetSummaryOfCustomer(id);
            return PartialView("CustomerSummary",model);
        }
        #endregion
    }
}
