using CRM.Admin.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using AdminN = CRM.Admin;

namespace CRM.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            #region Admim area

            
            var adminDefaults = new RouteValueDictionary();
            adminDefaults.Add("controller", "Dashboard");
            adminDefaults.Add("action", "Index");
            adminDefaults.Add("id", UrlParameter.Optional);

            var adminContrains = new RouteValueDictionary();

            var adminTokens = new RouteValueDictionary();
            adminTokens.Add("Namespaces", new string[] { typeof(AdminN.Controllers.TenantController).Namespace });
            adminTokens.Add("area", "Admin");

            routes.Add("Admin_Default",
                       new Route("admin/{controller}/{action}/{id}",
                                 adminDefaults,
                                 adminContrains,
                                 adminTokens,
                                 new MvcRouteHandler()));
            routes.MapRoute("Admin_CompanyProfiles", "admin/CompanyProfile",
                             new { action = "TenantDetail", controller = "Common", 
                                 adminContrains, 
                                 adminTokens});



            #endregion           

            #region Common area

            var commonDefaults = new RouteValueDictionary();
            commonDefaults.Add("action", "Index");
            commonDefaults.Add("id", UrlParameter.Optional);

            var commonContrains = new RouteValueDictionary();

            var commonTokens = new RouteValueDictionary();
            commonTokens.Add("Namespaces", new string[] { typeof(LoginController).Namespace });
            commonTokens.Add("area", "Common");

            routes.Add("Common_Default",
                       new Route("Common/{controller}/{action}/{id}",
                                 commonDefaults,
                                 commonContrains,
                                 commonTokens,
                                 new MvcRouteHandler()));

            #endregion

            #region tenant admin

            var tenantDefaults = new RouteValueDictionary();
            tenantDefaults.Add("controller", "tenant");
            tenantDefaults.Add("action", "Index");
            tenantDefaults.Add("alias", UrlParameter.Optional);

            var tenantContrains = new RouteValueDictionary();

            var tenantTokens = new RouteValueDictionary();
            tenantTokens.Add("Namespaces", new string[] { typeof(Web.Controllers.TenantController).Namespace });

            routes.Add("TenantAdmin",
                       new Route("{alias}",
                                 tenantDefaults,
                                 tenantContrains,
                                 tenantTokens,
                                 new MvcRouteHandler()));

            #endregion

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
