using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using CRM.Entities.Models;
using Repository.Pattern.UnitOfWork;
using Repository.Pattern.Infrastructure;
using CRM.Service;
using System.Net;
using System.Web;
using Kendo.Mvc.UI;
using Kendo.Mvc;
using System.ComponentModel;
using System.Linq.Expressions;
using System.IO;
using CRM.Admin.Models;
using AutoMapper;
using CRM.Admin.Extensions;
using System.Data.Entity;
using Repository.Pattern.DataContext;
using CRM.Entities.StoredProcedures;
using CRM.Admin.Filters;
using System.Security.AccessControl;
using CRM.Core;
using CRM.Core.Providers;
using Microsoft.Practices.Unity;

namespace CRM.Admin.Controllers
{
    /// <summary>
    /// Tenant controller
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 07/07/2014		thuyhk@cateno.no                Updated        
    /// 22/07/2014		thuyhk@cateno.no                Updated (upload file into folder tenants) 
    /// </summary>
    /// 

    [AuthFilter]
    public class TenantController : Controller
    {
        #region Fields

        private readonly ITenantService _tenantService;
        private readonly IUnitOfWork _unitOfWork;
        private static LogoModel _logoModel = new LogoModel();
        private readonly ICountryService _countryService;
        private readonly IUserService _userService;
        private readonly ILogService _logService;
        private readonly IUserRoleService _userRoleService;
        private readonly IRoleService _roleService;
        private readonly HelperExtensions _helper = new HelperExtensions();
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;

        private static string _tempFiles = "/images/temps";
        private static string _pathFiles;

        #endregion

        #region Constructors

        public TenantController(
            [Dependency("CRMNAUnitOfWork")]   IUnitOfWork unitOfWork,
            ITenantService tenantService, ICountryService countryService, IUserService userService, IRoleService roleSerivce, IUserRoleService userRoleService, ILogService logService)
        {
            this._unitOfWork = unitOfWork;
            this._tenantService = tenantService;
            this._countryService = countryService;
            this._userService = userService;
            this._userRoleService = userRoleService;
            this._roleService = roleSerivce;
            this._logService = logService;
        }

        #endregion

        #region Utilities

        public ActionResult List([DataSourceRequest] DataSourceRequest request)
        {
            int total = 0;
            SortDescriptor sortDescriptor = (request.Sorts != null && request.Sorts.Count > 0) ? request.Sorts.FirstOrDefault() : new SortDescriptor("CreatedDate", ListSortDirection.Descending);

            sortDescriptor.Member = sortDescriptor.Member ?? "TenantName";
            Func<IQueryable<crm_Tenants>, IOrderedQueryable<crm_Tenants>> order;
            var data = new List<crm_Tenants>();
            switch (sortDescriptor.Member)
            {
                case "TenantName":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.TenantName);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.TenantName);
                    }
                    break;
                case "TenantNameAlias":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.TenantNameAlias);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.TenantNameAlias);
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
            data = _tenantService.Select(null, order, null, request.Page, request.PageSize).ToList();

            var _lstTenantModel = new List<TenantModel>();
            var _userEntity = new crm_Users();
            var _tenantModel = new TenantModel();
            foreach (var item in data)
            {
                _tenantModel = item.ToModel();
                _userEntity = _userService.GetUserById(item.AssignedUserId);
                if (_userEntity != null)
                {
                    _tenantModel.ContactName = _userEntity.FullName;
                    _tenantModel.ContactPhone = _userEntity.Phone;
                    _tenantModel.ContactEmail = _userEntity.Email;
                }
                _lstTenantModel.Add(_tenantModel);

            }

            total = _tenantService.Select(null, order, null, null, null).Count();
            ViewBag.total = total;
            var result = new DataSourceResult()
            {
                Data = _lstTenantModel,
                Total = total
            };
            return Json(result);

        }

        public ActionResult Index()
        {
            ViewData["alertMessage"] = MessageBoxModel.ShowMessage;
            MessageBoxModel.ShowMessage = null;
            return View();
        }

        [HttpPost]
        public ActionResult Search([DataSourceRequest] DataSourceRequest request, string keyword)
        {
            int total = 0;
            SortDescriptor sortDescriptor = (request.Sorts != null && request.Sorts.Count > 0) ? request.Sorts.FirstOrDefault() : new SortDescriptor("CreatedDate", ListSortDirection.Ascending);

            sortDescriptor.Member = sortDescriptor.Member ?? "TenantName";
            Expression<Func<crm_Tenants, bool>> filter = x => x.TenantName.Contains(keyword);
            Func<IQueryable<crm_Tenants>, IOrderedQueryable<crm_Tenants>> order;
            var data = new List<crm_Tenants>();
            switch (sortDescriptor.Member)
            {
                case "TenantName":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.TenantName);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.TenantName);
                    }
                    break;
                case "TenantNameAlias":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.TenantNameAlias);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.TenantNameAlias);
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
            data = _tenantService.Select(filter, order, null, request.Page, request.PageSize).ToList();
            total = _tenantService.Select(filter, order, null, null, null).Count();

            var _lstTenantModel = new List<TenantModel>();
            var _userEntity = new crm_Users();
            var _tenantModel = new TenantModel();
            foreach (var item in data)
            {
                _userEntity = _userService.GetUserById(item.AssignedUserId);
                _tenantModel = item.ToModel();
                _tenantModel.ContactName = _userEntity.FullName;
                _tenantModel.ContactPhone = _userEntity.Phone;
                _tenantModel.ContactEmail = _userEntity.Email;
                _lstTenantModel.Add(_tenantModel);

            }

            ViewBag.total = total;
            var result = new DataSourceResult()
            {
                Data = _lstTenantModel,
                Total = total
            };
            return Json(result);
        }

        // GET: /Tenant/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var _tenant = _tenantService.Find(id);
            if (_tenant == null)
                return HttpNotFound();

            var model = _tenant.ToModel();
            int _countryId = Convert.ToInt32(model.CountryId);
            model.CountryName = _countryService.GetCountryById(_countryId).CountryName;

            return View(model);
        }

        #region create tenant
        // GET: /Tenant/Create
        public ActionResult Create()
        {
            var model = new TenantModel();
            model.CreatedDate = DateTime.Now;
            //model.AvailableCountries.Add(new SelectListItem() { Text = "Choose country", Value = "0" });
            foreach (var c in _countryService.GetAllCountries())
                model.AvailableCountries.Add(new SelectListItem() { Text = c.CountryName, Value = c.Id.ToString() });
            return View(model);
        }

        // POST: /Tenant/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(TenantModel tenantModel)
        {
            if (ModelState.IsValid)
            {
                var _tenantEntity = tenantModel.ToEntity();

                _tenantEntity.Active = true;
                _tenantEntity.CreatedDate = DateTime.Now;
                _tenantEntity.CreatedBy = _userInfo.ID;
                _tenantEntity.ModifiedBy = _userInfo.ID;
                _tenantEntity.ModifiedDate = DateTime.Now;
                _tenantEntity.DbName = "MultiOrg_" + _tenantEntity.TenantNameAlias;
                try
                {
                    if (_tenantService.CheckAlias(_tenantEntity.TenantNameAlias))
                    {
                        // create directory folder tenant
                        _pathFiles = "/tenants/" + tenantModel.TenantNameAlias;
                        var _newPath = Server.MapPath(_pathFiles);
                        if (!Directory.Exists(_newPath))
                            Directory.CreateDirectory(_newPath);

                        // create file default
                        var _fileDefault = "default.png";
                        var _sourceFile = Path.Combine(Server.MapPath(_tempFiles), _fileDefault);
                        var _destinationFile = Path.Combine(Server.MapPath(_pathFiles), _fileDefault);
                        System.IO.File.Copy(_sourceFile, _destinationFile);

                        if (!string.IsNullOrEmpty(_logoModel.FileName))
                        {
                            _tenantEntity.CompanyLogo = _pathFiles + "/" + _logoModel.FileName;

                            //move a file from temps file to tenant folder
                            _sourceFile = Path.Combine(Server.MapPath(_tempFiles), _logoModel.FileName);
                            _destinationFile = Path.Combine(Server.MapPath(_pathFiles), _logoModel.FileName);
                            if (System.IO.File.Exists(_destinationFile))
                                System.IO.File.Delete(_destinationFile);
                            System.IO.File.Move(_sourceFile, _destinationFile);

                            _logoModel = null;
                        }
                        else
                            _tenantEntity.CompanyLogo = _pathFiles + "/" + _fileDefault;

                        // insert new tenant
                        _tenantService.Insert(_tenantEntity);
                        _unitOfWork.SaveChanges();

                        // write log
                        _helper.InsertLogActive(_logService, _unitOfWork, "Tenants", "Insert new tenant", 1, true);
                        var result = new SqlQueryExcute().CreateDBByTenant(_tenantEntity.DbName, _tenantEntity.DbUsername, _tenantEntity.DbPassword);

                        // add new user
                        var _tenantId = _tenantService.GetTanentByAlias(_tenantEntity.TenantNameAlias).TenantId;
                        if (_tenantId > 0)
                        {
                            try
                            {
                                var _newUser = new crm_Users();
                                _newUser.Username = tenantModel.Username ?? _tenantEntity.DbUsername;

                                string encryptPassword = "";
                                string passwordSalt = "";
                                passwordSalt = EncryptProvider.GenerateSalt();
                                encryptPassword = EncryptProvider.EncryptPassword(tenantModel.Password, passwordSalt);

                                _newUser.PasswordSalt = passwordSalt;
                                _newUser.Password = encryptPassword;

                                _newUser.TenantId = _tenantId;
                                _newUser.CreatedDate = DateTime.Now;
                                _newUser.Active = true;
                                _newUser.Email = tenantModel.ContactEmail ?? _tenantEntity.Email;
                                _newUser.DisplayName = tenantModel.ContactName ?? _tenantEntity.TenantName;
                                _newUser.FullName = tenantModel.ContactName ?? _tenantEntity.TenantName;
                                _newUser.FacebookURL = _tenantEntity.FacebookURL;
                                _newUser.TwitterURL = _tenantEntity.TwitterURL;
                                _newUser.GoogleplusURL = _tenantEntity.GoogleplusURL;
                                _newUser.LinkedURL = _tenantEntity.LinkedURL;
                                _newUser.Image = _tenantEntity.CompanyLogo;
                                _newUser.Phone = tenantModel.ContactPhone;
                                _newUser.Mobile = tenantModel.MobilePhone;
                                _userService.Insert(_newUser);
                                _unitOfWork.SaveChanges();

                                _helper.InsertLogActive(_logService, _unitOfWork, "Users", "Insert user tenant admin", 1, true);

                                // add tenant admin role 
                                var _userId = _userService.GetUserByUsername(_newUser.Username).ID;
                                if (_userId > 0)
                                {
                                    try
                                    {
                                        // AssignedUserId
                                        var _ownTenantEntity = _tenantService.Find(_tenantId);
                                        _ownTenantEntity.AssignedUserId = _userId;
                                        _ownTenantEntity.ObjectState = ObjectState.Modified;
                                        _tenantService.Update(_ownTenantEntity);
                                        _unitOfWork.SaveChanges();
                                        _helper.InsertLogActive(_logService, _unitOfWork, "Tenant", "Assigned user for tenant", 2, true);

                                        // create group role
                                        var _roleEntity = new crm_Roles();

                                        //Console.WriteLine(((WeekDays)1).ToString());

                                        // TenantAdmin = 512
                                        _roleEntity.RoleName = UserGroupEnum.TenantAdmin.ToString();
                                        _roleEntity.Active = true;
                                        _roleEntity.MaskPermission = (int)UserGroupEnum.TenantAdmin + 15;
                                        _roleEntity.TenantId = _tenantId;
                                        _roleEntity.PermissionType = (int)UserGroupEnum.TenantAdmin;
                                        _roleService.Insert(_roleEntity);
                                        _unitOfWork.SaveChanges();

                                        // add  Manager = 256
                                        _roleEntity = new crm_Roles();
                                        _roleEntity.RoleName = UserGroupEnum.Manager.ToString();
                                        _roleEntity.Active = true;
                                        _roleEntity.MaskPermission = (int)UserGroupEnum.Manager + 15;
                                        _roleEntity.TenantId = _tenantId;
                                        _roleEntity.PermissionType = (int)UserGroupEnum.Manager;
                                        _roleService.Insert(_roleEntity);
                                        _unitOfWork.SaveChanges();

                                        // add  Support = 128
                                        _roleEntity = new crm_Roles();
                                        _roleEntity.RoleName = UserGroupEnum.Support.ToString();
                                        _roleEntity.Active = true;
                                        _roleEntity.MaskPermission = (int)UserGroupEnum.Support + 15;
                                        _roleEntity.TenantId = _tenantId;
                                        _roleEntity.PermissionType = (int)UserGroupEnum.Support;
                                        _roleService.Insert(_roleEntity);
                                        _unitOfWork.SaveChanges();

                                        // Marketing=64
                                        _roleEntity = new crm_Roles();
                                        _roleEntity.RoleName = UserGroupEnum.Marketing.ToString();
                                        _roleEntity.Active = true;
                                        _roleEntity.MaskPermission = (int)UserGroupEnum.Marketing + 15;
                                        _roleEntity.TenantId = _tenantId;
                                        _roleEntity.PermissionType = (int)UserGroupEnum.Marketing;
                                        _roleService.Insert(_roleEntity);
                                        _unitOfWork.SaveChanges();

                                        // Sales = 32
                                        _roleEntity = new crm_Roles();
                                        _roleEntity.RoleName = UserGroupEnum.Sales.ToString();
                                        _roleEntity.Active = true;
                                        _roleEntity.MaskPermission = (int)UserGroupEnum.Sales + 15;
                                        _roleEntity.TenantId = _tenantId;
                                        _roleEntity.PermissionType = (int)UserGroupEnum.Sales;
                                        _roleService.Insert(_roleEntity);
                                        _unitOfWork.SaveChanges();

                                        //  NormalUser = 16
                                        _roleEntity = new crm_Roles();
                                        _roleEntity.RoleName = UserGroupEnum.NormalUser.ToString();
                                        _roleEntity.Active = true;
                                        _roleEntity.MaskPermission = (int)UserGroupEnum.NormalUser + 15;
                                        _roleEntity.TenantId = _tenantId;
                                        _roleEntity.PermissionType = (int)UserGroupEnum.NormalUser;
                                        _roleService.Insert(_roleEntity);
                                        _unitOfWork.SaveChanges();

                                        // map role tenant admin
                                        var _newRole = new crm_UserRoles();
                                        _newRole.RoleID = _roleService.GetRoleIdByPermisstionType(_tenantId, (int)UserGroupEnum.TenantAdmin);
                                        _newRole.UserID = _userId;
                                        _userRoleService.Insert(_newRole);
                                        _unitOfWork.SaveChanges();
                                        _helper.InsertLogActive(_logService, _unitOfWork, "User Role", "Insert role tenant admin for user", 1, true);

                                    }
                                    catch
                                    {
                                        _helper.InsertLogActive(_logService, _unitOfWork, "User Role", "Insert role tenant admin for user", 1, false);
                                    }

                                }

                            }
                            catch
                            {
                                _helper.InsertLogActive(_logService, _unitOfWork, "Users", "Insert user tenant admin", 1, false);
                            }
                        }

                    }
                    MessageBoxModel.ShowMessage = "Add tenant " + _tenantEntity.TenantName + " success!";
                    return RedirectToAction("Index");
                }
                catch
                {
                    _helper.InsertLogActive(_logService, _unitOfWork, "Tenants", "Insert new tenant", 1, false);
                    return View(tenantModel);
                }
            }

            return View(tenantModel);
        }
        #endregion

        #region edit tenant

        public ActionResult EditLogo(string tenantId, string linked, string twitter, string facebook, string google)
        {
            int id = Convert.ToInt32(tenantId);
            int countUpdate = 0;
            var crm_tenant = _tenantService.Find(id);
            if (!string.IsNullOrEmpty(_logoModel.FileName))
            {
                crm_tenant.CompanyLogo = _pathFiles + "/" + _logoModel.FileName;

                //move a file from temps file to tenant folder
                var _sourceFile = Path.Combine(Server.MapPath(_tempFiles), _logoModel.FileName);
                var _destinationFile = Path.Combine(Server.MapPath(_pathFiles), _logoModel.FileName);
                if (System.IO.File.Exists(_destinationFile))
                    System.IO.File.Delete(_destinationFile);
                System.IO.File.Move(_sourceFile, _destinationFile);

                _logoModel = null;
                countUpdate++;
            }

            if (crm_tenant.LinkedURL != linked)
            {
                crm_tenant.LinkedURL = linked;
                countUpdate++;
            }

            if (crm_tenant.FacebookURL != facebook)
            {
                crm_tenant.FacebookURL = facebook;
                countUpdate++;
            }

            if (crm_tenant.TwitterURL != twitter)
            {
                crm_tenant.TwitterURL = twitter;
                countUpdate++;
            }

            if (crm_tenant.GoogleplusURL != google)
            {
                crm_tenant.GoogleplusURL = google;
                countUpdate++;
            }
            if (countUpdate > 0)
            {
                crm_tenant.ModifiedDate = DateTime.Now;
                crm_tenant.ObjectState = ObjectState.Modified;
                _tenantService.Update(crm_tenant);
                _unitOfWork.SaveChanges();
                return Content("Update success!");
            }
            else
                return Content("No change");
        }

        // GET: /Tenant/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var _tenant = _tenantService.Find(id);
            if (_tenant == null)
                return HttpNotFound();

            // static path files
            _pathFiles = "/Tenants/" + _tenant.TenantNameAlias;

            var model = _tenant.ToModel();
            int _countryId = Convert.ToInt32(model.CountryId);

            // countries
            foreach (var c in _countryService.GetAllCountries())
                model.AvailableCountries.Add(new SelectListItem() { Text = c.CountryName, Value = c.Id.ToString(), Selected = (c.Id == model.CountryId) });

            foreach (var user in _userService.GetListUsersByTenantId(_tenant.TenantId))
                model.AvailableUsers.Add(new SelectListItem() { Text = user.DisplayName, Value = user.ID.ToString(), Selected = (user.ID == model.AssignedUserId) });

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(TenantModel tenantModel)
        {
            var _tenant = _tenantService.Find(tenantModel.TenantId);
            if (_tenant != null)
            {
                if (_logoModel != null && !string.IsNullOrEmpty(_logoModel.FileName))
                {
                    tenantModel.CompanyLogo = _pathFiles + "/" + _logoModel.FileName;

                    //move a file from temps file to tenant folder
                    var _sourceFile = Path.Combine(Server.MapPath(_tempFiles), _logoModel.FileName);
                    var _destinationFile = Path.Combine(Server.MapPath(_pathFiles), _logoModel.FileName);
                    if (System.IO.File.Exists(_destinationFile))
                        System.IO.File.Delete(_destinationFile);
                    System.IO.File.Move(_sourceFile, _destinationFile);

                    _logoModel = null;
                }

                if (tenantModel.Website != _tenant.Website)
                    _tenant.Website = tenantModel.Website;

                if (tenantModel.TwitterURL != _tenant.TwitterURL)
                    _tenant.TwitterURL = tenantModel.TwitterURL;

                if (tenantModel.FacebookURL != _tenant.FacebookURL)
                    _tenant.FacebookURL = tenantModel.FacebookURL;

                if (tenantModel.LinkedURL != _tenant.LinkedURL)
                    _tenant.LinkedURL = tenantModel.LinkedURL;

                if (tenantModel.GoogleplusURL != _tenant.GoogleplusURL)
                    _tenant.GoogleplusURL = tenantModel.GoogleplusURL;

                if (tenantModel.TenantName != _tenant.TenantName)
                    _tenant.TenantName = tenantModel.TenantName;

                if (tenantModel.Email != _tenant.Email)
                    _tenant.Email = tenantModel.Email;

                if (tenantModel.VisitingAddress != _tenant.VisitingAddress)
                {
                    _tenant.VisitingAddress = tenantModel.VisitingAddress;
                    _tenant.PostedAddress = tenantModel.VisitingAddress;
                }

                if (tenantModel.AssignedUserId != _tenant.AssignedUserId)
                    _tenant.AssignedUserId = tenantModel.AssignedUserId;

                if (tenantModel.CountryId != _tenant.CountryId)
                    _tenant.CountryId = tenantModel.CountryId;

                if (tenantModel.Fax != _tenant.Fax)
                    _tenant.Fax = tenantModel.Fax;

                if (tenantModel.OrgNumber != _tenant.OrgNumber)
                    _tenant.OrgNumber = tenantModel.OrgNumber;

                if (tenantModel.Information != _tenant.Information)
                    _tenant.Information = tenantModel.Information;

                if (tenantModel.Information != _tenant.Information)
                    _tenant.Information = tenantModel.Information;
                if (tenantModel.Active != _tenant.Active)
                    _tenant.Active = tenantModel.Active;

                _tenant.ModifiedDate = DateTime.Now;
                _tenant.ModifiedBy = _userInfo.ID;

                _tenant.ObjectState = ObjectState.Modified;
                _tenantService.Update(_tenant);
                _unitOfWork.SaveChanges();
                _helper.InsertLogActive(_logService, _unitOfWork, "Tenants", "Update tenant", 2, true);
                return RedirectToAction("Index");

            }
            else
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "Tenants", "Update tenant", 2, false);
                return View(tenantModel);
            }
        }

        #endregion

        #region active tenant

        // deactive tenant
        [HttpPost, ActionName("Deactive")]
        public ActionResult DeactiveConfirmed(int id)
        {
            crm_Tenants crm_tenants = _tenantService.Find(id);
            crm_tenants.Active = false;
            _tenantService.Update(crm_tenants);
            _unitOfWork.SaveChanges();
            return Json(new { Status = 0, Message = Caching.GetValue("Tenant.Deactive_msg") });
        }

        // active tenant
        [HttpPost, ActionName("Active")]
        public ActionResult ActiveConfirmed(int id)
        {
            crm_Tenants crm_tenants = _tenantService.Find(id);
            crm_tenants.Active = true;
            _tenantService.Update(crm_tenants);
            _unitOfWork.SaveChanges();
            return Json(new { Status = 0, Message = "Active tenant success!" });
        }

        #endregion

        #region othes

        // Check available TenantNameAlias 
        public ActionResult CheckAlias(string alias)
        {
            var checkAlias = _tenantService.CheckAlias(alias);
            return Content(checkAlias.ToString());
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

        #endregion

        #endregion
    }
}
