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
            Database.SetInitializer<CRMTenantContext>(new CreateDatabaseIfNotExists<CRMTenantContext>());
        }

        public CRMTenantContext()
            : base("Name=CRMTenantContext")
        {
            //System.Data.Entity.Database.SetInitializer<CRMTenantContext>(new DropCreateDatabaseIfModelChanges<CRMTenantContext>());
        }


        public DbSet<crm_Customers> Customers { get; set; }
        public DbSet<crm_Contacts> Contacts { get; set; }
        public DbSet<crm_Countries> Countries { get; set; }
        public DbSet<crm_LcLImp> LcLImp { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new crm_CustomersMap());
            modelBuilder.Configurations.Add(new crm_ContactsMap());
            modelBuilder.Configurations.Add(new crm_CountriesMap());
            modelBuilder.Configurations.Add(new crm_LcLImpMap());
        }

        public static string GetConnectionString()
        {
            return _entityHelper.GetConnectionString();
        }
    }
}
