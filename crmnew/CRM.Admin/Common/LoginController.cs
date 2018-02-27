using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using CRM.Admin.Models;
using CRM.Service;
using Repository.Pattern.UnitOfWork;
using System.Web;
using System.Web.Security;
using Newtonsoft.Json;
using System.Net;
using Microsoft.Owin.Security;
using Microsoft.AspNet.Identity;
using Authentication.Models;
using CRM.Entities.Models;
using System.Security.Claims;
using Security.DAL.Security;
using CRM.Core;
using CRM.Controls;
using System.IO;
using System.Drawing;
using System.Configuration;
using CRM.Entities.Extensions;
using CRM.Core.Providers;
using Microsoft.Practices.Unity;
using Repository.Pattern.Ef6;


namespace CRM.Admin.Common
{

    public class LoginController : Controller
    {
        // GET: /Login/
        private readonly IUserService _userService;
        private readonly IUnitOfWork _unitOfWork;
        private readonly ITenantService _tenantService;
        private readonly IRoleService _roleService;
        private readonly IPhraseLanguageService _phraselanguage;
        private EntityHelpers _entityHelper = new EntityHelpers();
        private UserInfo userinfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
        private string ShowCaptcha = ConfigurationManager.AppSettings["ShowCaptcha"];
        private string LanguageCode = ConfigurationManager.AppSettings["Language_Code"];
        public LoginController([Dependency("CRMNAUnitOfWork")]  IUnitOfWork unitOfWork, ITenantService tenantService,
            IUserService userService, IRoleService roleService, IPhraseLanguageService phraselanguage)
        {
            _unitOfWork = unitOfWork;
            _tenantService = tenantService;
            _userService = userService;
            _roleService = roleService;
            _phraselanguage = phraselanguage;

        }

        public ActionResult Index(string msg = "")
        {
            TempData["ShowCaptcha"] = ShowCaptcha;
            TempData["LanguageCode"] = LanguageCode;
            if (ShowCaptcha.Trim().ToLower() == "false")
            {
                HttpCookie CapCookie = new HttpCookie("EnableCaptcha") { Value = "0", Expires = DateTime.Now.AddDays(15) };
                Response.Cookies.Add(CapCookie);
            }
            else
            {
                HttpCookie CapCookie = new HttpCookie("EnableCaptcha") { Value = "1", Expires = DateTime.Now.AddDays(15) };
                Response.Cookies.Add(CapCookie);
            }
            HttpCookie LanguageCookie = new HttpCookie("LanguageCode") { Value = LanguageCode, Expires = DateTime.Now.AddDays(30) };
            Response.Cookies.Add(LanguageCookie);
            System.Web.HttpContext.Current.Session["UserInfo"] = new UserInfo();
            return View("Index");
        }

        public UserManager<ApplicationUser> UserManager { get; private set; }

        [HttpPost]
        public async Task<ActionResult> LogOn(LoginModels model, string returnUrl)
        {
            //variables
            crm_Users userLogin = null;
            crm_Tenants tenant = null;
            try
            {
                TempData["ShowCaptcha"] = ShowCaptcha;
                if (ModelState.IsValid)
                {
                    if (ShowCaptcha.Trim().ToLower() == "false")
                    {
                        model.Captcha = Session["Captcha"].ToString();

                    }

                    if (model.Captcha == Session["Captcha"].ToString())
                    {
                        userLogin = _userService.GetUserByUsername(model.UserName);
                        if (userLogin == null)
                        {
                            ModelState.AddModelError("", Caching.GetValue("Global.Login.lblUserNameOrPasswordError"));
                            return View("Index", model);
                        }
                        //Encrypt password
                        string passwordEncrypt = EncryptProvider.EncryptPassword(model.Password, userLogin.PasswordSalt);
                        List<crm_Users> user = new List<crm_Users>();
                        user = _userService.CheckUserLogin(model.UserName, passwordEncrypt);
                        if (user.Count > 0)
                        {
                            FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                            userinfo.TenantAlias = _tenantService.GetTanentAliasByTenantId(user[0].TenantId);
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
                            if (model.RememberMe)
                            {

                                HttpCookie faCookie = new HttpCookie("Remember") { Value = "1", Expires = DateTime.Now.AddDays(15) };
                                Response.Cookies.Add(faCookie);
                                faCookie = new HttpCookie("Info") { Value = "{\"US\":\"" + model.UserName + "\", \"PW\":\"" + model.Password + "\"}", Expires = DateTime.Now.AddDays(15) };
                                Response.Cookies.Add(faCookie);


                            }
                            else
                            {
                                HttpCookie faCookie = new HttpCookie("Remember") { Value = "0", Expires = DateTime.Now.AddDays(15) };
                                Response.Cookies.Add(faCookie);
                            }

                            Session["LogOn"] = model.UserName;

                            //check role
                            bool isTenantAdmin = false;
                            foreach (int bitMask in userinfo.BitMask)
                            {
                                if (bitMask == (int)UserGroupEnum.TenantAdmin)
                                {
                                    isTenantAdmin = true;
                                }
                            }

                            if (isTenantAdmin)
                            {
                                var _alias = _tenantService.GetTanentAliasByTenantId(userinfo.TenanID);
                                var _tenantInfo = _tenantService.GetTanentByAlias(_alias);

                                _entityHelper.SetConnectionString(ConfigurationManager.AppSettings["ServerName"].ToString(), _tenantInfo.DbName, _tenantInfo.DbUsername, _tenantInfo.DbPassword);
                            }

                            return RedirectToRoute("Admin_Default", new { controller = "Dashboard", action = "Index" });

                        }
                        else
                        {
                            ModelState.AddModelError("", Caching.GetValue("Global.Login.lblUserNameOrPasswordError"));
                        }

                    }
                    else
                    {
                        ModelState.AddModelError("", Caching.GetValue("Global.Login.lblSecurityCodeError"));
                    }

                }
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }

            return View("Index", model);
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

        public ActionResult GenerateCaptcha()
        {

            RandomImage randomimage = new RandomImage();
            string s = randomimage.GenerateRandomCode();
            Session["Captcha"] = s;
            FileContentResult imgstream = null;
            RandomImage img = new RandomImage(this.Session["captcha"].ToString(), 300, 75);
            var mem = new MemoryStream();
            img.Image.Save(mem, System.Drawing.Imaging.ImageFormat.Jpeg);
            imgstream = this.File(mem.GetBuffer(), "image/Jpeg");
            img.Dispose();
            return imgstream;
        }

        private async Task SignInAsync(ApplicationUser user, bool isPersistent)
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            var identity = await UserManager.CreateIdentityAsync(user, DefaultAuthenticationTypes.ApplicationCookie);
            AuthenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, identity);
        }

        // POST: /Common/LogOff
        public ActionResult LogOff()
        {
            Session["LogOn"] = null;
            System.Web.HttpContext.Current.Session["UserInfo"] = new UserInfo();
            AuthenticationManager.SignOut();
            return RedirectToAction("Index", "login");
        }

        /* Exten login*/
        // POST: /Login/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {

            return new ChallengeResult(provider, Url.Action("ExternalLogingComformPassword", "Login", new { ReturnUrl = returnUrl }));
        }
        //Exists URL 
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLogingComformPassword(ExternalLoginConfirmationPasswordViewModel model, string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            //Check URL 
            var user = _userService.CheckURL(loginInfo.Login.LoginProvider, loginInfo.Login.ProviderKey);
            if (user.Count > 0)
            {
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
                Session["LogOn"] = user[0].Username;
                return RedirectToRoute(
                            "Admin_Default",
                            new
                            {
                                controller = "Dashboard",
                                action = "Index"

                            });

            }
            else
            {
                Session["UserExternal"] = loginInfo.DefaultUserName;
                Session["Provider"] = loginInfo.Login.LoginProvider;
                return View("ExternalLoginConfirmationPassword");
            }

            //return View("Index");

        }
        // GET: /Login/ExternalLoginCallback
        // Not exists URL 
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(ExternalLoginConfirmationPasswordViewModel model, string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                return RedirectToRoute(
                    "Common_Default",
                    new
                    {
                        controller = "Login",
                        action = "Index"

                    });
            }
            //Update URL  for user
            //Encrypt password
            crm_Users userLogin = new crm_Users();
            userLogin = _userService.GetUserByUsername(model.UserName);
            if (userLogin == null)
            {
                TempData["Msg"] = "User not exists in the system";
                return RedirectToAction("Index", "Login");
            }
            string passwordEncrypt = EncryptProvider.EncryptPassword(model.Password, userLogin.PasswordSalt);
            List<crm_Users> crm_user = new List<crm_Users>();
            crm_user = _userService.CheckUserLogin(model.UserName, passwordEncrypt);
            if (crm_user.Count > 0)
            {

                var provider = loginInfo.Login.LoginProvider;
                var url = loginInfo.Login.ProviderKey;

                switch (provider.ToLower())
                {
                    case "google":
                        {
                            crm_user[0].GoogleplusURL = url;
                            break;
                        }
                    case "facebook":
                        {
                            crm_user[0].FacebookURL = url;

                            break;
                        }
                    case "twitter":
                        {
                            crm_user[0].TwitterURL = url;

                            break;
                        }
                    case "linkedin":
                        {
                            crm_user[0].LinkedURL = url;
                            break;
                        }

                }
                //crm_user[0].ConfirmPassword = crm_user[0].Password;
                _userService.Update(crm_user[0]);
                int Result = _unitOfWork.SaveChanges();
                if (Result > 0)
                {

                    userinfo.ID = crm_user[0].ID;
                    userinfo.UserName = crm_user[0].Username;
                    userinfo.DisplayName = crm_user[0].DisplayName;
                    userinfo.Email = crm_user[0].Email;
                    userinfo.TenanID = crm_user[0].TenantId;
                    userinfo.FullName = crm_user[0].FullName;
                    userinfo.Image = crm_user[0].Image;
                    userinfo.Active = crm_user[0].Active;
                    var list = _roleService.GetUserGroupRoles(userinfo.ID).ToList();
                    userinfo.BitMask = new List<int>();
                    foreach (var item in list)
                    {
                        int tempBitMask = GlobalFunctions.GetBitMaskOfUser(item.MaskPermission.Value);
                        userinfo.BitMask.Add(tempBitMask);
                        CheckPermUser(tempBitMask, ref userinfo);

                    }
                    System.Web.HttpContext.Current.Session["UserInfo"] = userinfo;
                    Session["LogOn"] = crm_user[0].Username;

                    return RedirectToRoute(
                            "Admin_Default",
                            new
                            {
                                controller = "Dashboard",
                                action = "Index"

                            });
                }
            }
            TempData["Msg"] = "User not exists in the system";
            return RedirectToAction("Index", "Login");

        }

        // POST: /Account/LinkLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LinkLogin(string provider)
        {
            // Request a redirect to the external login provider to link a login for the current user
            return new ChallengeResult(provider, Url.Action("LinkLoginCallback", "Login"), User.Identity.GetUserId());
        }
        // GET: /Account/LinkLoginCallback
        public async Task<ActionResult> LinkLoginCallback()
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync(XsrfKey, User.Identity.GetUserId());
            if (loginInfo == null)
            {
                return RedirectToAction("Manage", new { Message = ManageMessageId.Error });
            }
            var result = await UserManager.AddLoginAsync(User.Identity.GetUserId(), loginInfo.Login);
            if (result.Succeeded)
            {
                return RedirectToAction("Manage");
            }
            return RedirectToAction("Manage", new { Message = ManageMessageId.Error });
        }

        //
        // POST: /Account/ExternalLoginConfirmation
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Manage");
            }

            if (ModelState.IsValid)
            {
                // Get the information about the user from the external login provider
                var info = await AuthenticationManager.GetExternalLoginInfoAsync();
                if (info == null)
                {
                    return View("ExternalLoginFailure");
                }
                crm_Users crm_user = new crm_Users();
                crm_user.Username = model.UserName;
                crm_user.FullName = model.UserName;
                var provider = info.Login.LoginProvider;
                var url = info.Login.ProviderKey;

                switch (provider.ToLower())
                {
                    case "google":
                        {
                            crm_user.GoogleplusURL = url;
                            break;
                        }
                    case "facebook":
                        {
                            crm_user.FacebookURL = url;

                            break;
                        }
                    case "twitter":
                        {
                            crm_user.TwitterURL = url;

                            break;
                        }
                    case "linkedin":
                        {
                            crm_user.LinkedURL = url;
                            break;
                        }

                }
                _userService.Insert(crm_user);
                int InResult = _unitOfWork.SaveChanges();
                if (InResult == 1)
                {
                    Session["LogOn"] = model.UserName;
                    return RedirectToRoute(
                        "Admin_Default",
                        new
                        {
                            controller = "Dashboard",
                            action = "Index"

                        });
                }

            }

            ViewBag.ReturnUrl = returnUrl;
            return RedirectToRoute(
                        "Admin_Default",
                        new
                        {
                            controller = "Dashboard",
                            action = "Index"

                        });
        }



        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult RemoveAccountList()
        {
            var linkedAccounts = UserManager.GetLogins(User.Identity.GetUserId());
            ViewBag.ShowRemoveButton = HasPassword() || linkedAccounts.Count > 1;
            return (ActionResult)PartialView("_RemoveAccountPartial", linkedAccounts);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && UserManager != null)
            {
                UserManager.Dispose();
                UserManager = null;
            }
            base.Dispose(disposing);
        }


        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }



        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private bool HasPassword()
        {
            var user = UserManager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                return user.PasswordHash != null;
            }
            return false;
        }

        public enum ManageMessageId
        {
            ChangePasswordSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            Error
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        public JsonResult GetValue(string phrasename)
        {
            string s = Caching.GetValue(phrasename);
            return Json(new { Value = s }, JsonRequestBehavior.AllowGet);

        }

        private class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties() { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }

    }


}
