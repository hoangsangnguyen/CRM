using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Entities.Models.Mapping
{
    public class crm_CustomersMap : EntityTypeConfiguration<crm_Customers>
    {
        public crm_CustomersMap()
        {
            // Primary Key
            this.HasKey(t => t.CustomerId);

            // Properties
            this.Property(t => t.CustomerId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.ToTable("crm_Customers");
            this.Property(t => t.CustomerId).HasColumnName("CustomerId");
            this.Property(t => t.CustomerName).HasColumnName("CustomerName");
            this.Property(t => t.OrgNumber).HasColumnName("OrgNumber");
            this.Property(t => t.PostedAddress).HasColumnName("PostedAddress");
            this.Property(t => t.VisitingAddress).HasColumnName("VisitingAddress");
            this.Property(t => t.Email).HasColumnName("Email");
            this.Property(t => t.Fax).HasColumnName("Fax");
            this.Property(t => t.Street).HasColumnName("Street");
            this.Property(t => t.Website).HasColumnName("Website");
            this.Property(t => t.City).HasColumnName("City");
            this.Property(t => t.State).HasColumnName("State");
            this.Property(t => t.ZipCode).HasColumnName("ZipCode");
            this.Property(t => t.CountryId).HasColumnName("CountryId");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.CustomerLogo).HasColumnName("CustomerLogo");
            this.Property(t => t.CustomerGroup).HasColumnName("CustomerGroup");
            this.Property(t => t.CustomerAdditionalInfo).HasColumnName("CustomerAdditionalInfo");
            this.Property(t => t.LinkedURL).HasColumnName("LinkedURL");
            this.Property(t => t.FacebookURL).HasColumnName("FacebookURL");
            this.Property(t => t.TwitterURL).HasColumnName("TwitterURL");
            this.Property(t => t.GoogleplusURL).HasColumnName("GoogleplusURL");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.CreatedDate).HasColumnName("CreatedDate");
            this.Property(t => t.ModifiedBy).HasColumnName("ModifiedBy");
            this.Property(t => t.ModifiedDate).HasColumnName("ModifiedDate");
        }
    }
}
