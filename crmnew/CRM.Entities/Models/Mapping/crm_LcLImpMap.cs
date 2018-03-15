using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Entities.Models.Mapping
{
    public class crm_LcLImpMap : EntityTypeConfiguration<crm_LcLImp>
    {
        public crm_LcLImpMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.ToTable("crm_LcLImp");

            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.JobNo).HasColumnName("JobNo");
            this.Property(t => t.Created).HasColumnName("Created");
            this.Property(t => t.Eta).HasColumnName("Eta");
            this.Property(t => t.MBLNo).HasColumnName("MBLNo");
            this.Property(t => t.POLId).HasColumnName("POLId");
            this.Property(t => t.Commodity).HasColumnName("Commodity");
            this.Property(t => t.MBLType).HasColumnName("MBLType");
            this.Property(t => t.ETDDate).HasColumnName("ETDDate");
            this.Property(t => t.ETDType).HasColumnName("ETDType");
            this.Property(t => t.ContactId).HasColumnName("ContactId");
            this.Property(t => t.SCName).HasColumnName("SCName");
            this.Property(t => t.Vessel).HasColumnName("Vessel");
            this.Property(t => t.PODId).HasColumnName("PODId");
            this.Property(t => t.PackageAmount).HasColumnName("PackageAmount");
            this.Property(t => t.PackageType).HasColumnName("PackageType");
            this.Property(t => t.Service).HasColumnName("Service");
            this.Property(t => t.isFinish).HasColumnName("isFinish");
            this.Property(t => t.CoLoaderId).HasColumnName("CoLoaderId");
            this.Property(t => t.AgentId).HasColumnName("AgentId");
            this.Property(t => t.Voyage).HasColumnName("Voyage");
            this.Property(t => t.Delivery).HasColumnName("Delivery");
            this.Property(t => t.GW).HasColumnName("GW");
            this.Property(t => t.CBM).HasColumnName("CBM");
            this.Property(t => t.Note).HasColumnName("Note");
            this.Property(t => t.CountryId).HasColumnName("CountryId");



        }
    }
}
