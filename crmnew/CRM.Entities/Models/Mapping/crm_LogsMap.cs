using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_LogsMap : EntityTypeConfiguration<crm_Logs>
    {
        public crm_LogsMap()
        {
            // Table & Column Mappings
            this.ToTable("crm_Logs");
            this.HasKey(t => t.LogId);
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.TenantId).HasColumnName("TenantId");
            this.Property(t => t.LogTypeActionId).HasColumnName("LogTypeActionId");
            this.Property(t => t.UserId).HasColumnName("UserId");
            this.Property(t => t.Content).HasColumnName("Content");
            this.Property(t => t.LoginDate).HasColumnName("LoginDate");
            this.Property(t => t.LogoutDate).HasColumnName("LogoutDate");
            this.Property(t => t.AccessBrowser).HasColumnName("AccessBrowser");
            this.Property(t => t.DetectedIp).HasColumnName("DetectedIp");
            this.Property(t => t.ComputerName).HasColumnName("ComputerName");
            this.Property(t => t.Platform).HasColumnName("Platform");
            this.Property(t => t.Component).HasColumnName("Component");
            this.Property(t => t.IsSuccess).HasColumnName("IsSuccess");

            //this.HasRequired(o => o.crm_LogAction)
            //  .WithMany()
            //  .HasForeignKey(o => o.LogTypeActionId)
            //  .WillCascadeOnDelete(false);
        }
    }
}
