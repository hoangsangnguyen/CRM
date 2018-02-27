using CRM.Entities.Models;
using Repository.Pattern.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Repository.Repositories
{
    /// <summary>
    /// Country Respository
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 07/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    public static class LogActionRepository
    {
        /// <summary>
        /// Gets all LogAction
        /// </summary>
        /// <param name="showHidden">A value indicating whether to show hidden records</param>
        /// <returns>LogAction collection</returns>
        public static List<crm_LogAction> GetAllLogActive(this IRepository<crm_LogAction> repository)
        {
            var _lst = from k in repository.Queryable()
                       select k;
            return _lst.ToList();
        }

        /// <summary>
        /// Gets a country 
        /// </summary>
        /// <param name="LogActionId">LogAction identifier</param>
        /// <returns>LogAction</returns>
        public static crm_LogAction GetLogActiveById(this IRepository<crm_LogAction> repository, int Id)
        {
            var _entity = from k in repository.Queryable()
                          where k.LogActionId == Id
                          select k;
            return _entity.FirstOrDefault();
        }
    }
}
