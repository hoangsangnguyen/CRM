using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;
using Repository.Pattern.Repositories;
using Service.Pattern;
using CRM.Service;
using CRM.Repository.Repositories;


namespace CRM.Service
{
    /// <summary>
    /// TenantService
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 07/07/2014		thuyhk@cateno.no                Created.        
    /// 14/07/2014		thuyhk@cateno.no                Updated.  
    /// </summary>
    /// 

    public class TenantService: Service<crm_Tenants>, ITenantService
    {
        private readonly IRepositoryAsync<crm_Tenants> _repository;

        public TenantService(IRepositoryAsync<crm_Tenants> repository): base(repository)
        {
            _repository = repository;
        }

        // 07/07/2014   thuyhk
        public bool CheckAlias(string alias)
        {
            return _repository.CheckAlias(alias);
        }

        // 14/07/2014   thuyhk
        public crm_Tenants GetTanentByAlias(string alias)
        {
            return _repository.GetTanentByAlias(alias);
        }
        public IEnumerable<crm_Tenants> GetAllTenant()
        {
            return _repository.GetAllTenant();
        }

        // 14/07/2014   thuyhk
        public string GetTanentAliasByTenantId(int id)
        {
            return _repository.GetTanentAliasByTenantId(id);
        }

        // 18/07/2014   thuyhk
        public crm_Tenants GetTenantByTenantId(int id)
        {
            return _repository.GetTenantByTenantId(id);
        }
    }
}
