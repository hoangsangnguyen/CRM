using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;
using CRM.Repository.Repositories;
using Repository.Pattern.Repositories;
using Service.Pattern;

namespace CRM.Service
{
    public class LcLImpService : Service<crm_LcLImp>, ILcLImpService
    {
        private readonly IRepositoryAsync<crm_LcLImp> _repository;

        public LcLImpService(IRepositoryAsync<crm_LcLImp> repository)
            : base(repository)
        {
            _repository = repository;
        }

        public List<crm_LcLImp> GetAllLcLImp()
        {
            return _repository.GetAllLcLImp();
        }

        public crm_LcLImp GetLcLImpByID(int id)
        {
            return _repository.GetLcLImpByID(id);
        }

        public LclImpModel GetLcLImpInfor(int id)
        {
            return _repository.GetLcLImpInfor(id);
        }
    }
}
