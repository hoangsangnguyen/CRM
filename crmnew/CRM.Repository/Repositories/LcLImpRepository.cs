using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRM.Entities.Models;
using Repository.Pattern.Repositories;

namespace CRM.Repository.Repositories
{
    public static class LcLImpRepository
    {
        public static List<crm_LcLImp> GetAllLcLImp (this IRepository<crm_LcLImp> repository)
        {
            var _list = from k in repository.Queryable()
                        orderby k.JobNo
                        select k;
            return _list.ToList();
        }

        public static LclImpModel GetLcLImpInfor(this IRepository<crm_LcLImp> repository, int id)
        {
            var lclImp = repository.GetRepository<crm_LcLImp>().Queryable();
            LclImpModel query;

            query = (from r in lclImp
                     where r.Id == id select new LclImpModel {
                         Id = r.Id,
                         JobNo = r.JobNo,
                         Created = r.Created,
                         Eta = r.Eta,
                         MBLNo = r.MBLNo,
                         POLId = r.POLId,
                         Commodity = r.Commodity,
                         MBLType = r.MBLType,
                         ETDDate = r.ETDDate,
                         ETDType = r.ETDType,
                         ContactId = r.ContactId,
                         SCName = r.SCName,
                         Vessel = r.Vessel,
                         PODId = r.PODId,
                         PackageAmount = r.PackageAmount,
                         PackageType = r.PackageType,
                         Service = r.Service,
                         isFinish = r.isFinish,
                         CoLoaderId = r.CoLoaderId,
                         AgentId = r.AgentId,
                         Voyage = r.Voyage,
                         Delivery = r.Delivery,
                         GW = r.GW,
                         CBM = r.CBM,
                         Note = r.Note}
                     ).FirstOrDefault();

            return query;
        }
        public static crm_LcLImp GetLcLImpByID(this IRepository<crm_LcLImp> repository, int id)
        {
            return repository.Queryable().Where(x => x.Id == id).FirstOrDefault();
        }
    }
}
