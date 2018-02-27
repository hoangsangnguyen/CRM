using System;
using CRM.Entities.Models;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Repository.Pattern.Ef6;
using System.Collections.Generic;
namespace CRM.Service
{
    public interface IUserService: IService<crm_Users>
    {
        bool IsLogin(string username, string password);
        bool IsSuperAdmin(string username, string password);
        int IdUser(string email);
        List<crm_Users> CheckUserExternalExists(string username, string url, string provider);
        List<crm_Users> CheckUserLogin(string username, string password);
        List<crm_Users> CheckUserNameExternal(string username);
        List<crm_Users> CheckURL(string provider, string url);
        crm_Users GetUserById(int id);

        crm_Users GetUserByUsername(string username);

        List<crm_Users> GetListUsersByTenantId(int tenantId);
    }
}
