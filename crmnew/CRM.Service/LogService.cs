﻿using System;
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
    /// LogService
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 10/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    public class LogService: Service<crm_Logs>, ILogService
    {
        private readonly IRepositoryAsync<crm_Logs> _repository;

        public LogService(IRepositoryAsync<crm_Logs> repository)
            : base(repository)
        {
            _repository = repository;
        }
    }
}
