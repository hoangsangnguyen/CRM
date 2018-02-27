using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_LogActionMap : EntityTypeConfiguration<crm_LogAction>
    {
        public crm_LogActionMap()
        {          
            // Table & Column Mappings
            this.ToTable("crm_LogAction");
            this.HasKey(t => t.LogActionId);
            this.Property(t => t.LogActionId).HasColumnName("LogActionId");
            this.Property(t => t.Name).HasColumnName("Name");
        }
    }
}
