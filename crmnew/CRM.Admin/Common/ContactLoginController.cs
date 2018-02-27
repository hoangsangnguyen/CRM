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
using System.ComponentModel;
using System.Linq.Expressions;
using System.IO;
using CRM.Admin.Models;
using CRM.Core;
using System.Configuration;
using Microsoft.Practices.Unity;
namespace CRM.Admin.Common
{
    public class ContactLoginController: Controller
    {
        private readonly IEmailQueuesService _emailqueuesService;
        private readonly IUserService _userService;
        private readonly IUnitOfWork _unitOfWork;
        private string ShowCaptcha = ConfigurationManager.AppSettings["ShowCaptcha"];
        public ContactLoginController([Dependency("CRMNAUnitOfWork")]  IUnitOfWork unitOfWork,
            IEmailQueuesService emailqueuesService,
            IUserService userService
         )
        {
            _unitOfWork = unitOfWork;
            _emailqueuesService = emailqueuesService;
            _userService = userService;
        }

        [HttpPost]
        public JsonResult Email(string Email,string UserName,string Captcha)
        {
            int InResult = 0;
            try
            {
                if (ShowCaptcha.ToLower().Trim() == "false")
                {
                    Captcha = Session["Captcha"].ToString();
                }
                if (Captcha ==Session["Captcha"].ToString())
                {
                crm_EmailQueues crm_emailqueues = new crm_EmailQueues();
                int IdUser = _userService.IdUser(Email);
                if (IdUser > 0)
                {
                string EmailFrom = ConfigurationManager.AppSettings["EmailFrom"];
                string EmailPassword = ConfigurationManager.AppSettings["EmailPassword"];
                string Host = ConfigurationManager.AppSettings["Host"];
                string Port = ConfigurationManager.AppSettings["Port"];
                string EmailCc = ConfigurationManager.AppSettings["EmailCc"];
                string EmailBcc = ConfigurationManager.AppSettings["EmailBcc"];
                string EmailSubject = ConfigurationManager.AppSettings["EmailSubjectForget"];
                bool EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                string ip = System.Web.HttpContext.Current.Request.UserHostAddress;
                bool Active = SendMail.SendMailWithCCAndBcc(EmailFrom, EmailPassword, Host, Convert.ToInt32(Port), EmailSubject,"", EnableSsl, Email, EmailCc, EmailBcc);
                
                    if (ModelState.IsValid)
                    {
                        crm_emailqueues.EmailFrom = EmailFrom;
                        crm_emailqueues.SendBy = IdUser;
                        crm_emailqueues.Active = Active;
                        crm_emailqueues.CreatedDate = DateTime.Now;
                        crm_emailqueues.UpdatedDate = DateTime.Now;
                        crm_emailqueues.EmailTo = Email;
                        crm_emailqueues.EmailCc = EmailCc;
                        crm_emailqueues.EmailBcc = EmailBcc;
                        crm_emailqueues.EmailSubject = EmailSubject;
                        crm_emailqueues.SenderIP = ip;
                        crm_emailqueues.IsHtmlContent = true;
                        crm_emailqueues.DisplayNameFrom = UserName;
                        _emailqueuesService.Insert(crm_emailqueues);
                        InResult = _unitOfWork.SaveChanges();
                    }
                }
                    return Json(new { Result = InResult }, JsonRequestBehavior.AllowGet);
               }
                else
                {
                    return Json(new { Result = -1 }, JsonRequestBehavior.AllowGet);
                }
                
            }
            catch (Exception)
            {
            }

            return Json(new {Result = InResult}, JsonRequestBehavior.AllowGet);
            
        }
        [HttpPost]
        public JsonResult ContactUs(string UserName, string Title, string Content)
        {
            int InResult = 0;
            try
            {
                crm_EmailQueues crm_emailqueues = new crm_EmailQueues();
                string EmailFrom = ConfigurationManager.AppSettings["EmailFrom"];
                string EmailContact = ConfigurationManager.AppSettings["EmailContact"];
                string EmailPassword = ConfigurationManager.AppSettings["EmailPassword"];
                string Host = ConfigurationManager.AppSettings["Host"];
                string Port = ConfigurationManager.AppSettings["Port"];
                string EmailCc = ConfigurationManager.AppSettings["EmailCc"];
                string EmailBcc = ConfigurationManager.AppSettings["EmailBcc"];
                string EmailSubject = ConfigurationManager.AppSettings["EmailSubjectContact"];
                bool EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                string ip = System.Web.HttpContext.Current.Request.UserHostAddress;
                bool Active = SendMail.SendMailWithCCAndBcc(EmailFrom, EmailPassword, Host, Convert.ToInt32(Port), Title, Content, EnableSsl, EmailContact, EmailCc, EmailBcc);
                if (ModelState.IsValid)
                    {
                        crm_emailqueues.EmailFrom = EmailFrom;
                        crm_emailqueues.Active = true;
                        crm_emailqueues.CreatedDate = DateTime.Now;
                        crm_emailqueues.UpdatedDate = DateTime.Now;
                        crm_emailqueues.EmailTo = EmailContact;
                        crm_emailqueues.EmailCc = EmailCc;
                        crm_emailqueues.EmailBcc = EmailBcc;
                        crm_emailqueues.EmailSubject = EmailSubject;
                        crm_emailqueues.SenderIP = ip;
                        crm_emailqueues.IsHtmlContent = true;
                        crm_emailqueues.DisplayNameFrom = UserName;
                        _emailqueuesService.Insert(crm_emailqueues);
                        InResult = _unitOfWork.SaveChanges();
                    }
                }
            
            catch (Exception)
            {


            }
            return Json(new { Result = InResult }, JsonRequestBehavior.AllowGet);
        }
    }
}
