using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using CRM.Entities.Models.Mapping;
using Repository.Pattern.Ef6;
using System.Data.SqlClient;
using System.Data.Entity.Core.EntityClient;
using System;
using CRM.Entities.Extensions;

namespace CRM.Entities.Models
{
    public partial class CRMTenantContext : DataContext
    {
        private static EntityHelpers _entityHelper = new EntityHelpers();

        static CRMTenantContext()
        {
            Database.SetInitializer<CRMTenantContext>(null);
        }

        public CRMTenantContext()
            : base("Name=CRMTenantContext")
        {
        }


        public DbSet<crm_Customers> Customers { get; set; }
        public DbSet<crm_Contacts> Contacts { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CustomersMap());
            modelBuilder.Configurations.Add(new crm_ContactsMap());
        }

        public static string GetConnectionString()
        {
            return _entityHelper.GetConnectionString();
        }
    }
}
