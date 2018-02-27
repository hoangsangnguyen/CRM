using System;
using CRM.Entities.Models;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Repository.Pattern.Ef6;
using System.Linq;
using System.Linq.Expressions;
using System.Collections.Generic;
using System.Web.Http;
namespace CRM.Service
{
    /// <summary>
    /// ICustomerService
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 15/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    public interface ICustomerService : IService<crm_Customers> 
    {
        List<crm_Customers> GetAllCustomers();

        List<CustomerContactModel> GetAllCusTomerInfor(int skip, int take);

        CustomerContactModel GetCustomerInfor(int id);

        crm_Customers GetCustomerByID(int id);

        bool CheckOrgNumberExist(int id, string orgNumber);

        CustomerContactModel GetSummaryOfCustomer(int id);
    }
}
