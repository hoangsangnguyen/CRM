using CRM.Entities.Models;
using Repository.Pattern.DataContext;
using Repository.Pattern.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using CRM.Entities.StoredProcedures;

namespace CRM.Repository.Repositories
{
    /// <summary>
    /// Tenant Respository
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 07/07/2014		thuyhk@cateno.no                Updated.        
    /// 14/07/2014		thuyhk@cateno.no                Updated.   
    /// 18/07/2014      thuyhk@cateno.n0                Updated.
    /// </summary>
    /// 
    public static class TenantRepository
    {

        // 07/07/2014    thuyhk      Check available TenantNameAlias (if not found return True)
        public static bool CheckAlias(this IRepository<crm_Tenants> repository, string alias)
        {
            bool isOK = repository
                .Queryable()
                .Where(x => x.TenantNameAlias == alias).Any();
            return !isOK;
        }

        // 14/07/2014    thuyhk      Get tenant by tenantId
        public static crm_Tenants GetTanentByAlias(this IRepository<crm_Tenants> repository, string alias)
        {
            var _tenant = repository.Queryable().Where(X => X.TenantNameAlias == alias).FirstOrDefault();
            return _tenant;
        }

        // 14/07/2014    thuyhk      Get tenant alias by tenantId
        public static string GetTanentAliasByTenantId(this IRepository<crm_Tenants> repository, int id)
        {
            try
            {
                var _tenant = repository.Queryable().Where(X => X.TenantId == id).FirstOrDefault().TenantNameAlias;
                return _tenant;
            }
            catch
            {
                return "";
            }
        }

        /// <summary>
        /// Get role by user id
        /// </summary>
        /// <param name="repository">repository object</param>
        /// <param name="idUser">id of user</param>
        /// <returns>list of role</returns>
        public static IEnumerable<crm_Tenants> GetAllTenant(this IRepository<crm_Tenants> repository)
        {
            IEnumerable<crm_Tenants> query;

            query = repository.Queryable().AsEnumerable();

            return query;
        }

        /// <summary>
        ///  Get detail tenantby tenantId
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static crm_Tenants GetTenantByTenantId(this IRepository<crm_Tenants> repository, int id)
        {
            var _tenant = repository.Queryable().Where(x => x.TenantId == id).FirstOrDefault();
            return _tenant;
        }
    }
}
