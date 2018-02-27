using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_PhrasesMap : EntityTypeConfiguration<crm_Phrases>
    {
        public crm_PhrasesMap()
        {
            this.ToTable("crm_Phrases");
            this.HasKey(t => t.Id);
            this.Property(t => t.Id).HasColumnName("ID")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            this.Property(t => t.PhraseName)
                .HasMaxLength(40);
            this.Property(t => t.PhraseType)
                .HasMaxLength(100);
            this.Property(t => t.PhraseName).HasColumnName("PhraseName");
            this.Property(t => t.PhraseType).HasColumnName("PhraseType");
        }
    }
}
