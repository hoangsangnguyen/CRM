using CRM.Admin.Extensions;
using CRM.Admin.Filters;
using CRM.Admin.Models;
using CRM.Entities.Models;
using CRM.Service;
using Microsoft.Practices.Unity;
using Newtonsoft.Json;
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
    public class CountryController : Controller
    {
        #region Fields
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUnitOfWork _tenantUnitOfWork;
        private readonly ICountryService _countryService;
        private readonly ILogService _logService;
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
        private static LogoModel _logoModel = new LogoModel();
        private static string _tempFiles = "/images/temps";
        private readonly HelperExtensions _helper = new HelperExtensions();
        #endregion

        #region Constructors
        public CountryController([Dependency("CRMNAUnitOfWork")]  IUnitOfWork unitOfWork,
            [Dependency("CRMNATenantUnitOfWork")] IUnitOfWork tenantUnitOfWork,
            ICountryService countryService, ILogService logService)
        {
            _unitOfWork = unitOfWork;
            _tenantUnitOfWork = tenantUnitOfWork;
            _countryService = countryService;
            _logService = logService;
        }
        #endregion

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Create(int id = 0)
        {
            //Variables
            crm_Countries model = null;

            if (id > 0)
                model = _countryService.GetCountryById(id);
            else
                model = new crm_Countries();

            return View(model);
        }

        [HttpGet]
        public JsonResult GetAllCountries()
        {
            List<crm_Countries> list = _countryService.GetAllCountries();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetSearchCountries()
        {
            List<crm_Countries> list = _countryService.GetAllCountries();
            var result = (from N in list
                          where N.CountryName.StartsWith("v")
                          select new crm_Countries { Id = N.Id, CountryName = N.CountryName });
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public string AddEdit(crm_Countries model)
        {
            //Variables
            ActionResultModel resultModel = new ActionResultModel();
            crm_Countries res = null;

            // lưu data

            return JsonConvert.SerializeObject(resultModel);
        }
    }
}
