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
    public class ContactService : Service<crm_Contacts>, CRM.Service.IContactService
    {
        private readonly IRepositoryAsync<crm_Contacts> _repository;

        public ContactService(IRepositoryAsync<crm_Contacts> repository)
            : base(repository)
        {
            _repository = repository;
        }
        public  IEnumerable<crm_Contacts> GetAllContact()
        {
            return _repository.GetAllContact();
        }

        public crm_Contacts GetContactDefaultByCusID(int id)
        {
            return _repository.GetContactDefaultByCusID(id);
        }

        public List<crm_Contacts> GetListContactByCustomerID(int customerID)
        {
            return _repository.GetListContactByCustomerID(customerID);
        }
    }
}
