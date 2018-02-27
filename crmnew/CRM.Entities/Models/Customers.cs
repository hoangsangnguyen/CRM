using Repository.Pattern.Ef6;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Entities.Models
{
    public partial class Customers : Entity
    {
        #region Properties

        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Website { get; set; }

        #endregion
    }
}
