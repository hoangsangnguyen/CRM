using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace CRM.Entities.Models
{
    public partial class crm_LogAction: Entity
    {
        public int LogActionId { get; set; }
        public string Name { get; set; }
    }
}
