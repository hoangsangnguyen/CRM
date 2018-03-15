using CRM.Entities.Models;
using Repository.Pattern.Repositories;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;

namespace CRM.Repository.Repositories
{
    /// <summary>
    /// CustomersRepository
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 15/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    public static class CustomersRepository
    {
        public static List<crm_Customers> GetAllCustomers(this IRepository<crm_Customers> repository)
        {
            var _lst = from k in repository.Queryable()
                       orderby k.CustomerName
                       select k;
            return _lst.ToList();
        }

        public static List<CustomerContactModel> GetAllCusTomerInfor(this IRepository<crm_Customers> repository,int skip=0,int take=10)
        {
            var customer = repository.GetRepository<crm_Customers>().Queryable();
            var contact = repository.GetRepository<crm_Contacts>().Queryable();
            List<CustomerContactModel> query;
            

            query = (from r in customer
                     select new CustomerContactModel
                     {
                         CustomerId = r.CustomerId,
                         CustomerName=r.CustomerName,
                         MobilePhone=contact.Where(x=>x.IsDefault==true&&x.CustomerId==r.CustomerId).FirstOrDefault().MobilePhone,
                         ContactId = contact.Where(x => x.IsDefault == true && x.CustomerId == r.CustomerId).FirstOrDefault().ContactId,
                         Email = r.Email,
                         FirstName = contact.Where(x => x.IsDefault == true && x.CustomerId == r.CustomerId).FirstOrDefault().FirstName,
                         LastName = contact.Where(x => x.IsDefault == true && x.CustomerId == r.CustomerId).FirstOrDefault().LastName,
                         CustomerLogo = r.CustomerLogo,
                         OrgNumber = r.OrgNumber,
                         CreatedDate=r.CreatedDate
                     }).OrderByDescending(x=>x.CustomerId).Skip(skip).Take(take).ToList();

            return query;
        }

        public static CustomerContactModel GetCustomerInfor(this IRepository<crm_Customers> repository,int id)
        {
            var customer = repository.GetRepository<crm_Customers>().Queryable();
            var contact = repository.GetRepository<crm_Contacts>().Queryable();
            CustomerContactModel query;
            crm_Contacts contactEntity = null;

            contactEntity = contact.Where(x => x.CustomerId == id && x.IsDefault == true).FirstOrDefault();
            string firstName = contactEntity == null ? "" : contactEntity.FirstName;
            string lastName = contactEntity == null ? "" : contactEntity.LastName;
            string address = contactEntity == null ? "" : contactEntity.Address;
            string contactPhone = contactEntity == null ? "" : contactEntity.ContactPhone;
            string mobilePhone = contactEntity == null ? "" : contactEntity.MobilePhone;
            int contactID = contactEntity == null ? 0 : contactEntity.ContactId;
            
            query = (from r in customer
                     where r.CustomerId == id
                     select new CustomerContactModel
                     {
                         CustomerId = r.CustomerId,
                         CustomerName = r.CustomerName,
                         MobilePhone = mobilePhone,
                         ContactId = contactID,
                         Email = r.Email,
                         FullName = firstName+" "+lastName,
                         CustomerLogo = r.CustomerLogo,
                         OrgNumber = r.OrgNumber,
                         CreatedDate = r.CreatedDate,
                         PostedAddress = r.PostedAddress,
                         VisitingAddress = r.VisitingAddress,
                         CountryId = r.CountryId,
                         Fax = r.Fax,
                         Description = r.Description,
                         ContactPhone = contactPhone,
                         Address = address,
                         LinkedURL = r.LinkedURL,
                         FacebookURL = r.FacebookURL,
                         GoogleplusURL = r.GoogleplusURL,
                         TwitterURL = r.TwitterURL,
                         Website = r.Website,
                         FirstName = firstName,
                         LastName = lastName,
                     }).FirstOrDefault();

            query.TotalContact = contact.Where(x => x.CustomerId == id).Count();
            return query;
        }

        public static crm_Customers GetCustomerByID(this IRepository<crm_Customers> repository,int id)
        {
            return repository.Queryable().Where(x => x.CustomerId == id).FirstOrDefault();
        }
        
        public static bool CheckOrgNumberExist(this IRepository<crm_Customers> repository,int id,string orgNumber)
        {
            //Variables
            bool isExist = false;
            crm_Customers customer = null;
            try
            {
                customer = repository.Queryable().Where(x => x.CustomerId != id && x.OrgNumber == orgNumber).FirstOrDefault();
            } catch (Exception e)
            {
            }

            isExist = customer == null ? true : false;
            return isExist;
        }

        public static CustomerContactModel GetSummaryOfCustomer(this IRepository<crm_Customers> repository, int id)
        {
            CustomerContactModel query=new CustomerContactModel();
            query.TotalContact = repository.GetRepository<crm_Customers>().Queryable().Where(x => x.CustomerId == id).Count();
            return query;
        }
    }
}
