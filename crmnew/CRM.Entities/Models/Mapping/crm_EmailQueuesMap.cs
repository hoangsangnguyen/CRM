using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_EmailQueuesMap : EntityTypeConfiguration<crm_EmailQueues>
    {
        public crm_EmailQueuesMap()
        {
            // Primary Key
            this.HasKey(t => new { t.ID, t.SendBy });

            // Properties
            this.Property(t => t.ID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.Property(t => t.EmailSubject)
                .HasMaxLength(100);

            this.Property(t => t.DisplayNameFrom)
                .HasMaxLength(100);

            this.Property(t => t.EmailFrom)
                .HasMaxLength(100);

            this.Property(t => t.DisplayNameTo)
                .HasMaxLength(100);

            this.Property(t => t.EmailTo)
                .HasMaxLength(100);

            this.Property(t => t.EmailCc)
                .HasMaxLength(200);

            this.Property(t => t.EmailBcc)
                .HasMaxLength(200);

            this.Property(t => t.EmailBody)
                .HasMaxLength(500);                     

            this.Property(t => t.Description)
                .HasMaxLength(500);

            this.Property(t => t.SenderIP)
                .HasMaxLength(200);

            this.Property(t => t.SendBy)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("crm_EmailQueues");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.Active).HasColumnName("Active");
            this.Property(t => t.EmailSubject).HasColumnName("EmailSubject");
            this.Property(t => t.EmailFrom).HasColumnName("EmailFrom");
            this.Property(t => t.DisplayNameTo).HasColumnName("DisplayNameTo");
            this.Property(t => t.EmailTo).HasColumnName("EmailTo");
            this.Property(t => t.EmailCc).HasColumnName("EmailCc");
            this.Property(t => t.EmailBcc).HasColumnName("EmailBcc");
            this.Property(t => t.EmailBody).HasColumnName("EmailBody");
            this.Property(t => t.IsHtmlContent).HasColumnName("IsHtmlContent");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.CreatedDate).HasColumnName("CreatedDate");
            this.Property(t => t.UpdatedDate).HasColumnName("UpdatedDate");
            this.Property(t => t.SenderIP).HasColumnName("SenderIP");
            this.Property(t => t.SendBy).HasColumnName("SendBy");
            
        }
    }
}
