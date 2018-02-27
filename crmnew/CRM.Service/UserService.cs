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
    public class UserService : Service<crm_Users>, CRM.Service.IUserService
    {
        private readonly IRepositoryAsync<crm_Users> _repository;

        public UserService(IRepositoryAsync<crm_Users> repository)
            : base(repository)
        {
            _repository = repository;
        }

        public bool IsLogin(string username, string password)
        {
            return _repository.IsLogin(username, password);
        }

        public bool IsSuperAdmin(string username, string password)
        {
            return _repository.IsSuperAdmin(username, password);
        }

        public int IdUser(string email)
        {
            return _repository.IdUser(email);
        }
        public List<crm_Users> CheckUserExternalExists(string username, string url, string provider)
        {
            return _repository.CheckUserExternalExists(username, url, provider);
        }
        public List<crm_Users> CheckUserLogin(string username, string password)
        {
            return _repository.CheckUserLogin(username, password);
        }

        public List<crm_Users> CheckUserNameExternal(string username)
        {
            return _repository.CheckUserNameExternal(username);
        }
        public List<crm_Users> CheckURL(string provider, string url)
        {
            return _repository.CheckURL(provider, url);
        }

        public crm_Users GetUserById(int id)
        {
            return _repository.GetUserById(id);
        }

        public crm_Users GetUserByUsername(string username)
        {
            return _repository.GetUserByUsername(username);
        }

        public List<crm_Users> GetListUsersByTenantId(int tenantId)
        {
            return _repository.GetListUsersByTenantId(tenantId);
        }
    }
}
