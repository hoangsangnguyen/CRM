using Repository.Pattern.Ef6;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CRM.Entities.Models
{
    public partial class crm_LcLImp : Entity
    {
        #region Properties
        public int Id { get; set; }
        public String JobNo { get; set; }
        public DateTime Created { get; set; }
        public DateTime Eta { get; set; }
        public String MBLNo { get; set; }
        public String POLId { get; set; }
        public String Commodity { get; set; }
        public String MBLType { get; set; }
        public DateTime ETDDate { get; set; }
        public String ETDType { get; set; }
        public String ContactId { get; set; }
        public String SCName { get; set; }
        public String Vessel { get; set; }
        public String PODId { get; set; }
        public int PackageAmount { get; set; }
        public String PackageType { get; set; }
        public String Service { get; set; }
        public bool isFinish { get; set; }
        public String CoLoaderId { get; set; }
        public String AgentId { get; set; }
        public String Voyage { get; set; }
        public String Delivery { get; set; }
        public double? GW { get; set; }
        public double? CBM { get; set; }
        public String Note { get; set; }
        public Nullable<int> CountryId { get; set; }

        #endregion
    }

    public class LclImpModel
    {
        #region Properties
        public int Id { get; set; }
        public String JobNo { get; set; }
        public DateTime Created { get; set; }

        public DateTime Eta { get; set; }
        public String MBLNo { get; set; }
        public String POLId { get; set; }
        public String Commodity { get; set; }
        public String MBLType { get; set; }
        public DateTime ETDDate { get; set; }
        public String ETDType { get; set; }
        public String ContactId { get; set; }
        public String SCName { get; set; }
        public String Vessel { get; set; }
        public String PODId { get; set; }
        public int PackageAmount { get; set; }
        public String PackageType { get; set; }
        public String Service { get; set; }
        public bool isFinish { get; set; }
        public String CoLoaderId { get; set; }
        public String AgentId { get; set; }
        public String Voyage { get; set; }
        public String Delivery { get; set; }
        public double? GW { get; set; }
        public double? CBM { get; set; }
        public String Note { get; set; }
        public Nullable<int> CountryId { get; set; }

        public List<crm_Countries> ListCountry { get; set; }
        #endregion
    }
}
