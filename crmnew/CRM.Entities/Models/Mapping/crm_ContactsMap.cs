using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_ContactsMap: EntityTypeConfiguration<crm_Contacts>
    {
        public crm_ContactsMap()
        {
            // Primary Key
            this.HasKey(t =>t.ContactId);

            // Properties
            this.Property(t => t.ContactId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.ToTable("crm_Contacts");

            this.Property(t => t.ContactId).HasColumnName("ContactId");
            this.Property(t => t.FirstName).HasColumnName("FirstName");
            this.Property(t => t.LastName).HasColumnName("LastName");
            this.Property(t => t.ContactPhone).HasColumnName("ContactPhone");
            this.Property(t => t.MobilePhone).HasColumnName("MobilePhone");
            this.Property(t => t.Address).HasColumnName("Address");
            this.Property(t => t.Email).HasColumnName("Email");
            this.Property(t => t.Gender).HasColumnName("Gender");
            this.Property(t => t.Active).HasColumnName("Active");
            this.Property(t => t.CreatedDate).HasColumnName("CreatedDate");
            this.Property(t => t.IsDefault).HasColumnName("IsDefault");
            this.Property(t => t.CustomerId).HasColumnName("CustomerId");
        }
    }
}
