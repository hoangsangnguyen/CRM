using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_TenantsMap : EntityTypeConfiguration<crm_Tenants>
    {
        public crm_TenantsMap()
        {
            // Table & Column Mappings
            this.ToTable("crm_Tenants");
            this.HasKey(t => t.TenantId);
            this.Property(t => t.TenantId).HasColumnName("TenantId");
            this.Property(t => t.AssignedUserId).HasColumnName("AssignedUserId");
            this.Property(t => t.TenantName).HasColumnName("TenantName");
            this.Property(t => t.TenantNameAlias).HasColumnName("TenantNameAlias");
            this.Property(t => t.DbName).HasColumnName("DbName");
            this.Property(t => t.DbUsername).HasColumnName("DbUsername");
            this.Property(t => t.DbPassword).HasColumnName("DbPassword");
            this.Property(t => t.PaymentDays).HasColumnName("PaymentDays");
            this.Property(t => t.Email).HasColumnName("Email");
            this.Property(t => t.DataSpace).HasColumnName("DataSpace");
            this.Property(t => t.Subscribers).HasColumnName("Subscribers");
            this.Property(t => t.PlanType).HasColumnName("PlanType");
            this.Property(t => t.OrgNumber).HasColumnName("OrgNumber");
            this.Property(t => t.PostedAddress).HasColumnName("PostedAddress");
            this.Property(t => t.VisitingAddress).HasColumnName("VisitingAddress");
            this.Property(t => t.Fax).HasColumnName("Fax");
            this.Property(t => t.Rating).HasColumnName("Rating");
            this.Property(t => t.Street).HasColumnName("Street");
            this.Property(t => t.Website).HasColumnName("Website");
            this.Property(t => t.City).HasColumnName("City");
            this.Property(t => t.State).HasColumnName("State");
            this.Property(t => t.CountryId).HasColumnName("CountryId");
            this.Property(t => t.ZipCode).HasColumnName("ZipCode");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.CompanyLogo).HasColumnName("CompanyLogo");
            this.Property(t => t.CompanyGroup).HasColumnName("CompanyGroup");
            this.Property(t => t.CompanyAdditionalInfo).HasColumnName("CompanyAdditionalInfo");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.CreatedDate).HasColumnName("CreatedDate");
            this.Property(t => t.ModifiedBy).HasColumnName("ModifiedBy");
            this.Property(t => t.ModifiedDate).HasColumnName("ModifiedDate");
            this.Property(t => t.Active).HasColumnName("Active");
            this.Property(t => t.LinkedURL).HasColumnName("LinkedURL");
            this.Property(t => t.FacebookURL).HasColumnName("FacebookURL");
            this.Property(t => t.TwitterURL).HasColumnName("TwitterURL");
            this.Property(t => t.GoogleplusURL).HasColumnName("GoogleplusURL");
            this.Property(t => t.Information).HasColumnName("Information");

            this.HasRequired(o => o.crm_Countries)
               .WithMany()
               .HasForeignKey(o => o.CountryId)
               .WillCascadeOnDelete(false);
        }
    }
}
