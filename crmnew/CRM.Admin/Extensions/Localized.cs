using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;


namespace CRM.Admin.Extensions
{
    public class LocalizedDisplayName : DisplayNameAttribute
    {
        public LocalizedDisplayName(string resourceKey)
            : base(GetDisplaynameByKey(resourceKey))
        {
        }

        private static string GetDisplaynameByKey(string key)
        {
            return Caching.GetValue(key);
        }
    }

    public class LocalizedRequired : RequiredAttribute, IClientValidatable
    {
        public LocalizedRequired(string resourceKey)
        {
            this.ErrorMessage = Caching.GetValue(resourceKey);
        }

        public IEnumerable<ModelClientValidationRule> GetClientValidationRules(ModelMetadata metadata, ControllerContext context)
        {
            yield return new ModelClientValidationRule
            {
                ErrorMessage = this.ErrorMessage,
                ValidationType = "required"
            };
        }
    }
}
