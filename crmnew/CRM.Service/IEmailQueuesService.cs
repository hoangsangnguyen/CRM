using System;
using CRM.Entities.Models;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Repository.Pattern.Ef6;
namespace CRM.Service
{
    public interface IEmailQueuesService : IService<crm_EmailQueues>
    {
        
    }
}
