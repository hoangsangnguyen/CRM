using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using CRM.Entities.Models;
using CRM.Service;
using CRM.Admin.Models;
using Newtonsoft.Json;
using Repository.Pattern.UnitOfWork;
using CRM.Admin.Extensions;
using System.Net;
using System.Transactions;
using CRM.Core;
using System.IO;
using Microsoft.Practices.Unity;
using static System.Net.Mime.MediaTypeNames;

namespace CRM.Admin.Controllers
{
    public class LcLImpController : Controller
    {
        #region Field
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUnitOfWork _tenantUnitOfWork;
        private readonly ILcLImpService _lcLImpService;
        private readonly ICountryService _countryService;
        private readonly IContactService _contactService;
        private readonly ILogService _logService;
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
        private static LogoModel _logoModel = new LogoModel();
        private static string _tempFiles = "/images/temps";
        private readonly HelperExtensions _helper = new HelperExtensions();
        #endregion

        public LcLImpController([Dependency("CRMNAUnitOfWork")]  IUnitOfWork unitOfWork, 
            [Dependency("CRMNATenantUnitOfWork")] IUnitOfWork tenantUnitOfWork,
             ICountryService countryService,
            ILcLImpService lcLImpService, ILogService logService)
        {
            this._lcLImpService = lcLImpService;
            this._unitOfWork = unitOfWork;
            this._tenantUnitOfWork = tenantUnitOfWork;
            this._logService = logService;
            this._countryService = countryService;
        }

        public JsonResult GetSearchCountries(string search)
        {
            List<crm_Countries> list = _countryService.GetAllCountries();
            var result = (from N in list
                          where N.CountryName.StartsWith("v")
                          select new crm_Countries { Id = N.Id, CountryName = N.CountryName });
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Index()
        {
            var _LcLImp = new List<crm_LcLImp>();
            try
            {
                _LcLImp = _lcLImpService.GetAllLcLImp();
            }
            catch (Exception e) { Console.Write("Error loading LcL-Imp data"); }
            return View();
        }

        /// <summary>
        /// Render columns of grid
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public string RenderGridUserGroup()
        {
            //variables
            LcLImpList model;
            UserInfo usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;

            #region Definite column
            model = new LcLImpList();
            model.column = new List<ColumnRoleModel>();

            ColumnRoleModel colJobNo = new ColumnRoleModel() { title = "JobNo", field = "JobNo", template = "#=JobNo#" }; model.column.Add(colJobNo);
            ColumnRoleModel colCreated = new ColumnRoleModel() { title = "Created", field = "Created", template = "#=kendo.toString(new Date(Created),'yyyy.MM.dd')#" }; model.column.Add(colCreated);
            ColumnRoleModel colEta = new ColumnRoleModel() { title = "Eta", field = "Eta", template = "#=kendo.toString(new Date(Eta),'yyyy.MM.dd')#" }; model.column.Add(colEta);
            ColumnRoleModel colMBLNo = new ColumnRoleModel() { title = "M-B/L No", field = "JobNo", template = "#=MBLNo#" }; model.column.Add(colMBLNo);
            ColumnRoleModel colPOLId = new ColumnRoleModel() { title = "POLId", field = "POLId", template = "#=POLId#" }; model.column.Add(colPOLId);
            //ColumnRoleModel colCommodity = new ColumnRoleModel() { title = "Commodity", field = "Commodity", template = "#=Commodity#" }; model.column.Add(colCommodity);
            //ColumnRoleModel colMBLType = new ColumnRoleModel() { title = "MBLType", field = "MBLType", template = "#=MBLType#" }; model.column.Add(colMBLType);
            //ColumnRoleModel colETDDate = new ColumnRoleModel() { title = "ETDDate", field = "ETDDate", template = "#=ETDDate#" }; model.column.Add(colETDDate);
            //ColumnRoleModel colETDType = new ColumnRoleModel() { title = "ETDType", field = "ETDType", template = "#=ETDType#" }; model.column.Add(colETDType);
            //ColumnRoleModel colContactId = new ColumnRoleModel() { title = "ContactId", field = "ContactId", template = "#=ContactId#" }; model.column.Add(colContactId);
            //ColumnRoleModel colSCName = new ColumnRoleModel() { title = "SCName", field = "SCName", template = "#=SCName#" }; model.column.Add(colSCName);
            //ColumnRoleModel colVessel = new ColumnRoleModel() { title = "Vessel", field = "Vessel", template = "#=Vessel#" }; model.column.Add(colVessel);
            //ColumnRoleModel colPODId = new ColumnRoleModel() { title = "PODId", field = "PODId", template = "#=PODId#" }; model.column.Add(colPODId);
            //ColumnRoleModel colPackageAmount = new ColumnRoleModel() { title = "PackageAmount", field = "PackageAmount", template = "#=PackageAmount#" }; model.column.Add(colPackageAmount);
            //ColumnRoleModel colPackageType = new ColumnRoleModel() { title = "PackageType", field = "PackageType", template = "#=PackageType#" }; model.column.Add(colPackageType);
            //ColumnRoleModel colService = new ColumnRoleModel() { title = "Service", field = "Service", template = "#=Service#" }; model.column.Add(colService);
            //ColumnRoleModel colisFinish = new ColumnRoleModel() { title = "isFinish", field = "isFinish", template = "#=isFinish#" }; model.column.Add(colisFinish);
            //ColumnRoleModel colCoLoaderId = new ColumnRoleModel() { title = "CoLoaderId", field = "CoLoaderId", template = "#=CoLoaderId#" }; model.column.Add(colCoLoaderId);
            //ColumnRoleModel colAgentId = new ColumnRoleModel() { title = "AgentId", field = "AgentId", template = "#=AgentId#" }; model.column.Add(colAgentId);
            //ColumnRoleModel colVoyage = new ColumnRoleModel() { title = "Voyage", field = "Voyage", template = "#=Voyage#" }; model.column.Add(colVoyage);
            //ColumnRoleModel colDelivery = new ColumnRoleModel() { title = "Delivery", field = "Delivery", template = "#=Delivery#" }; model.column.Add(colMBLNo);
            //ColumnRoleModel colGW = new ColumnRoleModel() { title = "GW", field = "GW", template = "#=GW#" }; model.column.Add(colGW);
            //ColumnRoleModel colCBM = new ColumnRoleModel() { title = "CBM", field = "CBM", template = "#=CBM#" }; model.column.Add(colCBM);
            //ColumnRoleModel colNote = new ColumnRoleModel() { title = "Note", field = "Note", template = "#=Note#" }; model.column.Add(colNote);

            //ColumnRoleModel colCreatedDate = new ColumnRoleModel() { title = "CreatedDate", field = "CreatedDate", template = "#=kendo.toString(new Date(CreatedDate),'yyyy.MM.dd')#" }; model.column.Add(colCreatedDate);

            //ColumnRoleModel colLogo = new ColumnRoleModel() { title = "Logo", field = "CustomerLogo", template = "<div style='text-align:center'><img src='#=CustomerLogo#' width='48px' height='48px' /></div>" }; model.column.Add(colLogo);
            //ColumnRoleModel colOrgNumber = new ColumnRoleModel() { title = "OrgNumber", field = "OrgNumber" }; model.column.Add(colOrgNumber);
            //ColumnRoleModel colCreatedDate = new ColumnRoleModel() { title = "CreatedDate", field = "CreatedDate", template = "#=kendo.toString(new Date(CreatedDate),'yyyy.MM.dd')#" }; model.column.Add(colCreatedDate);

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
            LcLImpList model = new LcLImpList();
            UserInfo usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;

            model.total = _lcLImpService.GetAllLcLImp().Count();
            model.data = _lcLImpService.GetAllLcLImp();

            //for (int i = 0; i < model.data.Count; i++)
            //{
            //    // model.data[i].JobNo = WebUtility.HtmlDecode(model.data[i].FirstName == null ? "" : model.data[i].FirstName) + " " + WebUtility.HtmlDecode(model.data[i].LastName == null ? "" : model.data[i].LastName);
            //    model.data[i].JobNo = model.data
            //    model.data[i].MobilePhone = model.data[i].MobilePhone == null ? "" : model.data[i].MobilePhone;
            //    model.data[i].CustomerLogo = model.data[i].CustomerLogo == null ? "/Tenants/" + usInfo.TenantAlias + "/default.png" : "/Tenants/" + usInfo.TenantAlias + "/" + model.data[i].CustomerLogo;
            //}

            return JsonConvert.SerializeObject(model);
        }

        /// <summary>
        /// View customer's information
        /// </summary>
        /// <param name="id">id of customer</param>
        /// <returns></returns>
        public ActionResult ViewDetail(int id = 0)
        {
            //variables
            LclImpModel model = null;

            model = _lcLImpService.GetLcLImpInfor(id);

            if (model == null)
                return RedirectToAction("Index");

            return View(model);
        }

        public ActionResult AddEdit(int id = 0)
        {
            //Variables
            LclImpModel model = null;

            if (id > 0)
                model = _lcLImpService.GetLcLImpInfor(id);
            else
                model = new LclImpModel();
            model.ListCountry = new List<crm_Countries>();
            model.ListCountry = _countryService.GetAllCountries().ToList();
            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public string AddEditAction(LclImpModel model)
        {
            //Variables
            ActionResultModel resultModel = new ActionResultModel();
            crm_LcLImp lclImp = null;
            UserInfo usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
            bool isSaveImageSuccess = true;
            string pathFiles = "/Tenants/" + _userInfo.TenantAlias;
            long orgNumber = 0;

            try
            {
                //Check case add or edit
                if (model.Id > 0)
                {
                    lclImp = _lcLImpService.GetLcLImpByID(model.Id);
                }
                else
                {
                    lclImp = new crm_LcLImp();
                }
                #region Validate data

                if (lclImp == null && model.Id > 0)
                {
                    resultModel.IsSuccess = 0;
                    resultModel.Message = "LCL Import is not exist!";
                    return JsonConvert.SerializeObject(resultModel);
                }
                #endregion
                #region Set value for customer entity
                lclImp.Id = model.Id;
                lclImp.JobNo = WebUtility.HtmlEncode(model.JobNo.Trim());
                lclImp.Created = DateTime.Now;
                lclImp.Eta = DateTime.Now;
                lclImp.MBLNo = WebUtility.HtmlEncode(model.MBLNo.Trim());
                lclImp.MBLType = WebUtility.HtmlEncode(model.MBLType.Trim());
                lclImp.POLId = WebUtility.HtmlEncode(model.POLId.Trim());
                lclImp.Commodity = WebUtility.HtmlEncode(model.Commodity.Trim());
                lclImp.ETDDate = DateTime.Now;
                lclImp.ETDType = WebUtility.HtmlEncode(model.ETDType.Trim());
                lclImp.ContactId = WebUtility.HtmlEncode(model.ContactId.Trim());
                lclImp.SCName = WebUtility.HtmlEncode(model.SCName.Trim());
                lclImp.Vessel = WebUtility.HtmlEncode(model.Vessel.Trim());
                lclImp.PODId = WebUtility.HtmlEncode(model.PODId.Trim());
                lclImp.PackageAmount = model.PackageAmount;
                lclImp.PackageType = WebUtility.HtmlEncode(model.PackageType.Trim());
                lclImp.Service = WebUtility.HtmlEncode(model.Service.Trim());
                lclImp.isFinish = model.isFinish;
                lclImp.CoLoaderId = WebUtility.HtmlEncode(model.CoLoaderId.Trim());
                lclImp.AgentId = WebUtility.HtmlEncode(model.AgentId.Trim());
                lclImp.Voyage = WebUtility.HtmlEncode(model.Voyage.Trim());
                lclImp.Delivery = WebUtility.HtmlEncode(model.Delivery.Trim());
                lclImp.GW = model.GW;
                lclImp.CBM = model.CBM;
                lclImp.Note = WebUtility.HtmlEncode(model.Note.Trim());

                #endregion

                #region Perform save data
                //Save image
                //Add
                if (model.Id <= 0)
                {
                    using (TransactionScope scope = new TransactionScope())
                    {
                        _lcLImpService.Insert(lclImp);
                        _tenantUnitOfWork.SaveChanges();

                        scope.Complete();
                    }
                }
                else//Edit
                {
                    using (TransactionScope scope = new TransactionScope())
                    {
                        _lcLImpService.Update(lclImp);
                        _tenantUnitOfWork.SaveChanges();
                        _tenantUnitOfWork.SaveChanges();
                        scope.Complete();
                    }

                }
                resultModel.IsSuccess = 1;
                resultModel.Message = "Data were saved successfully!";
                _helper.InsertLogActive(_logService, _unitOfWork, "LcLImp", model.Id <= 0 ? "Insert new lcl import" : "Update lcl import", model.Id <= 0 ? 1 : 2, true);

                #endregion
            }
            catch (TransactionAbortedException te)
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "LcLImp", model.Id <= 0 ? "Insert new lcl import" : "Update lcl import", model.Id <= 0 ? 1 : 2, false);
            }
            catch (ApplicationException ex)
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "LcLImp", model.Id <= 0 ? "Insert new lcl import" : "Update lcl import", model.Id <= 0 ? 1 : 2, false);
                resultModel.IsSuccess = 0;
                resultModel.Message = "Data were saved unsuccessfully!";
            }
            return JsonConvert.SerializeObject(resultModel);
        }

        /// <summary>
        /// Delete lcl import
        /// </summary>
        /// <param name="id">usergroup's id</param>
        /// <returns></returns>
        [HttpPost]
        public string Delete(int id = 0)
        {
            //variables
            LclImpModel lclImp = null;
            ActionResultModel model = new ActionResultModel();

            try
            {
                //Check role has user role
                lclImp = _lcLImpService.GetLcLImpInfor(id);
                if (lclImp == null)
                {
                    model.IsSuccess = 0;
                    model.Message = "The Lcl Imp is not exist!";
                    return JsonConvert.SerializeObject(model);
                }

                using (TransactionScope scope = new TransactionScope())
                {
                    _tenantUnitOfWork.SaveChanges();

                    _lcLImpService.Delete(lclImp);
                    _tenantUnitOfWork.SaveChanges();

                    scope.Complete();
                }

                model.IsSuccess = 1;
                model.Message = "Delete lcl Imp successfully!";
                _helper.InsertLogActive(_logService, _unitOfWork, "LclImp", "Delete lcl Imp.", 3, true);
                return JsonConvert.SerializeObject(model);
            }
            catch
            {
                model.IsSuccess = 0;
                model.Message = "Delete fail!";
                _helper.InsertLogActive(_logService, _unitOfWork, "LclImp", "Delete lcl Imp.", 3, false);
                return JsonConvert.SerializeObject(model);
            }

        }


    }
}
