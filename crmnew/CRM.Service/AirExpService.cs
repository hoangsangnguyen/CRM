using CRM.Entities.Models;
using Repository.Pattern.Repositories;
using Service.Pattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Service
{
    public class AirExpService : Service<crm_AirExps>, IAirExpService
    {
        private readonly IRepositoryAsync<crm_AirExps> _repository;
        public AirExpService(IRepositoryAsync<crm_AirExps> repository)
           : base(repository)
        {
            _repository = repository;
        }
        public List<crm_AirExps> GetAllAirExp()
        {
            throw new NotImplementedException();
        }
    }
}
