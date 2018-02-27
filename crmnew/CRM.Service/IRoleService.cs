using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Repository.Pattern.Ef6;
using CRM.Entities.ViewModel;

namespace CRM.Service
{
    public interface IRoleService : IService<crm_Roles>
    {

        IEnumerable<RoleUserModel> GetUserGroupRoles(int idUser);
        crm_Roles GetRoleByID(int idRole);
        IEnumerable<crm_Roles> GetAllRoles(bool isGetLevel, bool isGetAll, int tenantID);
        IEnumerable<crm_Roles> GetAccessRight(bool isGetByTenant, int bitMask, int tenantID);
        int CheckExistRoleName(string roleName);

        int GetRoleIdByPermisstionType(int tenantId, int idType);
    }
}
