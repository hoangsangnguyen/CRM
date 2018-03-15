using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using CRM.Entities.Models.Mapping;
using Repository.Pattern.Ef6;

namespace CRM.Entities.Models
{
    public partial class CRMContext : DataContext
    {
        static CRMContext()
        {
            Database.SetInitializer<CRMContext>(new CreateDatabaseIfNotExists<CRMContext>());
        }

        public CRMContext()
            : base("Name=CRMContext")
        {
            //System.Data.Entity.Database.SetInitializer<CRMContext>(new DropCreateDatabaseIfModelChanges<CRMContext>());
        }

        public DbSet<crm_LogAction> crm_LogAction { get; set; }
        public DbSet<crm_Logs> crm_Logs { get; set; }
        public DbSet<crm_Roles> crm_Roles { get; set; }
        public DbSet<crm_Tenants> crm_Tenants { get; set; }
        public DbSet<crm_UserRoles> crm_UserRoles { get; set; }
        public DbSet<crm_Users> crm_Users { get; set; }
        public DbSet<crm_Phrases> crm_Phrases { get; set; }
        public DbSet<crm_PhraseLanguages> crm_PhraseLanguages { get; set; }
        public DbSet<crm_EmailQueues> crm_EmailQueues { get; set; }
        public DbSet<crm_LcLImp> crm_LcLImp { get; set; }
        public DbSet<crm_Customers> crm_Customer { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new crm_LogActionMap());
            modelBuilder.Configurations.Add(new crm_LogsMap());
            modelBuilder.Configurations.Add(new crm_RolesMap());
            modelBuilder.Configurations.Add(new crm_TenantsMap());
            modelBuilder.Configurations.Add(new crm_UserRolesMap());
            modelBuilder.Configurations.Add(new crm_UsersMap());
            modelBuilder.Configurations.Add(new crm_PhrasesMap());
            modelBuilder.Configurations.Add(new crm_PhraseLanguagesMap());
            modelBuilder.Configurations.Add(new crm_EmailQueuesMap());
            modelBuilder.Configurations.Add(new crm_LcLImpMap());
            modelBuilder.Configurations.Add(new crm_CustomersMap());
        }

        public System.Data.Entity.DbSet<CRM.Entities.Models.crm_Countries> crm_Countries { get; set; }
    }
}
