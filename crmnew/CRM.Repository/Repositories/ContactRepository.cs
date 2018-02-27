using Repository.Pattern.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;
using Repository.Pattern.UnitOfWork;

namespace CRM.Repository.Repositories
{
    public static class ContactRepository
    {
       /// <summary>
       /// 
       /// </summary>
       /// <param name="repository"></param>
       /// <returns></returns>
        public static IEnumerable<crm_Contacts> GetAllContact(this IRepository<crm_Contacts> repository)
        {
            IEnumerable<crm_Contacts> query;

            query = repository.Queryable().AsEnumerable();

            return query;
        }

        /// <summary>
        /// Get contact detail by customer id
        /// </summary>
        /// <param name="repository"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public static crm_Contacts GetContactDefaultByCusID(this IRepository<crm_Contacts> repository,int id)
        {
            return repository.Queryable().Where(x => x.CustomerId == id && x.IsDefault == true).FirstOrDefault();
        }

        public static List<crm_Contacts> GetListContactByCustomerID(this IRepository<crm_Contacts> repository,int customerID)
        {
            return repository.Queryable().Where(x => x.CustomerId == customerID).ToList();
        }
    }
}
