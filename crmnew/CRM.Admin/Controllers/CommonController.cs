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
using CRM.Admin.Extensions;
using Microsoft.Practices.Unity;
using System.IO;
using System.Web;
using Repository.Pattern.Infrastructure;
using System.Net;

namespace CRM.Admin.Controllers
{
    /// <summary>
    /// Common controller
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 18/07/2014		thuyhk                          Created (Show logo by tenant)
    /// 22/07/2014      thuyhk                          Updated (Company profile)
    /// </summary>
    /// 

    [AuthFilter]
    public class CommonController : Controller
    {
        #region Fields
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
        private readonly IUnitOfWork _unitOfWork;
        private readonly ITenantService _tenantService;
        private readonly ICountryService _countryService;
        private readonly ILogService _logService;
        private readonly IUserService _userService;
        private static LogoModel _logoModel = new LogoModel();
        private readonly HelperExtensions _helper = new HelperExtensions();
        private static string _tempFiles = "/images/temps";
        private static string _pathFiles;

        #endregion

        #region Constructors

        public CommonController([Dependency("CRMNAUnitOfWork")]   IUnitOfWork unitOfWork, ITenantService tenantService, ILogService logService, IUserService userService, ICountryService countryService)
        {
            this._tenantService = tenantService;
            this._unitOfWork = unitOfWork;
            this._logService = logService;
            this._userService = userService;
            this._countryService = countryService;
        }

        #endregion

        #region Utilities

        // 18.07.2014   thuyhk
        public ActionResult _GetLogoTenant()
        {
            var imgUrl = "";
            try
            {
                var _tenant = _tenantService.GetTenantByTenantId(_userInfo.TenanID);
                imgUrl = _tenant.CompanyLogo;
            }
            catch
            {

            }

            return PartialView((object)imgUrl);
        }

        // 22.07.2014   thuyhk 
        public ActionResult TenantDetail()
        {
            var _tenantEntity = _tenantService.GetTenantByTenantId(_userInfo.TenanID);
            var _tenantModel = _tenantEntity.ToModel();
            int _countryId = Convert.ToInt32(_tenantModel.CountryId);
            _tenantModel.CountryName = _countryService.GetCountryById(_countryId).CountryName;
            return View(_tenantModel);
        }

        // 22.07.2014   thuyhk 
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

        // 22.07.2014   thuyhk 
        public ActionResult TenantEdit()
        {
            var _tenantEntity = _tenantService.GetTenantByTenantId(_userInfo.TenanID);
            if (_tenantEntity == null)
                return HttpNotFound();

            // static path files
            _pathFiles = "/Tenants/" + _tenantEntity.TenantNameAlias;

            var _tenantModel = _tenantEntity.ToModel();
            int _countryId = Convert.ToInt32(_tenantModel.CountryId);

            // countries
            foreach (var c in _countryService.GetAllCountries())
                _tenantModel.AvailableCountries.Add(new SelectListItem() { Text = c.CountryName, Value = c.Id.ToString(), Selected = (c.Id == _tenantModel.CountryId) });

            foreach (var user in _userService.GetListUsersByTenantId(_tenantEntity.TenantId))
                _tenantModel.AvailableUsers.Add(new SelectListItem() { Text = user.DisplayName, Value = user.ID.ToString(), Selected = (user.ID == _tenantModel.AssignedUserId) });

            return View(_tenantModel);
        }

        // 22.07.2014   thuyhk
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TenantEdit(TenantModel tenantModel)
        {
            var _tenant = _tenantService.Find(tenantModel.TenantId);
            if (_tenant != null)
            {
                if (_logoModel != null && !string.IsNullOrEmpty(_logoModel.FileName))
                {
                    _tenant.CompanyLogo = _pathFiles + "/" + _logoModel.FileName;

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

                if (tenantModel.Information != _tenant.Information)
                    _tenant.Information = tenantModel.Information;

                if (tenantModel.Information != _tenant.Information)
                    _tenant.Information = tenantModel.Information;

                _tenant.ModifiedDate = DateTime.Now;
                _tenant.ModifiedBy = _userInfo.ID;

                _tenant.ObjectState = ObjectState.Modified;
                _tenantService.Update(_tenant);
                _unitOfWork.SaveChanges();
                _helper.InsertLogActive(_logService, _unitOfWork, "Tenants", "Update company profiles", 2, true);
                return RedirectToAction("TenantDetail");
            }
            else
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "Tenants", "Update company profiles", 2, false);
                return View(tenantModel);
            }
        }

        //auto save image into folder images/temps
        public ActionResult SaveLogoUpload(HttpPostedFileBase file)
        {
            if (file != null)
            {
                // Upload file in to UploadFolder
                var _fileName = Path.GetFileName(file.FileName);
                var _physhicalPath = Path.Combine(Server.MapPath(_tempFiles), _fileName);

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
    }
}
