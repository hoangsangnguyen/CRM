using System;
using CRM.Entities.Models;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Repository.Pattern.Ef6;
using System.Linq;
using System.Linq.Expressions;
using System.Collections.Generic;
using System.Web.Http;
namespace CRM.Service
{
    /// <summary>
    /// ITenantService
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 07/07/2014		thuyhk@cateno.no                Created.   
    /// 14/07/2014		thuyhk@cateno.no                Updated.
    /// </summary>
    /// 
    public interface ITenantService: IService<crm_Tenants> 
    {       
        // 07/07/2014   thuyhk
        bool CheckAlias(string alias);
        
        // 14/07/2014   thuyhk
        crm_Tenants GetTanentByAlias(string alias);

        IEnumerable<crm_Tenants> GetAllTenant();

        string GetTanentAliasByTenantId(int id);

        crm_Tenants GetTenantByTenantId(int id);
    }
}
