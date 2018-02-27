using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_UsersMap : EntityTypeConfiguration<crm_Users>
    {
        public crm_UsersMap()
        {
            // Primary Key
            this.HasKey(t => new { t.ID, t.TenantId });

            // Properties
            this.Property(t => t.ID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.Property(t => t.Username)
                .HasMaxLength(100);

            this.Property(t => t.Password)
                .HasMaxLength(100);

            this.Property(t => t.Phone)
              .HasMaxLength(25);

            this.Property(t => t.Mobile)
              .HasMaxLength(25);

            this.Property(t => t.PasswordSalt)
                .HasMaxLength(100);

            this.Property(t => t.Email)
                .HasMaxLength(100);

            this.Property(t => t.DisplayName)
                .HasMaxLength(100);

            this.Property(t => t.FullName)
                .HasMaxLength(100);

            this.Property(t => t.TenantId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Image)
                .HasMaxLength(200);

            this.Property(t => t.LinkedURL)
                .HasMaxLength(200);

            this.Property(t => t.FacebookURL)
                .HasMaxLength(200);                     

            this.Property(t => t.TwitterURL)
                .HasMaxLength(200);

            this.Property(t => t.GoogleplusURL)
                .HasMaxLength(200);

            // Table & Column Mappings
            this.ToTable("crm_Users");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.Username).HasColumnName("Username");
            this.Property(t => t.Password).HasColumnName("Password");
            this.Property(t => t.Phone).HasColumnName("Phone");
            this.Property(t => t.Mobile).HasColumnName("Mobile");
            this.Property(t => t.PasswordSalt).HasColumnName("PasswordSalt");
            this.Property(t => t.Email).HasColumnName("Email");
            this.Property(t => t.DisplayName).HasColumnName("DisplayName");
            this.Property(t => t.FullName).HasColumnName("FullName");
            this.Property(t => t.Active).HasColumnName("Active");            
            this.Property(t => t.CreatedDate).HasColumnName("CreatedDate");
            this.Property(t => t.UpdatedDate).HasColumnName("UpdatedDate");
            this.Property(t => t.TenantId).HasColumnName("TenantId");
            this.Property(t => t.Image).HasColumnName("Image");
            this.Property(t => t.LinkedURL).HasColumnName("LinkedURL");
            this.Property(t => t.FacebookURL).HasColumnName("FacebookURL");
            this.Property(t => t.TwitterURL).HasColumnName("TwitterURL");
            this.Property(t => t.GoogleplusURL).HasColumnName("GoogleplusURL");
        }
    }
}
