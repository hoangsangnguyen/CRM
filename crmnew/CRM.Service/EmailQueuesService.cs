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
using Repository.Pattern.UnitOfWork;
using System.Runtime.CompilerServices;

namespace CRM.Service
{
    public class EmailQueuesService : Service<crm_EmailQueues>, CRM.Service.IEmailQueuesService
    {
        private readonly IRepositoryAsync<crm_EmailQueues> _repository;
        public EmailQueuesService(IRepositoryAsync<crm_EmailQueues> repository)
            : base(repository)
        {
            _repository = repository;
           
        }

        
        
    }
}
