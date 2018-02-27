using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using CRM.Admin.Models;
using CRM.Core;
using System.Collections;

namespace CRM.Admin.Filters
{
    public class AuthFilter : AuthorizeAttribute
    {
        bool isAuthorize = false;

        public AuthFilter() { }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            //Variables
            bool isAllow = true;

            //Session die
            if (System.Web.HttpContext.Current.Session["UserInfo"] == null)
                return false;
            //Check user has logged in or not
            UserInfo usIn = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
            string url = httpContext.Request.RawUrl;
            if (usIn.ID > 0)
            {
                isAuthorize = true;
            }
            else
            {
                return false;
            }

            if (url.ToLower() == "/admin/roles/accessdeny")
                return true;

            //Check user has permission or not
            if (usIn.BitMask.Count <= 0)
                return false;

            //Check permission of user
            foreach (string item in GlobalFunctions.listUrlDenyByUser)
            {
                string[] arr = item.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);
                int countDeny = 0;
                //Loop all user role of logged user
                foreach(int bitMask in usIn.BitMask)
                { 
                    if(bitMask==Convert.ToInt32(arr[2]))
                    {
                        //With short URL ex:/admin/user
                        if(arr[1]=="0")
                        {
                            if (url.ToLower().Contains(arr[0].ToLower()))
                            {
                                //isAllow = false;
                                //break;
                                countDeny++;
                            }
                        }
                        else//Width full Url ex:/admin/user/index
                        {
                            if (url.ToLower() == arr[0].ToLower() || url.ToLower() == arr[0].ToLower()+"/")
                            {
                                //isAllow = false;
                                //break;
                                countDeny++;
                            }
                        }
                    }
                }
                //If all user group of user are banned it will return false
                if(countDeny==usIn.BitMask.Count)
                {
                    isAllow = false;
                    break;
                }
            }

            return isAllow;
        }

        /// <summary>
        /// Method to process when authorization is fail
        /// </summary>
        /// <param name="filterContext"></param>
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            //If user has not logged in will redirect to login page
            if (!isAuthorize)
            {
                filterContext.Result = new RedirectResult("/Common/Login");
            }
            else//if user has not enough permission will redirect to access deny page
            {
                filterContext.Result = new RedirectResult("/Admin/Roles/AccessDeny");
            }
        }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            base.OnAuthorization(filterContext);
        }
    }
}
