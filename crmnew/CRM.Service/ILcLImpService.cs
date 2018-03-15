using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;
using Service.Pattern;

namespace CRM.Service
{
    public interface ILcLImpService : IService<crm_LcLImp>
    {
        List<crm_LcLImp> GetAllLcLImp();
        LclImpModel GetLcLImpInfor(int id);
        crm_LcLImp GetLcLImpByID(int id);
    }
}
