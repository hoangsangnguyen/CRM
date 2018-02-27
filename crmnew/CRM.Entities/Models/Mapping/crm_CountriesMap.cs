using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_CountriesMap : EntityTypeConfiguration<crm_Countries>
    {
        public crm_CountriesMap()
        {
            this.ToTable("crm_Countries");
            this.HasKey(t => t.Id);
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.CountryName).HasColumnName("CountryName");
        }
    }
}
