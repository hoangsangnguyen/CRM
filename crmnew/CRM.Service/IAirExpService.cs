using CRM.Entities.Models;
using Service.Pattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Service
{
    public interface IAirExpService : IService<crm_AirExps>
    {
        List<crm_AirExps> GetAllAirExp();
    }
}
