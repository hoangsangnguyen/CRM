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
    /// LogAction
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 10/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    public class LogActionService : Service<crm_LogAction>, ILogActionService
    {
        private readonly IRepositoryAsync<crm_LogAction> _repository;

        public LogActionService(IRepositoryAsync<crm_LogAction> repository)
            : base(repository)
        {
            _repository = repository;
        }

        public List<crm_LogAction> GetAllLogActive()
        {
            return _repository.GetAllLogActive();
        }

        public crm_LogAction GetLogActiveById(int Id)
        {
            return _repository.GetLogActiveById(Id);
        }
    }
}
