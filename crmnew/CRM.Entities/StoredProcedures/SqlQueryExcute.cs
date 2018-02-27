using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;
using CRM.Entities.Models;
using System.Data;
using CRM.Entities.ViewModel;

namespace CRM.Entities.StoredProcedures
{
    /// <summary>
    /// SqlQueryExcute
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 08/07/2014		thuyhk@cateno.no                created.        
    /// </summary>
    /// 

    public partial class SqlQueryExcute : DataContext
    {
        static SqlQueryExcute()
        {
            Database.SetInitializer<SqlQueryExcute>(null);
        }

        public SqlQueryExcute()
            : base("Name=CRMContext")
        { }

        public int CreateDBByTenant(string dbName, string dbUser, string dbPass)
        {
            try
            {
                var _dbName = dbName != null ? new SqlParameter("@DBName", dbName) : new SqlParameter("@DBName", typeof(string));
                var _dbUser = dbUser != null ? new SqlParameter("@DBUsername", dbUser) : new SqlParameter("@DBUsername", typeof(string));
                var _dbPass = dbPass != null ? new SqlParameter("@DBPassword", dbPass) : new SqlParameter("@DBPassword", typeof(string));

                var result = this.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, "CreateNewDB @DBName, @DBUsername, @DBPassword", _dbName, _dbUser, _dbPass);
                return result;
            }
            catch
            {
                return 1;
            }
        }
        public IEnumerable<crm_UserInfo> GetUserByPermiss(int pageNumber, int pageSize, string userName, int tenantID, int max, out int TotalRows)
        {
            var outParam = new SqlParameter
            {
                ParameterName = "TotalRows",
                Value = 0,
                Direction = ParameterDirection.Output
            };
           
            var result = this.Database.SqlQuery<crm_UserInfo>(
                   "GetUsers @PageNum, @PageSize, @UserName,@TenantID,@maxPermiss,@TotalRows OUT",
                   new SqlParameter("PageNum", pageNumber),
                   new SqlParameter("PageSize", pageSize),
                   new SqlParameter("UserName", userName),
                   new SqlParameter("TenantID", tenantID),
                   new SqlParameter("maxPermiss", max),
                   outParam
               ).ToList();
            TotalRows = (int)outParam.Value;

            return result;

        }


        //public int InsertLogActive(crm_Logs _entity)
        //{
        //    try
        //    {
        //        return 1;
        //        //
        //    }
        //    catch
        //    {
        //        return 1;
        //    }
        //}
    }
}
