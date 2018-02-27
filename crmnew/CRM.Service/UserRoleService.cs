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
    public class UserRoleService: Service<crm_UserRoles>, CRM.Service.IUserRoleService
    {
        private readonly IRepositoryAsync<crm_UserRoles> _repository;

        public UserRoleService(IRepositoryAsync<crm_UserRoles> repository)
            : base(repository)
        {
            _repository = repository;
        }
        
    }
}

