using AutoMapper;
using CRM.Admin.Models;
using CRM.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Admin.Extensions
{
    /// <summary>
    /// Mapping Extensions
    /// 
    /// Revision History
    /// Date			Author		                    Reason for Change
    /// -----------------------------------------------------------
    /// 07/07/2014		thuyhk@cateno.no                Created.        
    /// 07/07/2014		thuyhk@cateno.no                Updated (Map crm_Logs)
    /// </summary>
    /// 
    public static class MappingExtensions
    {
        public static TenantModel ToModel(this crm_Tenants entity)
        {          
            var _tenantModel = new TenantModel();
            AutoMapper.Mapper.CreateMap<crm_Tenants, TenantModel>();
            AutoMapper.Mapper.Map(entity, _tenantModel);
            return _tenantModel;
        }

        public static crm_Tenants ToEntity(this TenantModel model)
        {
            var _tenantEntity = new crm_Tenants();
            AutoMapper.Mapper.CreateMap<TenantModel, crm_Tenants>();
            AutoMapper.Mapper.Map(model, _tenantEntity);
            return _tenantEntity;
        }

        public static LogModel ToModel(this crm_Logs entity)
        {
            var _logModel = new LogModel();
            AutoMapper.Mapper.CreateMap<crm_Logs, LogModel>();
            AutoMapper.Mapper.Map(entity, _logModel);
            return _logModel;
        }

        public static crm_Logs ToEntity(this LogModel model)
        {
            var _logEntity = new crm_Logs();
            AutoMapper.Mapper.CreateMap<LogModel, crm_Logs>();
            AutoMapper.Mapper.Map(model, _logEntity);
            return _logEntity;
        }

        /// <summary>
        /// ///////////////////
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public static UsersModel ToModel(this crm_Users entity)
        {
            var _usertModel = new UsersModel();
            AutoMapper.Mapper.CreateMap<crm_Users, UsersModel>();
            AutoMapper.Mapper.Map(entity, _usertModel);
            return _usertModel;
        }

        public static crm_Users ToEntity(this UsersModel model)
        {
            var _userEntity = new crm_Users();
            AutoMapper.Mapper.CreateMap<UsersModel, crm_Users>();
            AutoMapper.Mapper.Map(model, _userEntity);
            return _userEntity;
        }


        public static ContactModel ToModel(this crm_Contacts entity)
        {
            var _contactModel = new ContactModel();
            AutoMapper.Mapper.CreateMap<crm_Contacts, ContactModel>();
            AutoMapper.Mapper.Map(entity, _contactModel);
            return _contactModel;
        }

        public static crm_Contacts ToEntity(this ContactModel model)
        {
            var _contactEntity = new crm_Contacts();
            AutoMapper.Mapper.CreateMap<ContactModel, crm_Contacts>();
            AutoMapper.Mapper.Map(model, _contactEntity);
            return _contactEntity;
        }

        public static ContactAddEditModel ToModelContact(this crm_Contacts entity)
        {
            var _contactModel = new ContactAddEditModel();
            AutoMapper.Mapper.CreateMap<crm_Contacts, ContactAddEditModel>();
            AutoMapper.Mapper.Map(entity, _contactModel);
            return _contactModel;
        }

        public static crm_Contacts ToEntityContact(this ContactAddEditModel model)
        {
            var _contactEntity = new crm_Contacts();
            AutoMapper.Mapper.CreateMap<ContactAddEditModel, crm_Contacts>();
            AutoMapper.Mapper.Map(model, _contactEntity);
            return _contactEntity;
        }
    }
}
