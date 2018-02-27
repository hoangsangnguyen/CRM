using System;
using CRM.Entities.Models;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Repository.Pattern.Ef6;
using System.Collections.Generic;
namespace CRM.Service
{
    public interface IContactService : IService<crm_Contacts>
    {
        IEnumerable<crm_Contacts> GetAllContact();
        crm_Contacts GetContactDefaultByCusID(int id);
        List<crm_Contacts> GetListContactByCustomerID(int customerID);
    }
}
