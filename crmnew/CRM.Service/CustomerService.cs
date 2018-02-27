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
    /// <summary>
    /// CustomerService
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 15/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    public class CustomerService: Service<crm_Customers>, ICustomerService
    {
        private readonly IRepositoryAsync<crm_Customers> _repository;

        public CustomerService(IRepositoryAsync<crm_Customers> repository)
            : base(repository)
        {
            _repository = repository;
        }

        public List<crm_Customers> GetAllCustomers()
        {
            return _repository.GetAllCustomers();
        }

        public List<CustomerContactModel> GetAllCusTomerInfor(int skip=0, int take=10)
        {
            return _repository.GetAllCusTomerInfor(skip, take);
        }

        public CustomerContactModel GetCustomerInfor(int id)
        {
            return _repository.GetCustomerInfor(id);
        }

        public crm_Customers GetCustomerByID(int id)
        {
            return _repository.GetCustomerByID(id);
        }

        public bool CheckOrgNumberExist(int id, string orgNumber)
        {
            return _repository.CheckOrgNumberExist(id, orgNumber);
        }

        public CustomerContactModel GetSummaryOfCustomer(int id)
        {
            return _repository.GetSummaryOfCustomer(id);
        }
    }
}
