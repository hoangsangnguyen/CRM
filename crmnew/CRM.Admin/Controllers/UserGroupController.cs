using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using CRM.Admin.Filters;
using Newtonsoft.Json;
using CRM.Admin.Models;
using CRM.Service;
using CRM.Repository;
using Repository.Pattern.UnitOfWork;
using CRM.Entities.Models;
using CRM.Core;
using System.Net;
using Repository.Pattern.Infrastructure;
using CRM.Admin.Extensions;
using Microsoft.Practices.Unity;

namespace CRM.Admin.Controllers
{
    [AuthFilter]
    public class UserGroupController : Controller
    {
        #region Fields
        private readonly IRoleService _roleService;
        private readonly ITenantService _tenantService;
        private readonly IUserRoleService _userRoleService;
        private readonly IUnitOfWork _unitOfWork;
        private readonly ILogService _logService;
        private readonly HelperExtensions _helper = new HelperExtensions();

        private static UserInfo userInfo;
        #endregion

        #region Constructors
        public UserGroupController(IRoleService roleServ, ITenantService tenantService, ILogService logService, IUserRoleService userRoleService, [Dependency("CRMNAUnitOfWork")] IUnitOfWork unitOfWork)
        {
            _roleService = roleServ;
            _tenantService = tenantService;
            _userRoleService = userRoleService;
            _logService = logService;
            _unitOfWork = unitOfWork;

            //check role
            if (System.Web.HttpContext.Current.Session["UserInfo"] != null)
            {
                userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
            }
        }
        #endregion

        #region Utilities
        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        _unitOfWork.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
        #endregion

        #region Basic Methods
        /// <summary>
        /// List usergroup
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Action that to CRUID data
        /// </summary>
        /// <param name="model">data model post from client</param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public string AddEditAction(UserGroupSubmitModel model)
        {
            //Variables
            crm_Roles role = new crm_Roles();
            ActionResultModel returnModel = new ActionResultModel();
            crm_Tenants tenant = null;
            bool isExist = false;
            UserInfo usInfo = null;
            int totalNameDuplicate = 0;


            //Check permission type valid
            foreach (UserGroupEnum item in Enum.GetValues(typeof(UserGroupEnum)))
            {
                if (model.PermissionTypeID == Convert.ToInt32(item))
                {
                    isExist = true;
                    break;
                }
            }

            if (!isExist)
            {
                returnModel.IsSuccess = 0;
                returnModel.Message = "Permission Type is not exist in system!";
                return JsonConvert.SerializeObject(returnModel);
            }

            if (model.ID > 0)
            {
                role = _roleService.ODataQueryable().Where(x => x.ID.Equals(model.ID)).FirstOrDefault();//.GetRoleByID(model.ID);
            }
            //Check usergroup exist
            if (role == null)
            {
                returnModel.IsSuccess = 0;
                returnModel.Message = "User group is not exist in system!";
                return JsonConvert.SerializeObject(returnModel);
            }
            //Check usergroup name exist
            //totalNameDuplicate = _roleService.CheckExistRoleName(model.Name.Trim());
            //if ((model.ID <= 0 && totalNameDuplicate > 0) //Case create new
            //    || (model.ID > 0 && totalNameDuplicate > 1 && model.OldName.Trim() == model.Name.Trim())//case edit that dont change name
            //    || (model.ID > 0 && totalNameDuplicate > 0 && model.OldName.Trim() != model.Name.Trim()))//case edit that change name
            //{
            //    returnModel.IsSuccess = 0;
            //    returnModel.Message = "User group's name is not exist in system!";
            //    return JsonConvert.SerializeObject(returnModel);
            //}

            /*
             * author: ri.khanh
             * date:2014.07.21
             * fuction:check duplication roleName in 1 same group
             */

            if (!CheckDuplicatedRolename(model.Name, model.TenantId, model.ID))
            {
                returnModel.IsSuccess = 0;
                returnModel.Message = "User group's name is not exist in system!";
                return JsonConvert.SerializeObject(returnModel);
            }


            usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
            //Set data to insert or update
            role.Active = model.Active != null ? true : false;
            role.RoleName = WebUtility.HtmlEncode(model.Name.Trim());
            role.Description = WebUtility.HtmlEncode((model.Description + "").Trim());
            role.PermissionType = model.PermissionTypeID;
            role.MaskPermission = model.PermissionTypeID;

            //ri.khanh
            if (userInfo.TenanID.Equals(0))
            {
                if (!model.PermissionTypeID.Equals((int)UserGroupEnum.Operator))
                {
                    if (model.TenantId.Equals(0))
                    {
                        returnModel.IsSuccess = 0;
                        returnModel.Message = "please select tentant!";
                        return JsonConvert.SerializeObject(returnModel);
                    }
                    role.TenantId = model.TenantId;
                }
                else { role.TenantId = 0; }
            }

            //If logged in user is tenant or lower will set tenant id of logged in user
            foreach (int curBitMask in usInfo.BitMask)
            {
                if (model.ID <= 0 && curBitMask <= (int)UserGroupEnum.TenantAdmin)
                {
                    role.TenantId = usInfo.TenanID;
                }
            }

            //Submit data
            if (model.ID <= 0)
            {
                _roleService.Insert(role);
            }
            else
            {
                role.ObjectState = ObjectState.Modified;
            }

            returnModel.IsSuccess = _unitOfWork.SaveChanges();
            returnModel.Message = returnModel.IsSuccess > 0 ? "Data were saved successfully!" : "Data were saved unsuccessfully!";
            //Write log
            //Action successfully
            if (returnModel.IsSuccess > 0)
            {
                //Case insert
                if (model.ID > 0)
                {
                    _helper.InsertLogActive(_logService, _unitOfWork, "UserGroup", "Update new usergroup", 2, true);
                }
                else//Case update
                {
                    _helper.InsertLogActive(_logService, _unitOfWork, "UserGroup", "Insert usergroup", 1, true);
                }
            }
            else//Action fail
            {
                //Case insert
                if (model.ID > 0)
                {
                    _helper.InsertLogActive(_logService, _unitOfWork, "UserGroup", "Update new usergroup", 2, false);
                }
                else//Case update
                {
                    _helper.InsertLogActive(_logService, _unitOfWork, "UserGroup", "Insert usergroup", 1, false);
                }
            }

            return JsonConvert.SerializeObject(returnModel);
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
            crm_Roles role = null;
            ActionResultModel model = new ActionResultModel();
            int userRole = 0;

            try
            {
                //Check role has user role
                userRole = _userRoleService.ODataQueryable().Where(x => x.RoleID == id).Count();
                if (userRole > 0)
                {
                    model.IsSuccess = 0;
                    model.Message = "This user group has users!";
                    return JsonConvert.SerializeObject(model);
                }
                role = _roleService.ODataQueryable().Where(x => x.ID.Equals(id)).FirstOrDefault();
                //Check role exist
                if (role == null)
                {
                    model.IsSuccess = 0;
                    model.Message = "User group has not exist!";
                    return JsonConvert.SerializeObject(model);
                }
                _roleService.Delete(role);
                model.IsSuccess = _unitOfWork.SaveChanges();
                model.Message = model.IsSuccess > 0 ? "Delete user group successfully!" : "Delete user group unsuccessfully!";
                return JsonConvert.SerializeObject(model);
            }
            catch
            {
                model.IsSuccess = 0;
                model.Message = "Delete fail!";
                return JsonConvert.SerializeObject(model);
            }

        }
        #endregion

        #region Methods
        /// <summary>
        /// View information of usergroup
        /// </summary>
        /// <param name="id">usergroup's id</param>
        /// <returns></returns>
        public ActionResult ViewDetail(int id = 0)
        {
            //variables
            crm_Roles roleItem;
            UserGroupModel model = new UserGroupModel();
            crm_Tenants tenant;

            try
            {
                //Check invalid id
                if (id == 0)
                {
                    return View("Index");
                }

                //Get role detail
                roleItem = _roleService.GetRoleByID(id);

                //Check null data
                if (roleItem == null)
                {
                    return View("Index");
                }

                //Set permission type name
                foreach (UserGroupEnum usergroup in Enum.GetValues(typeof(UserGroupEnum)))
                {
                    if (roleItem.PermissionType.HasValue)
                    {
                        if (roleItem.PermissionType.Value == Convert.ToInt32(usergroup))
                        {
                            model.PermissionTypeName = usergroup.ToString();
                            break;
                        }
                    }
                }

                tenant = _tenantService.Find(roleItem.TenantId);

                //set value for model
                model.ID = roleItem.ID;
                model.Name = roleItem.RoleName;
                model.Active = roleItem.Active.HasValue ? roleItem.Active.Value : false;
                model.Description = roleItem.Description;
                model.TenantName = tenant == null ? "" : tenant.TenantName;

                return View(model);
            }
            catch
            {
                return View("Index");
            }

        }

        /// <summary>
        /// The View that to add or edit data of usergroup
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult AddEdit(int id = 0)
        {
            //variables
            crm_Roles roleItem = null;
            UserGroupModel model = new UserGroupModel();
            UserInfo usInfo = null;
            int maxBitMask = 0;

            try
            {

                //Get role detail
                if (id > 0)
                    roleItem = _roleService.GetRoleByID(id);
                usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
                //Get max BitMask of user
                foreach (int curBitMask in usInfo.BitMask)
                {
                    if (curBitMask > maxBitMask)
                        maxBitMask = curBitMask;
                }
                model.ListPermType = new Dictionary<int, string>();
                model.ListPermType.Add(0, "Choose permission type...");

                //Get list permission enum
                Array enumUsergroup = Enum.GetValues(typeof(UserGroupEnum));
                int count = 1;
                foreach (UserGroupEnum usergroup in enumUsergroup)
                {
                    //Don't render super admin permission into combobox
                    if (count == enumUsergroup.Length)
                        break;
                    int bitmask = Convert.ToInt32(usergroup);
                    //Render permission corresponding logged user
                    if (bitmask <= maxBitMask)
                    {
                        model.ListPermType.Add(bitmask, usergroup.ToString());
                    }
                    count++;
                }

                /*
                 * author: ri.khanh
                 * date : 2014.21.07
                 * get tenant add to list
                 */
                var listTenant = new Dictionary<int, string>();

                var listTemp = (from t in _tenantService.ODataQueryable()
                                select new
                                {
                                    TeantName = t.TenantName,
                                    TenantId = t.TenantId
                                });//.ToDictionary(x => x.TenantId, x => x.TeantName);

                model.ListTenant = new Dictionary<int, string>();
                model.ListTenant.Add(0, "Choose tenant");
                foreach (var item in listTemp)
                {
                    model.ListTenant.Add(item.TenantId, item.TeantName);
                }
                // model.ListTenant = listTenant;

                //end
                if (roleItem != null)
                {
                    //set value for model
                    model.ID = roleItem.ID;
                    model.Name = WebUtility.HtmlDecode(roleItem.RoleName);
                    model.Active = roleItem.Active.HasValue ? roleItem.Active.Value : false;
                    model.PermissionTypeID = roleItem.PermissionType.HasValue ? roleItem.PermissionType.Value : 0;
                    model.Description = WebUtility.HtmlDecode(roleItem.Description);

                    model.TenantId = roleItem.TenantId;
                }

                return View(model);
            }
            catch
            {
                return View("Index");
            }
        }

        /// <summary>
        /// Render columns of grid
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public string RenderGridUserGroup()
        {
            //variables
            UserGroupList model;
            UserInfo usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;

            #region Definite column
            model = new UserGroupList();
            model.column = new List<ColumnRoleModel>();
            //ColumnRoleModel colID = new ColumnRoleModel() { title = "ID", field = "ID", template = "<div style='text-align:center;width:100%;'>#=ID#</div>" }; model.column.Add(colID);
            ColumnRoleModel colTenant = new ColumnRoleModel() { title = "Tenant", field = "TenantName", hidden = true }; model.column.Add(colTenant);
            ColumnRoleModel colName = new ColumnRoleModel() { title = "Name", field = "RoleName" }; model.column.Add(colName);
            ColumnRoleModel colDescription = new ColumnRoleModel() { title = "Description", field = "Description" }; model.column.Add(colDescription);
            ColumnRoleModel colActive = new ColumnRoleModel() { title = "Action", field = "Active", template = "<div style='text-align:center'><input class='multi' type='checkbox' disabled='disabled' #= Active ? checked='checked' : '' # /><span class='lbl'></span></div>" }; model.column.Add(colActive);
            model.total = _roleService.GetAllRoles(usInfo.IsTenant, false, usInfo.TenanID).Count();
            var _lst = _roleService.GetAllRoles(usInfo.IsTenant, false, usInfo.TenanID).Count();
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
        public string GetDataPaging(int totalRow, int take = 1, int skip = 0)
        {
            UserGroupList model = new UserGroupList();
            UserInfo usInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;

            model.total = _roleService.GetAllRoles(usInfo.IsTenant, false, usInfo.TenanID).Count();
            model.data = _roleService.GetAllRoles(usInfo.IsTenant, false, usInfo.TenanID).Skip(skip).Take(take).ToList();
            for (int i = 0; i < model.data.Count; i++)
            {
                model.data[i].RoleName = WebUtility.HtmlDecode(model.data[i].RoleName);
                model.data[i].Description = WebUtility.HtmlDecode(model.data[i].Description);
                try
                {
                    model.data[i].TenantName = _tenantService.GetTenantByTenantId(model.data[i].TenantId).TenantName;
                }
                catch
                {
                    model.data[i].TenantName = "#";
                }
            }

            return JsonConvert.SerializeObject(model);
        }

        //check duplicate role name in 1 same group
        public bool CheckDuplicatedRolename(string roleName, int tenantId, int id)
        {
            var result = (from u in _roleService.ODataQueryable() where u.RoleName.Equals(roleName) && u.TenantId.Equals(tenantId) select u).FirstOrDefault();
            if (result == null) return true;
            //check for update
            if (result.ID.Equals(id)) return true;
            return false;
        }

        #endregion

    }
}
