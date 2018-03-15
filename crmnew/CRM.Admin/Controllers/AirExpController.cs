using CRM.Admin.Extensions;
using CRM.Admin.Filters;
using CRM.Admin.Models;
using CRM.Service;
using Microsoft.Practices.Unity;
using Repository.Pattern.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CRM.Admin.Controllers
{
    [AuthFilter]
    public class AirExpController : Controller
    {
        #region Fields
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUnitOfWork _tenantUnitOfWork;
        private readonly ILogService _logService;
        private readonly IAirExpService _airexpService;
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
        private static LogoModel _logoModel = new LogoModel();
        private static string _tempFiles = "/images/temps";
        private readonly HelperExtensions _helper = new HelperExtensions();
        #endregion

        #region Constructors
        public AirExpController([Dependency("CRMNAUnitOfWork")]  IUnitOfWork unitOfWork,
            [Dependency("CRMNATenantUnitOfWork")] IUnitOfWork tenantUnitOfWork,
            IAirExpService airExpService, ILogService logService)
        {
            _unitOfWork = unitOfWork;
            _tenantUnitOfWork = tenantUnitOfWork;
            _airexpService = airExpService;
            _logService = logService;
        }
        #endregion

        public ActionResult Index()
        {
            return View();
        }

    }
}
