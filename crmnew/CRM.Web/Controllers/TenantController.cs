using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CRM.Entities.Models;
using Repository.Pattern.UnitOfWork;
using Repository.Pattern.Infrastructure;
using CRM.Service;
using CRM.Admin.Models;
using CRM.Admin.Filters;
using Microsoft.Practices.Unity;
using Repository.Pattern.Ef6;

namespace CRM.Web.Controllers
{
    [AuthFilter]
    public class TenantController : Controller
    {
        #region Fields
        private readonly IUnitOfWork _unitOfWork;
        private readonly ITenantService _tenantService;
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
        #endregion

        public TenantController([Dependency("CRMNAUnitOfWork")]  IUnitOfWork unitOfWork, ITenantService tenantService)
        {
            _unitOfWork = unitOfWork;
            _tenantService = tenantService;
        }

        public ActionResult Index(string alias)
        {
            var _alias = _tenantService.GetTanentAliasByTenantId(_userInfo.TenanID);
            if (alias.ToUpper() == _alias.ToUpper())
            {
                return RedirectToRoute("Admin_Default", new { controller = "Dashboard", action = "Index" });
            }
            else
                return Redirect("/Admin/Roles/AccessDeny");
        }
    }
}
