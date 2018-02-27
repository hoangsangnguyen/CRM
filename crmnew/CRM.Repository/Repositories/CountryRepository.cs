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

    public static class CountryRepository
    {
        /// <summary>
        /// Gets all countries
        /// </summary>
        /// <param name="showHidden">A value indicating whether to show hidden records</param>
        /// <returns>Country collection</returns>
        public static List<crm_Countries> GetAllCountries(this IRepository<crm_Countries> repository)
        {
            var _lst = from k in repository.Queryable()
                       orderby k.CountryName
                       select k;
            return _lst.ToList();
        }

        /// <summary>
        /// Gets a country 
        /// </summary>
        /// <param name="countryId">Country identifier</param>
        /// <returns>Country</returns>
        public static crm_Countries GetCountryById(this IRepository<crm_Countries> repository, int countryId)
        {
            var _entity = from k in repository.Queryable()
                          where k.Id == countryId
                          select k;
            return _entity.FirstOrDefault();
        }
    }
}
