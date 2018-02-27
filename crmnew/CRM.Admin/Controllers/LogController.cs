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
using Microsoft.Practices.Unity;

namespace CRM.Admin.Controllers
{
    /// <summary>
    /// LogAction controller
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 10/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    [AuthFilter]
    public class LogController : Controller
    {
        #region Fields
        private readonly IUnitOfWork _unitOfWork;
        private readonly ILogActionService _logActiveService;
        private readonly IUserService _userService;
        private readonly IUserRoleService _userRoleService;
        private readonly IRoleService _roleService;
        private readonly ILogService _logService;
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;

        private readonly HelperExtensions _helper = new HelperExtensions();
        #endregion

        #region Constructors

        public LogController(ILogService logService, ILogActionService logActionService,
            IUserService userService, IUserRoleService userRoleService, IRoleService roleService,
            [Dependency("CRMNAUnitOfWork")]  IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
            this._logService = logService;
            this._logActiveService = logActionService;
            this._userService = userService;
            this._userRoleService = userRoleService;
            this._roleService = roleService;
        }

        #endregion

        #region Utilities

        // get logs by tenant admin
        public ActionResult Index()
        {
            return View();
        }

        // get logs by sa
        public ActionResult ListLogs()
        {
            return View();
        }

        public ActionResult List([DataSourceRequest] DataSourceRequest request)
        {
            int total = 0;
            int _tenantId = 0;
            try
            {
                var url = Request.Url.ToString();
                var lst = url.LastIndexOf("/");
                var tenantId = url.Substring(lst + 1, url.Length - lst - 1);

                _tenantId = Convert.ToInt32(tenantId);
            }
            catch
            {
                _tenantId = _userInfo.TenanID;
            }

            SortDescriptor sortDescriptor = (request.Sorts != null && request.Sorts.Count > 0) ? request.Sorts.FirstOrDefault() : new SortDescriptor("LoginDate", ListSortDirection.Descending);

            sortDescriptor.Member = sortDescriptor.Member ?? "Component";
            Func<IQueryable<crm_Logs>, IOrderedQueryable<crm_Logs>> order;
            Expression<Func<crm_Logs, bool>> filter = x => x.TenantId == _tenantId;
            var data = new List<crm_Logs>();
            switch (sortDescriptor.Member)
            {
                case "Component":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.Component);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.Component);
                    }
                    break;
                default:
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.LoginDate);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.LoginDate);
                    }
                    break;
            }

            data = _logService.Select(filter, order, null, request.Page, request.PageSize).ToList();

            var model = new List<LogModel>();
            foreach (var item in data)
            {
                var _newModel = new LogModel();
                _newModel = item.ToModel();
                if (_newModel.IsSuccess)
                    _newModel.Result = "Success";
                else
                    _newModel.Result = "Fail";
                _newModel.CreatedLogBy = _userService.GetUserById(_newModel.UserId).DisplayName;
                _newModel.ActionName = _logActiveService.GetLogActiveById(_newModel.LogTypeActionId).Name;
                model.Add(_newModel);
            }

            total = _logService.Select(filter, order, null, null, null).Where(x => x.TenantId == _tenantId).Count();
            ViewBag.total = total;


            var result = new DataSourceResult()
            {
                Data = model,
                Total = total
            };
            return Json(result);

        }

        [HttpPost]
        public ActionResult Search([DataSourceRequest] DataSourceRequest request, string keyword)
        {
            int total = 0;
            int _tenantId = 0;
            try
            {
                var url = Request.Url.ToString();
                var lst = url.LastIndexOf("/");
                var tenantId = url.Substring(lst + 1, url.Length - lst - 1);

                _tenantId = Convert.ToInt32(tenantId);
            }
            catch
            {
                _tenantId = _userInfo.TenanID;
            }

            SortDescriptor sortDescriptor = (request.Sorts != null && request.Sorts.Count > 0) ? request.Sorts.FirstOrDefault() : new SortDescriptor("LoginDate", ListSortDirection.Ascending);

            sortDescriptor.Member = sortDescriptor.Member ?? "Component";
            Expression<Func<crm_Logs, bool>> filter = x => x.Component.Contains(keyword) && x.TenantId == _tenantId;
            Func<IQueryable<crm_Logs>, IOrderedQueryable<crm_Logs>> order;
            var data = new List<crm_Logs>();
            switch (sortDescriptor.Member)
            {
                case "Component":
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.Component);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.Component);
                    }
                    break;
                default:
                    if (sortDescriptor.SortDirection == ListSortDirection.Ascending)
                    {
                        order = x => x.OrderBy(y => y.LoginDate);
                    }
                    else
                    {
                        order = x => x.OrderByDescending(y => y.LoginDate);
                    }
                    break;
            }
            data = _logService.Select(filter, order, null, request.Page, request.PageSize).ToList();
            var model = new List<LogModel>();
            foreach (var item in data)
            {
                var _newModel = new LogModel();
                _newModel = item.ToModel();
                if (_newModel.IsSuccess)
                    _newModel.Result = "Success";
                else
                    _newModel.Result = "Fail";
                _newModel.CreatedLogBy = _userService.GetUserById(_newModel.UserId).DisplayName;
                _newModel.ActionName = _logActiveService.GetLogActiveById(_newModel.LogTypeActionId).Name;
                model.Add(_newModel);
            }

            total = _logService.Select(null, order, null, null, null).Count();
            ViewBag.total = total;


            var result = new DataSourceResult()
            {
                Data = model,
                Total = total
            };
            return Json(result);
        }

        // GET: /Tenant/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var _log = _logService.Find(id);
            if (_log == null)
                return HttpNotFound();

            var model = _log.ToModel();
            model.ActionName = _logActiveService.GetLogActiveById(model.LogTypeActionId).Name;
            model.CreatedLogBy = _userService.GetUserById(model.UserId).DisplayName;
            if (model.IsSuccess)
                model.Result = "Success";
            else
                model.Result = "Fail";

            return View(model);
        }

        // Count log by tenant
        public ActionResult _CountLog(int tenantId)
        {
            int countLogs = 0;

            countLogs = _logService.ODataQueryable().Where(x => x.TenantId == tenantId).Count();
            List<int> lst = new List<int>();
            lst.Add(tenantId);
            lst.Add(countLogs);

            return PartialView(lst);
        }

        #endregion

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        _unitOfWork.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}
