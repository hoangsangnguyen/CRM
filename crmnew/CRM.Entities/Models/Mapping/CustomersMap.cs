using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Entities.Models.Mapping
{
    public class CustomersMap : EntityTypeConfiguration<Customers>
    {
        public CustomersMap()
        {
            this.ToTable("Customers");
            this.HasKey(t => t.Id);
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.CustomerName).HasColumnName("CustomerName");
        }
    }
}
