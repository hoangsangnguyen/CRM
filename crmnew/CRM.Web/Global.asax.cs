using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using CRM.Admin.Models;
using CaptchaMvc.Infrastructure;
using System.Configuration;

namespace CRM.Web
{
    public class MvcApplication : System.Web.HttpApplication
    {
        
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            
        }

        void Session_Start(object sender, EventArgs e)
        {
            System.Web.HttpContext.Current.Session.Add("UserInfo", new UserInfo());
        }
    }
}
