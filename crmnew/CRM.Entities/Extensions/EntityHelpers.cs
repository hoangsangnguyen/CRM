using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Entities.Extensions
{
    /// <summary>
    /// Helper class
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 16/07/2014		thuyhk@cateno.no                Created.        
    /// </summary>
    /// 

    public class EntityHelpers
    {
        public static string _dataSource = "";

        public EntityHelpers()
        {
        }

        public void SetConnectionString(string serverName, string dbName, string DbUser, string DbPass)
        {
            _dataSource = "Data Source=" + serverName + ";Initial Catalog=" + dbName + ";Integrated Security=False;User ID=" + DbUser + ";Password=" + DbPass + ";MultipleActiveResultSets=True";
        }

        public string GetConnectionString()
        {
            return _dataSource;
        }        
    }
}
