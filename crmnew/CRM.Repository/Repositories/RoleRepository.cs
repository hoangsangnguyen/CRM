using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;
using Repository.Pattern.Repositories;
using CRM.Core;

namespace CRM.Repository.Repositories
{
    public static class RoleRepository
    {
        /// <summary>
        /// Get role by user id
        /// </summary>
        /// <param name="repository">repository object</param>
        /// <param name="idUser">id of user</param>
        /// <returns>list of role</returns>
        public static IEnumerable<crm_Roles> GetAllRoles(this IRepository<crm_Roles> repository, bool isGetLevel, bool isGetAll, int tenantID)
        {
            IEnumerable<crm_Roles> query;
            if (!isGetLevel)
            {
                if (isGetAll)
                    query = repository.Queryable().OrderByDescending(x => x.TenantId).AsEnumerable();
                else
                    query = repository.Queryable().Where(x => x.PermissionType.Value != (int)UserGroupEnum.SA).OrderByDescending(x => x.TenantId).AsEnumerable();

            }
            else
            {
                query = repository.Queryable().Where(x => x.TenantId == tenantID && x.PermissionType.Value <= (int)UserGroupEnum.TenantAdmin).OrderByDescending(x => x.TenantId).AsEnumerable();
            }

            return query;
        }

        public static IEnumerable<crm_Roles> GetAccessRight(this IRepository<crm_Roles> repository,bool isGetByTenant, int bitMask, int tenantID)
        {
            IEnumerable<crm_Roles> query;

            if(isGetByTenant)
            {
                query = repository.Queryable().Where(x => x.TenantId == tenantID && x.PermissionType.Value < bitMask).OrderByDescending(x => x.PermissionType).AsEnumerable();
            }
            else
            {
                query = repository.Queryable().Where(x=>x.PermissionType.Value < bitMask).OrderByDescending(x => x.PermissionType).AsEnumerable();
            }


            return query;
        }

        public static int CheckExistRoleName(this IRepository<crm_Roles> repository, string roleName)
        {
            //Variables
            List<crm_Roles> roleItem;

            roleItem = repository.Queryable().Where(x => x.RoleName == roleName).ToList();
            return roleItem.Count();
        }

        /// <summary>
        /// Get role by user id
        /// </summary>
        /// <param name="repository">repository object</param>
        /// <param name="idUser">id of user</param>
        /// <returns>list of role</returns>
        public static IEnumerable<RoleUserModel> GetUserGroupRoles(this IRepository<crm_Roles> repository, int idUser = 0)
        {
            var roles = repository.GetRepository<crm_Roles>().Queryable();
            var userRoles = repository.GetRepository<crm_UserRoles>().Queryable();
            IEnumerable<RoleUserModel> query;


            query = (from r in roles
                     join us in userRoles on new { a = r.ID }
                         equals new { a = us.RoleID.Value }
                     where us.UserID == idUser
                     select new RoleUserModel
                     {
                         ID = r.ID,
                         RoleName = r.RoleName,
                         Description = r.Description,
                         Active = r.Active,
                         MaskPermission = r.MaskPermission,
                         TenantId = r.TenantId
                     }).AsEnumerable();


            return query;
        }


        /// <summary>
        /// Get role item by id
        /// </summary>
        /// <param name="repository"></param>
        /// <param name="idRole">id of role</param>
        /// <returns>role object</returns>
        public static crm_Roles GetRoleByID(this IRepository<crm_Roles> repository, int idRole)
        {
            //Variables
            crm_Roles roleItem;

            roleItem = repository.Queryable().Where(x => x.ID == idRole).FirstOrDefault();
            return roleItem;
        }

        public static int GetRoleIdByPermisstionType(this IRepository<crm_Roles> repository, int tenantId, int idType)
        {
            var roleId = repository.Queryable().Where(x => x.PermissionType == idType && x.TenantId == tenantId).Select(x => x.ID).FirstOrDefault();
            return roleId;
        }
    }
}
