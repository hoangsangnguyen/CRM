using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace CRM.Entities.Models
{
    public partial class crm_Countries : Entity
    {
        #region Properties

        public int Id { get; set; }
        public string CountryName { get; set; }

        #endregion
    }
}
