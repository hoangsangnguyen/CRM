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
using CRM.Entities.ViewModel;
using CRM.Admin.Filters;
using CRM.Core;
using CRM.Entities.StoredProcedures;
using System.Web.Security;
using CRM.Admin.Extensions;
using CRM.Core.Providers;
using Microsoft.Practices.Unity;

namespace CRM.Admin.Controllers
{
    [AuthFilter]
    public class UserController : Controller
    {
        #region Fields
        private readonly IUserService _userService;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUserRoleService _userRoleService;
        private readonly IRoleService _roleService;
        private readonly ITenantService _tenantService;

        private readonly ILogService _logService;
        private readonly HelperExtensions _helper = new HelperExtensions();

        private static LogoModel _logoModel = new LogoModel();
        //private const int maskPermission = 1000;
        private static UserInfo userInfo;
        #endregion
        #region Constructors
        public UserController([Dependency("CRMNAUnitOfWork")]   IUnitOfWork unitOfWork, IUserService userService, IUserRoleService userRoleService, IRoleService roleService, ITenantService tenantService, ILogService logService)
        {
            _unitOfWork = unitOfWork;
            _userService = userService;
            _userRoleService = userRoleService;
            _roleService = roleService;
            _logService = logService;
            _tenantService = tenantService;

            //check role
            if (System.Web.HttpContext.Current.Session["UserInfo"] != null)
            {
                userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
            }
        }
        #endregion
        #region Ultilities


        #endregion
        #region Basic Methods
        public ActionResult List([DataSourceRequest] DataSourceRequest request, int id = 0)
        {
            int total = 0;
            /*
                @PageNum        :
	            @PageSize       :
	            @UserName       :
	            @TenantID       : 0 -> not foreign  with tenent (default is 0)
	            @TotalRows      :
             */
            //show
            int maxLogin = userInfo.BitMask.Max(i => i);
            var data = new SqlQueryExcute().GetUserByPermiss(request.Page, request.PageSize, "", id, maxLogin, out total);

            var dataSource = (from d in data
                              select new crm_UserInfo
                              {
                                  ID = d.ID,
                                  Username = d.Username,
                                  FullName = d.FullName,
                                  DisplayName = d.DisplayName,
                                  Email = d.Email,
                                  Active = d.Active,
                                  RoleName = d.RoleName,
                                  IsShowButton = (maxLogin > GetbitMaskUser(d.ID, maxLogin))
                              });

            //total = _userService.Select(null, order, null, null, null).Count();
            ViewBag.total = total;
            var result = new DataSourceResult()
            {
                Data = dataSource,
                Total = total
            };
            return Json(result);

        }
        [HttpPost]
        public ActionResult Search([DataSourceRequest] DataSourceRequest request, string keyword, int id = 0)
        {
            int total = 0;
            //show
            int maxLogin = userInfo.BitMask.Max(i => i);
            var data = new SqlQueryExcute().GetUserByPermiss(request.Page, request.PageSize, "", id, maxLogin, out total);

            var dataSource = (from d in data
                              select new crm_UserInfo
                              {
                                  ID = d.ID,
                                  Username = d.Username,
                                  FullName = d.FullName,
                                  DisplayName = d.DisplayName,
                                  Email = d.Email,
                                  Active = d.Active,
                                  RoleName = d.RoleName,
                                  IsShowButton = (maxLogin > GetbitMaskUser(d.ID, maxLogin))
                              });

            ViewBag.total = total;
            var result = new DataSourceResult()
            {
                Data = data,
                Total = total
            };

            return Json(result);
        }

        [AuthFilter]
        public ActionResult Index(int id = 0)
        {
            //check role
            if (!(userInfo.IsSA || userInfo.IsOperator))
            {
                if (userInfo.TenanID != id)
                {
                    return RedirectToAction("AccessDeny", "Roles");
                }
                else if (userInfo.IsUser && !userInfo.ID.Equals(id))
                {
                    return RedirectToAction("AccessDeny", "Roles");
                }
            }
            return View(id);
        }
        // GET: /Tenant/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //check role follow view
            int maxLogin = userInfo.BitMask.Max(i => i);
            int maxUser = GetbitMaskUser(id.Value, maxLogin);

            if (maxUser == -1) return RedirectToAction("AccessDeny", "Roles");
            if (maxLogin < maxUser)
            {
                return RedirectToAction("AccessDeny", "Roles");
            }
            //end

            var DataList = (from u in _userService.ODataQueryable()
                            where u.ID.Equals(id.Value)
                            select new crm_UserInfo
                            {
                                ID = u.ID,
                                FullName = u.FullName,
                                Username = u.Username,
                                DisplayName = u.DisplayName,
                                Email = u.Email,
                                Active = u.Active,
                                Phone = u.Phone,
                                Mobile = u.Mobile,
                                Image = u.Image,
                                FacebookURL = u.FacebookURL,
                                TwitterURL = u.TwitterURL,
                                LinkedURL = u.LinkedURL,
                                GoogleplusURL = u.GoogleplusURL,
                                TenantId = u.TenantId,
                            });
            crm_UserInfo crm_UserInfo = DataList.FirstOrDefault();
            crm_UserInfo.RoleName = RoleName(crm_UserInfo.ID);

            if (crm_UserInfo == null)
            {
                return HttpNotFound();
            }
            return View(crm_UserInfo);
        }

        //check user name Exitst
        [HttpPost]
        public JsonResult DoesUserNameExist(string UserName)
        {
            var user = _userService.ODataQueryable().Where(x => x.Username.Equals(UserName));
            return Json(user.Count() == 0);
        }
        // GET: /Tenant/Create
        public ActionResult Create(int id = 0)
        {
            int maxLogin = userInfo.BitMask.Max(i => i);
            //check role
            if (!userInfo.IsSA)
            {
                if (id == 0 && userInfo.IsOperator)
                {
                    return RedirectToAction("AccessDeny", "Roles");
                }
                else
                {
                    List<int> lstRoles = new List<int>();
                    foreach (UserGroupEnum item in Enum.GetValues(typeof(UserGroupEnum)))
                    {
                        if (maxLogin > Convert.ToInt32(item))
                        {
                            lstRoles.Add(Convert.ToInt32(item));
                        }
                    }
                    if (lstRoles.Count() == 0) { return RedirectToAction("AccessDeny", "Roles"); }
                }
            }


            var model = new UsersModel();

            var temp = _roleService.ODataQueryable().Where(x => x.TenantId.Equals(id) && x.PermissionType < maxLogin);
            if (id == 0)
            {
                model.crm_Roles = temp.Where(x => x.PermissionType >= (int)UserGroupEnum.Operator).ToList();
            }
            else
            {
                model.crm_Roles = temp.Where(x => x.PermissionType < (int)UserGroupEnum.Operator).ToList();
            }
            model.TenantId = id;

            return View(model);

        }

        // POST: /Tenant/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(UsersModel usersModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (!string.IsNullOrEmpty(_logoModel.FileName) && usersModel.Image != _logoModel.FileName)
                    {
                        usersModel.Image = _logoModel.FileName;
                        _logoModel = null;
                    }

                    var roleID = usersModel.SelectedRoleIds;

                    string encryptPassword = "";
                    string passwordSalt = "";
                    passwordSalt = EncryptProvider.GenerateSalt();
                    encryptPassword = EncryptProvider.EncryptPassword(usersModel.Password, passwordSalt);

                    usersModel.CreatedDate = DateTime.Now;
                    usersModel.PasswordSalt = passwordSalt;
                    usersModel.Password = encryptPassword;

                    if (usersModel.TenantId == 0)
                        usersModel.TenantId = usersModel.ID;

                    var _userEntity = usersModel.ToEntity();
                    _userService.Insert(_userEntity);

                    _unitOfWork.SaveChanges();

                    //insert role for table userRoles
                    var crm_UserRoles = new crm_UserRoles();
                    crm_UserRoles.RoleID = roleID;
                    crm_UserRoles.UserID = _userEntity.ID;
                    _userRoleService.Insert(crm_UserRoles);

                    _unitOfWork.SaveChanges();

                    //note log
                    _helper.InsertLogActive(_logService, _unitOfWork, "User", "Insert new user", 1, true);

                    if (usersModel.TenantId != 0)
                        return RedirectToAction("Index", "User", new { area = "Admin", id = usersModel.TenantId });

                    return RedirectToAction("Index");

                }
                return View(usersModel);
            }
            catch (Exception ex)
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "User", "Insert new user:" + ex.ToString(), 1, false);
                return RedirectToAction("Index");
            }
        }

        // GET: /Tenant/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //crm_Users crm_Users = _userService.Find(id);
            //check role follow edit
            int maxLogin = userInfo.BitMask.Max(i => i);
            int maxUser = GetbitMaskUser(id.Value, maxLogin);
            if (maxUser == -1) return RedirectToAction("AccessDeny", "Roles");
            if (maxLogin == maxUser)
            {
                if (!userInfo.ID.Equals(id))
                {
                    return RedirectToAction("AccessDeny", "Roles");
                }
            }
            else if (maxLogin < maxUser)
            {
                return RedirectToAction("AccessDeny", "Roles");
            }
            //end
            crm_Users crm_Users = _userService.ODataQueryable().Where(x => x.ID.Equals(id.Value)).ToList().FirstOrDefault();
            UsersModel usersModel = crm_Users.ToModel();

            var temp = _roleService.ODataQueryable().Where(x => x.TenantId.Equals(usersModel.TenantId) && x.PermissionType <= maxLogin);
            if (usersModel.TenantId.Equals(0))
            {
                usersModel.crm_Roles = temp.Where(x => x.PermissionType >= (int)UserGroupEnum.Operator).ToList();
            }
            else
            {
                usersModel.crm_Roles = temp.Where(x => x.PermissionType < (int)UserGroupEnum.Operator).ToList();
            }

            usersModel.crm_UserRoles = _userRoleService.ODataQueryable().Where(x => x.UserID.Value.Equals(id.Value));
            usersModel.SelectedRoleIds = usersModel.crm_UserRoles.FirstOrDefault().RoleID.Value;



            if (usersModel == null)
            {
                return HttpNotFound();
            }
            return View(usersModel);
        }
        public ActionResult EditLogo(string userId, string linked, string twitter, string facebook, string google)
        {
            try
            {
                int id = Convert.ToInt32(userId);
                //var crm_users = _userService.Find(id);
                crm_Users crm_Users = _userService.ODataQueryable().Where(x => x.ID.Equals(id)).FirstOrDefault();

                if (!string.IsNullOrEmpty(_logoModel.FileName))
                {
                    crm_Users.Image = _logoModel.FileName;
                    _logoModel = null;
                }
                crm_Users.LinkedURL = linked;
                crm_Users.FacebookURL = facebook;
                crm_Users.TwitterURL = twitter;
                crm_Users.GoogleplusURL = google;
                crm_Users.UpdatedDate = DateTime.Now;

                crm_Users.ObjectState = ObjectState.Modified;
                _userService.Update(crm_Users);
                _unitOfWork.SaveChanges();

                _helper.InsertLogActive(_logService, _unitOfWork, "User", "update avatar of user success", 2, true);
                return Content("Update success!");
            }
            catch (Exception ex)
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "User", "update avatar of user :" + ex.ToString(), 2, false);
                return Content("Update fail!");
            }
        }

        // POST: /Tenant/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(UsersModel crm_Users)
        {
            try
            {
                var _user = _userService.ODataQueryable().Where(x => x.ID.Equals(crm_Users.ID)).FirstOrDefault();
                if (_user != null)
                {
                    if (crm_Users.FullName != _user.FullName)
                        _user.FullName = crm_Users.FullName;

                    if (crm_Users.DisplayName != _user.DisplayName)
                        _user.DisplayName = crm_Users.DisplayName;

                    if (crm_Users.Email != _user.Email)
                        _user.Email = crm_Users.Email;

                    if (crm_Users.Phone != _user.Phone)
                        _user.Phone = crm_Users.Phone;

                    if (crm_Users.Mobile != _user.Mobile)
                        _user.Mobile = crm_Users.Mobile;

                    if (!crm_Users.ID.Equals(userInfo.ID))
                        if (crm_Users.Active != _user.Active)
                            _user.Active = crm_Users.Active;

                    if (crm_Users.FacebookURL != _user.FacebookURL)
                        _user.FacebookURL = crm_Users.FacebookURL;
                    if (crm_Users.LinkedURL != _user.LinkedURL)
                        _user.LinkedURL = crm_Users.LinkedURL;
                    if (crm_Users.TwitterURL != _user.TwitterURL)
                        _user.TwitterURL = crm_Users.TwitterURL;
                    if (crm_Users.GoogleplusURL != _user.GoogleplusURL)
                        _user.GoogleplusURL = crm_Users.GoogleplusURL;

                    _user.UpdatedDate = DateTime.Now;

                    //insert role for table userRoles
                    var crm_UserRoles = _userRoleService.ODataQueryable().Where(x => x.UserID.Value.Equals(crm_Users.ID)).FirstOrDefault();
                    if (crm_UserRoles != null)
                    {
                        if (crm_UserRoles.RoleID != crm_Users.SelectedRoleIds)
                            crm_UserRoles.RoleID = crm_Users.SelectedRoleIds;

                        crm_UserRoles.ObjectState = ObjectState.Modified;
                        _userRoleService.Update(crm_UserRoles);
                    }
                    //update user

                    _user.ObjectState = ObjectState.Modified;
                    _userService.Update(_user);
                    _unitOfWork.SaveChanges();

                    _helper.InsertLogActive(_logService, _unitOfWork, "User", "update user success:", 2, true);

                    if (userInfo.IsUser && _user.ID.Equals(userInfo.ID))
                        return RedirectToAction("Edit", "User", new { area = "Admin", id = _user.ID });

                    if (_user.TenantId != 0)
                        return RedirectToAction("Index", "User", new { area = "Admin", id = _user.TenantId });
                    return RedirectToAction("Index");
                }

                return View(crm_Users);
            }
            catch (Exception ex)
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "User", "update user :" + ex.ToString(), 2, false);
                return View("");
            }
        }
        // GET: /Tenant/changePass/5
        [HttpPost, ActionName("ChangePass")]
        public ActionResult ChangePass(int id, string user, string passOld, string passNew)
        {
            try
            {
                crm_Users crm_Users = _userService.Select().Where(x => x.ID.Equals(id)).FirstOrDefault();
                bool login = EncryptProvider.EncryptPassword(passOld, crm_Users.PasswordSalt).Equals(crm_Users.Password);
                if (login && crm_Users.Username.Equals(user))
                {
                    string encryptPassword = "";
                    string passwordSalt = "";
                    passwordSalt = EncryptProvider.GenerateSalt();
                    encryptPassword = EncryptProvider.EncryptPassword(passNew, passwordSalt);

                    crm_Users.PasswordSalt = passwordSalt;
                    crm_Users.Password = encryptPassword;

                    crm_Users.ObjectState = ObjectState.Modified;
                    _userService.Update(crm_Users);
                    _unitOfWork.SaveChanges();
                }
                else
                {
                    return Json(new { Status = -1, Message = "Password old not correct!" });
                }

                _helper.InsertLogActive(_logService, _unitOfWork, "User", "change password succes.", 2, true);

                return Json(new { Status = 0 });
            }
            catch (Exception ex)
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "User", "change password :" + ex.ToString(), 2, false);
                return null;
            }
        }

        // GET: /Tenant/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            crm_Users crm_Users = _userService.Find(id);
            if (crm_Users == null)
            {
                return HttpNotFound();
            }
            return View(crm_Users);
        }

        [HttpPost, ActionName("DeleteRecords")]
        public ActionResult DeleteRecords(List<int> ids)
        {
            //optimize later
            foreach (var id in ids)
            {
                crm_Users crm_Users = _userService.Find(id);
                _userService.Delete(crm_Users);
                _unitOfWork.SaveChanges();
            }
            // return 0 /1
            return Json(new { Status = 0 });
        }

        // POST: /Tenant/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                //check role follow view
                int maxLogin = userInfo.BitMask.Max(i => i);
                int maxUser = GetbitMaskUser(id, maxLogin);
                if (maxLogin <= maxUser)
                {
                    return Json(new { Status = -1, Message = "You do not have permission!" });
                }

                crm_Users crm_Users = _userService.Select().Where(x => x.ID.Equals(id)).FirstOrDefault();
                List<crm_UserRoles> crm_UserRoles = _userRoleService.Select().Where(x => x.UserID.Value.Equals(id)).ToList();

                foreach (var item in crm_UserRoles)
                {
                    _userRoleService.Delete(item);
                }
                _userService.Delete(crm_Users);
                _unitOfWork.SaveChanges();

                _helper.InsertLogActive(_logService, _unitOfWork, "User", "Delete user success.", 3, true);

                return Json(new { Status = 0 });
            }
            catch (Exception ex)
            {
                _helper.InsertLogActive(_logService, _unitOfWork, "User", "Delete user :" + ex.ToString(), 3, false);
                return Json(new { Status = -1, Message = "delete fail." });
            }
        }
        #endregion
        #region Methods
        //Login sudo
        [HttpPost, ActionName("SudoLogin")]
        public ActionResult SudoLogin(int id, string userName, string password)
        {
            try
            {
                UserInfo userinfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
                {
                    List<crm_Users> user = new List<crm_Users>();

                    var _Userlogin = _userService.ODataQueryable().Where(x => x.ID.Equals(userinfo.ID)).ToList();
                    var passOld = EncryptProvider.EncryptPassword(password, _Userlogin[0].PasswordSalt);

                    var userSuport = _userService.CheckUserLogin(userinfo.UserName, passOld);

                    if (userSuport.Count > 0)
                    {
                        user = _userService.ODataQueryable().Where(x => x.ID.Equals(id)).ToList();
                        if (user.Count > 0 && user[0].Username.Equals(userName))
                        {
                            userinfo = new UserInfo();

                            userinfo.ID = user[0].ID;
                            userinfo.UserName = user[0].Username;
                            userinfo.DisplayName = user[0].DisplayName;
                            userinfo.Email = user[0].Email;
                            userinfo.TenanID = user[0].TenantId;
                            userinfo.FullName = user[0].FullName;
                            userinfo.Image = user[0].Image;
                            userinfo.Active = user[0].Active;
                            var list = _roleService.GetUserGroupRoles(userinfo.ID).ToList();
                            userinfo.BitMask = new List<int>();
                            foreach (var item in list)
                            {
                                int tempBitMask = GlobalFunctions.GetBitMaskOfUser(item.MaskPermission.Value);
                                userinfo.BitMask.Add(tempBitMask);
                                CheckPermUser(tempBitMask, ref userinfo);
                            }
                            System.Web.HttpContext.Current.Session["UserInfo"] = userinfo;
                            Session["LogOn"] = userName;//model.UserName;

                            if (!userinfo.IsOperator && userinfo.IsUser)
                            {
                                return Json(new { Status = 0, Message = "user" });
                            }
                            else
                                return Json(new { Status = 0, Message = "other" });
                        }
                    }
                    else
                    {
                        return Json(new { Status = -1, Message = "Password old not correct!" });
                    }

                }
                return Json(new { Status = -1, Message = "Password old not correct!" });
            }
            catch (Exception ex)
            {
                ex.ToString();
                return Json(new { Status = -1, Message = "Password old not correct!" });
            }
        }
        //upload file : auto save avatar
        public ActionResult SaveLogoUpload(HttpPostedFileBase file)
        {
            if (file != null)
            {
                // Upload file in to UploadFolder
                var _fileName = Path.GetFileName(file.FileName);
                var _pathFile = "/images/avatar";
                var _physhicalPath = Path.Combine(Server.MapPath(_pathFile), _fileName);
                if (System.IO.File.Exists(_physhicalPath))
                    _physhicalPath = Path.Combine(Server.MapPath(_pathFile), _fileName);
                _logoModel = new LogoModel() { FileName = _fileName, PictureUrl = _pathFile + "/" + _fileName };
                file.SaveAs(_physhicalPath);
            }
            return Json(_logoModel, JsonRequestBehavior.AllowGet);
        }

        public ActionResult RemoveLogoUpload()
        {
            var _pathFile = "/images/avatar";
            var physicalPath = string.Format("{0}/{1}", Server.MapPath(_pathFile), _logoModel.FileName);
            if (System.IO.File.Exists(physicalPath))
                System.IO.File.Delete(physicalPath);
            _logoModel = null;
            return Json("");
        }

        //get name by userId
        private string RoleName(int idUser)
        {
            string result = string.Empty;
            var query = (from ul in _userRoleService.Select()
                         join r in _roleService.Select() on ul.RoleID equals r.ID
                         where ul.UserID.Value.Equals(idUser)
                         select new
                         {
                             RoleName = r.RoleName
                         });
            if (query == null) return null;
            foreach (var item in query)
            {
                result += item.RoleName + ", ";
            }

            return result.Trim().TrimEnd(',');
        }

        // Count user by tenant
        public ActionResult Countuser(int tenantId)
        {
            int Countuser = 0;
            if (userInfo.IsOperator && !userInfo.IsSA && tenantId == 0)
            {
                Countuser = (from u in _userService.ODataQueryable().Where(x => x.TenantId == tenantId).ToList()
                             join ul in _userRoleService.Select() on u.ID equals ul.UserID
                             join r in _roleService.Select() on ul.RoleID equals r.ID
                             where userInfo.BitMask.Contains(r.PermissionType ?? 0)
                             select new
                              {
                                  Username = u.Username
                              }).GroupBy(x => x.Username).Count();
            }
            else
            {
                Countuser = _userService.ODataQueryable().Where(x => x.TenantId == tenantId).Count();
            }

            List<int> lst = new List<int>();
            lst.Add(tenantId);
            lst.Add(Countuser);

            return PartialView(lst);
        }
        //get max bit mask of user
        private int GetbitMaskUser(int id, int maxLogin)
        {
            var query = (from ul in _userRoleService.Select()
                         join r in _roleService.Select() on ul.RoleID equals r.ID
                         where ul.UserID.Value.Equals(id) && r.PermissionType <= maxLogin
                         select new
                         {
                             PermissionType = r.PermissionType
                         }).ToList();
            if (query.Count == 0) return -1;
            int maxUser = query.Max(x => x.PermissionType ?? 0);
            return maxUser;
        }
        /// <summary>
        /// DaoNV:Check permission to add into user information variable
        /// </summary>
        /// <param name="bitMask">bitmask of user</param>
        /// <param name="usInfo">userinfor variables</param>

        private void CheckPermUser(int bitMask, ref UserInfo usInfo)
        {
            switch (bitMask)
            {
                case (int)UserGroupEnum.SA: usInfo.IsSA = true; break;
                case (int)UserGroupEnum.Operator: usInfo.IsOperator = true; break;
                case (int)UserGroupEnum.TenantAdmin: usInfo.IsTenant = true; break;
                case (int)UserGroupEnum.Manager: usInfo.IsManager = true; break;
                case (int)UserGroupEnum.Marketing: usInfo.IsMarketing = true; break;
                case (int)UserGroupEnum.Support: usInfo.IsSupport = true; break;
                case (int)UserGroupEnum.Sales: usInfo.IsSales = true; break;
                default: usInfo.IsUser = true; break;
            }
        }

        // 18.07.2014   thuyhk
        public ActionResult _GetInfoUser(string userId)
        {
            var _userId = Convert.ToInt32(userId);
            var _entityUser = _userService.GetUserById(_userId);
            var _modelUser = _entityUser.ToModel();
            return PartialView(_modelUser);
        }

        // 22.07.2014   thuyhk
        public ActionResult _ContactCompanyProfile(string userId)
        {
            var _userId = Convert.ToInt32(userId);
            var _entityUser = _userService.GetUserById(_userId);
            var _modelUser = _entityUser.ToModel();
            return PartialView(_modelUser);
        }

        //check email duplicated
        [HttpPost]
        public JsonResult CheckDuplicatedEmail(string Email, int ID)
        {
            var result = (from u in _userService.ODataQueryable() where u.Email.Equals(Email) select u).FirstOrDefault();
            if (result == null) return Json(true);
            if (result.ID.Equals(ID)) return Json(true);
            return Json(false);
        }

        //check ContactEmail duplicated
        [HttpPost]
        public JsonResult CheckDuplicatedContactEmail(string ContactEmail)
        {
            var result = (from u in _userService.ODataQueryable() where u.Email.Equals(ContactEmail) select u).FirstOrDefault();
            if (result == null) return Json(true);
            return Json(false);
        }

        // 18.07.2014   thuyhk
        public ActionResult _GetLogoTenant()
        {
            var _tenant = _tenantService.GetTenantByTenantId(userInfo.TenanID);
            var imgUrl = _tenant.CompanyLogo;
            return PartialView(imgUrl);
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
