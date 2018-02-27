using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace CRM.Entities.Models.Mapping
{
    public class crm_PhraseLanguagesMap : EntityTypeConfiguration<crm_PhraseLanguages>
    {
        public crm_PhraseLanguagesMap()
        {
            this.ToTable("crm_PhraseLanguages");
            this.HasKey(t => t.Id);
            this.Property(t => t.Id).HasColumnName("ID")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            this.Property(t => t.PhraseValue)
                .HasMaxLength(300);
            this.Property(t => t.PhraseId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);
                    
            this.Property(t => t.PhraseValue).HasColumnName("PhraseValue");
            this.Property(t => t.PhraseId).HasColumnName("PhraseID");
        }
    }
}
