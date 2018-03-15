using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;

namespace CRM.Admin.Models
{
    public class LcLImpModel
    {
        public int Id { get; set; }
        public String JobNo { get; set; }
        public DateTime Created { get; set; }
        public DateTime Eta { get; set; }
        public String MBLNo { get; set; }
        public PortModel POL { get; set; }
        public String Commodity { get; set; }
        public String MBLType { get; set; }
        public DateTime ETDDate { get; set; }
        public String ETDType { get; set; }
        public ContactModel contact { get; set; }
        public String SCName { get; set; }
        public String Vessel { get; set; }
        public PortModel POD { get; set; }
        public int PackageAmount { get; set; }
        public String PackageType { get; set; }
        public String Service { get; set; }
        public bool isFinish { get; set; }
        public CoLoaderModel coLoader { get; set; }
        public AgentModel agent { get; set; }
        public String Voyage { get; set; }
        public String Delivery { get; set; }
        public double? GW { get; set; }
        public double? CBM { get; set; }
        public String Note { get; set; }


    }

    public class LcLImpList
    {
        public List<ColumnRoleModel> column { get; set; }
        public List<crm_LcLImp> data { get; set; }
        public int total { get; set; }
    }
}
