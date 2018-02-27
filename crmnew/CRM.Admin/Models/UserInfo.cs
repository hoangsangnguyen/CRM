using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Admin.Models
{
  public  class UserInfo
  {
      public int ID { get; set;}
      public string UserName { get; set;}
      public string Email { get; set;}
      public string DisplayName { get; set;}
      public string FullName { get; set;}
      public string Image { get; set; }
      public bool? Active { get; set;}
      public int TenanID { get; set;}
      public List<int> BitMask { get; set; }
      public int MaskPermission { get; set; }
      public bool IsSA { get; set; }
      public bool IsTenant { get; set; }
      public bool IsOperator { get; set; }
      public bool IsSales { get; set; }
      public bool IsMarketing { get; set; }
      public bool IsSupport { get; set; }
      public bool IsUser { get; set; }
      public bool IsManager { get; set; }
      public string TenantAlias { get; set; }
  }
}
