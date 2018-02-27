using Repository.Pattern.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;

namespace CRM.Repository.Repositories
{
    public static class UserRepository
    {
        public static bool IsLogin(this IRepository<crm_Users> repository, string username, string password)
        {
            bool isOK= repository
                .Queryable()
                .Where(x => x.Username==username && x.Password==password).Any();

            return isOK;
            
        }

        public static List<crm_Users> CheckUserLogin(this IRepository<crm_Users> repository, string username, string password)
        {
            List<crm_Users> user = new List<crm_Users>();
            try
            {
                user = repository
               .Queryable()
               .Where(x => x.Username == username && x.Password == password).ToList();
            }
            catch (Exception)
            {
                
            }

            return user;

        }
        public static bool IsSuperAdmin(this IRepository<crm_Users> repository, string username, string password)
        {
            bool isOK = repository
                .Queryable()
                .Where(x => x.Username == username && x.Password == password).Any();
            return isOK;
        }

        public static int IdUser(this IRepository<crm_Users> repository, string email)
        {
            int Result =-1;
            var User = repository
             .Queryable()
             .Where(x => x.Email == email).ToList();
            if (User.Count >0)
            {
               Result =User[0].ID;
            }
            return Result;
        }

        public static List<crm_Users> CheckUserExternalExists(this IRepository<crm_Users> repository, string username, string url, string provider)
        {
            List<crm_Users> crm_user = new List<crm_Users>();
            string Provider = provider.ToLower().Trim();
            switch (Provider)
            {
                case "google":
                    {
                        crm_user = repository
                                .Queryable()
                                .Where(x => x.Username == username && x.GoogleplusURL == url).ToList();
                        break;
                    }
                case "facebook":
                    {
                        crm_user = repository
                                .Queryable()
                                .Where(x => x.Username == username && x.FacebookURL == url).ToList();
                        break;
                    }
                case "twitter":
                    {
                        crm_user = repository
                                .Queryable()
                                .Where(x => x.Username == username && x.TwitterURL == url).ToList();
                        break;

                    }
                case "linkedin":
                    {
                        crm_user = repository
                                .Queryable()
                                .Where(x => x.Username == username && x.LinkedURL == url).ToList();
                        break;

                    }
                case "microsoft":
                    {
                        crm_user = repository
                                .Queryable()
                                .Where(x => x.Username == username && x.LinkedURL == url).ToList();
                        break;

                    }
            
            }
            return crm_user;
            
        }

        public static List<crm_Users> CheckUserNameExternal(this IRepository<crm_Users> repository, string username)
        {
            List<crm_Users> user = new List<crm_Users>();
            try
            {
                 user = repository
                .Queryable()
                .Where(x => x.Username == username).ToList();
            }
            catch (Exception)
            {

                
            }
            
            return user;
        }

        public static List<crm_Users> CheckURL(this IRepository<crm_Users> repository, string provider, string url)
        {
            List<crm_Users> user = new List<crm_Users>();
            try
            {
                string Provider = provider.ToLower().Trim();
                switch (Provider)
                {
                    case "google":
                        user = repository
                        .Queryable()
                        .Where(x => x.GoogleplusURL == url).ToList();
                        break;
                   case "facebook":
                        user = repository
                        .Queryable()
                        .Where(x => x.FacebookURL == url).ToList();
                        break;
                   case "twitter":
                        user = repository
                        .Queryable()
                        .Where(x => x.TwitterURL == url).ToList();
                        break;
                   case "linkedin":
                        user = repository
                        .Queryable()
                        .Where(x => x.LinkedURL == url).ToList();
                        break;
                   case "microsoft":
                        user = repository
                        .Queryable()
                        .Where(x => x.LinkedURL == url).ToList();
                        break;
                        
                }
                
            }
            catch (Exception)
            {


            }

            return user;
        }


        public static crm_Users GetUserById(this IRepository<crm_Users> repository,int id)
        {
            var _entity = from k in repository.Queryable()
                          where k.ID == id
                          select k;
            return _entity.FirstOrDefault();
        }


        public static crm_Users GetUserByUsername(this IRepository<crm_Users> repository, string username)
        {
            var _entity = from k in repository.Queryable()
                          where k.Username == username
                          select k;
            return _entity.FirstOrDefault();
        }

        public static List<crm_Users> GetListUsersByTenantId(this IRepository<crm_Users> repository, int tenantId)
        {
            var _lstEntity = from k in repository.Queryable()
                             where k.TenantId == tenantId
                             select k;
            return _lstEntity.ToList();
        }
    }
}
