using System;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Unity.Configuration;
using CRM.Service;
using Repository.Pattern.DataContext;
using CRM.Entities.Models;
using Repository.Pattern.UnitOfWork;
using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;
using CRM.Web.Models;
using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;

namespace CRM.Web.App_Start
{
    /// <summary>
    /// Specifies the Unity configuration for the main container.
    /// </summary>
    public class UnityConfig
    {
        #region Unity Container
        private static Lazy<IUnityContainer> container = new Lazy<IUnityContainer>(() =>
        {
            var container = new UnityContainer();
            RegisterTypes(container);
            return container;
        });

        /// <summary>
        /// Gets the configured Unity container.
        /// </summary>
        public static IUnityContainer GetConfiguredContainer()
        {
            return container.Value;
        }
        #endregion

        /// <summary>Registers the type mappings with the Unity container.</summary>
        /// <param name="container">The unity container to configure.</param>
        /// <remarks>There is no need to register concrete types such as controllers or API controllers (unless you want to 
        /// change the defaults), as Unity allows resolving a concrete type even if it was not previously registered.</remarks>
        public static void RegisterTypes(IUnityContainer container)
        {
            // NOTE: To load from web.config uncomment the line below. Make sure to add a Microsoft.Practices.Unity.Configuration to the using statements.
            // container.LoadConfiguration();

            // TODO: Register your types here
            // container.RegisterType<IProductRepository, ProductRepository>();
            //var accountInjectionConstructor = new InjectionConstructor(new IdentitySampleDbModelContext(configurationStore));
            container.RegisterType<IUserStore<ApplicationUser>, UserStore<ApplicationUser>>();
            container.RegisterType<IRoleStore<IdentityRole>, RoleStore<IdentityRole>>();

            container
                .RegisterType<IDataContextAsync, CRMContext>("dataContext", new PerRequestLifetimeManager())
                .RegisterType<IDataContextAsync, CRMTenantContext>("tenantDataContext", new PerRequestLifetimeManager())
                .RegisterType<IUnitOfWork, UnitOfWork>("CRMNAUnitOfWork", new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext")))
                .RegisterType<IUnitOfWork, UnitOfWork>("CRMNATenantUnitOfWork", new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("tenantDataContext")))
                .RegisterType<IUnitOfWorkAsync, UnitOfWork>("CRMUnitOfWork", new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext")))
                .RegisterType<IUnitOfWorkAsync, UnitOfWork>("CRMTenantUnitOfWork", new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("tenantDataContext")))
                .RegisterType<IRepositoryAsync<crm_Tenants>, Repository<crm_Tenants>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_Users>, Repository<crm_Users>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_Roles>, Repository<crm_Roles>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_UserRoles>, Repository<crm_UserRoles>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_EmailQueues>, Repository<crm_EmailQueues>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_Phrases>, Repository<crm_Phrases>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_PhraseLanguages>, Repository<crm_PhraseLanguages>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_Countries>, Repository<crm_Countries>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_LcLImp>, Repository<crm_LcLImp>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_AirExps>, Repository<crm_AirExps>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_Logs>, Repository<crm_Logs>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_LogAction>, Repository<crm_LogAction>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("dataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_Customers>, Repository<crm_Customers>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("tenantDataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMTenantUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_Contacts>, Repository<crm_Contacts>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("tenantDataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMTenantUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_Countries>, Repository<crm_Countries>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("tenantDataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMTenantUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_LcLImp>, Repository<crm_LcLImp>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("tenantDataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMTenantUnitOfWork")))
                .RegisterType<IRepositoryAsync<crm_AirExps>, Repository<crm_AirExps>>(new PerRequestLifetimeManager(), new InjectionConstructor(new ResolvedParameter<IDataContextAsync>("tenantDataContext"), new ResolvedParameter<IUnitOfWorkAsync>("CRMTenantUnitOfWork")))
                .RegisterType<DbContext, ApplicationDbContext>(new HierarchicalLifetimeManager())
                .RegisterType<IUserService, UserService>()
                .RegisterType<ILogService, LogService>()
                .RegisterType<ILogActionService, LogActionService>()
                .RegisterType<ICountryService, CountryService>()
                .RegisterType<ILcLImpService, LcLImpService>()
                .RegisterType<IAirExpService, AirExpService>()
                .RegisterType<IRoleService, RoleService>()
                .RegisterType<IUserRoleService, UserRoleService>()
                .RegisterType<ITenantService, TenantService>()
                .RegisterType<ICustomerService, CustomerService>()
                .RegisterType<IEmailQueuesService, EmailQueuesService>()
                .RegisterType<IPhraseService, PhraseService>()
                .RegisterType<IPhraseLanguageService, PhraseLanguageService>()
                .RegisterType<IContactService, ContactService>();

        }
    }
}
