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
using CRM.Entities.ViewModel;

namespace CRM.Service
{
    public class RoleService : Service<crm_Roles>, IRoleService
    {
        private readonly IRepositoryAsync<crm_Roles> _repository;

        public RoleService(IRepositoryAsync<crm_Roles> repository)
            : base(repository)
        {
            _repository = repository;
        }


        public IEnumerable<RoleUserModel> GetUserGroupRoles(int idUser)
        {
            return _repository.GetUserGroupRoles(idUser);

        }

        public crm_Roles GetRoleByID(int idRole)
        {
            return _repository.GetRoleByID(idRole);
        }

        public IEnumerable<crm_Roles> GetAllRoles(bool isGetLevel, bool isGetAll, int tenantID)
        {
            return _repository.GetAllRoles(isGetLevel, isGetAll, tenantID);
        }

        public int CheckExistRoleName(string roleName)
        {
            return _repository.CheckExistRoleName(roleName);
        }

        public IEnumerable<crm_Roles> GetAccessRight(bool isGetByTenant, int bitMask, int tenantID)
        {
            return _repository.GetAccessRight(isGetByTenant, bitMask, tenantID);
        }

        public int GetRoleIdByPermisstionType(int tenantId, int idType)
        {
            return _repository.GetRoleIdByPermisstionType(tenantId, idType);
        }
    }
}
