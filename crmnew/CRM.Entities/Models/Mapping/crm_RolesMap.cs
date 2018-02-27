using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_RolesMap : EntityTypeConfiguration<crm_Roles>
    {
        public crm_RolesMap()
        {
            // Primary Key
            //this.HasKey(t => new { t.ID, t.TenantId });
            this.HasKey(t => new { t.ID });

            // Properties
            this.Property(t => t.ID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.Property(t => t.RoleName)
                .HasMaxLength(100);

            //this.Property(t => t.TenantId)
            //    .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("crm_Roles");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.RoleName).HasColumnName("RoleName");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.Active).HasColumnName("Active");
            this.Property(t => t.MaskPermission).HasColumnName("MaskPermission");
            this.Property(t => t.TenantId).HasColumnName("TenantId");
        }
    }
}
