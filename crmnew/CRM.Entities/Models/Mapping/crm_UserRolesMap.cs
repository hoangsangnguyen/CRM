using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_UserRolesMap : EntityTypeConfiguration<crm_UserRoles>
    {
        public crm_UserRolesMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            // Table & Column Mappings
            this.ToTable("crm_UserRoles");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.UserID).HasColumnName("UserID");
            this.Property(t => t.RoleID).HasColumnName("RoleID");
        }
    }
}
