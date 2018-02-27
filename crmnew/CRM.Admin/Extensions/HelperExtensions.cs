using CRM.Service;
using Repository.Pattern.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web;
using CRM.Admin.Models;
using CRM.Entities.Models;
using Repository.Pattern.Infrastructure;
using CRM.Entities.StoredProcedures;
using System.Data.Entity.Core.EntityClient;
using System.Data.SqlClient;
using System.Xml;
using System.Data.Entity;
using System.Configuration;
using Repository.Pattern.Ef6;


namespace CRM.Admin.Extensions
{
    /// <summary>
    /// Helper class
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 10/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    public class HelperExtensions
    {
        private UserInfo _userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
        private HttpBrowserCapabilities browser = System.Web.HttpContext.Current.Request.Browser;

        public HelperExtensions()
        {
        }

        /// <summary>
        /// Update Log
        /// </summary>
        /// <param name="logService">ILogService</param>
        /// <param name="unitOfWork">IUnitOfWork</param>
        /// <param name="component">ex: Projects</param>
        /// <param name="content">log content</param>
        /// <param name="action">1 is Insert, 2 is Update, 3 is Delete</param>
        /// <param name="isSuccess">true is success, false is fail</param>
        /// 
        public void InsertLogActive(ILogService logService, IUnitOfWork unitOfWork, string component, string content, int action, bool isSuccess)
        {

            var _entity = new crm_Logs();
            _entity.Component = component;
            _entity.Content = content;
            _entity.LogTypeActionId = action;
            _entity.IsSuccess = isSuccess;
            _entity.LoginDate = DateTime.Now;
            _entity.LogoutDate = DateTime.Now;
            if (browser.IsMobileDevice)
                _entity.Platform = "Mobile";
            else
                _entity.Platform = "Desktop";
            _entity.TenantId = _userInfo.TenanID;
            _entity.UserId = _userInfo.ID;
            _entity.DetectedIp = GetIPHelper();
            _entity.AccessBrowser = browser.Browser;
            _entity.ComputerName = GetComputernameHelper();

            logService.Insert(_entity);
            unitOfWork.SaveChanges();
        }

        public string GetIPHelper()
        {
            return System.Web.HttpContext.Current.Request.UserHostAddress;
        }

        public string GetComputernameHelper()
        {
            string ip = GetIPHelper();
            return System.Net.Dns.GetHostEntry(ip).HostName;
        }
    }
}
