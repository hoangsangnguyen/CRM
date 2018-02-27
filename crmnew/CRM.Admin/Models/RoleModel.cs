using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Admin.Models
{
    /// <summary>
    /// The class is defined to render columns of data grid
    /// </summary>
    public class ColumnRoleModel
    {
        public string title { get; set; }
        public string field { get; set; }
        public string template { get; set; }
        public bool hidden { get; set; }
    }

    /// <summary>
    /// The class contain informations of user role
    /// </summary>
    public class BitMaskOfUser
    {
        public List<bool> View { get; set; }
        public List<bool> Add { get; set; }
        public List<bool> Edit { get; set; }
        public List<bool> Delete { get; set; }
        //To detect type of user. Example: SuperAdmin or Operator...
        public List<int> NumberOfBitMask { get; set; }
    }

    /// <summary>
    /// Model to submit data
    /// </summary>
    public class RoleModel
    {
        public int IDX { get; set; }
        public bool? View { get; set; }
        public bool? Add { get; set; }
        public bool? Edit { get; set; }
        public bool? Delete { get; set; }
        public int NumberOfBitMask { get; set; }
        public int NumberOfClickView { get; set; }
        public int NumberOfClickAdd { get; set; }
        public int NumberOfClickEdit { get; set; }
        public int NumberOfClickDelete { get; set; }
    }

    /// <summary>
    /// Model contain detail of CRUID process
    /// </summary>
    public class ActionResultModel
    {
        //0:fail,1:success
        public int IsSuccess { get; set; }
        public string Message { get; set; }
    }

}
