using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CRM.Admin.Models;
using WebSupergoo.ABCpdf8;

namespace CRM.Web.Controllers
{
    public class HomeController : Controller
    {
        UserInfo userInfo;
        protected override void OnActionExecuting(ActionExecutingContext ctx)
        {
            base.OnActionExecuting(ctx);
            userInfo = ctx.HttpContext.Session["UserInfo"] as UserInfo;
        }

        public ActionResult Index()
        {
            if ((System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo).ID <= 0)
            {
                return RedirectToAction("Index", "Common/Login");
            }
            else
            {
                return RedirectToRoute(
                        "Admin_Default",
                        new
                        {
                            controller = "Dashboard",
                            action = "Index"

                        });
            }

        }
        //private byte[] CreatePdfContent()
        //{
        //Doc doc = new Doc();
        //    return new []byte ();
        //doc.Read()
        //}


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}