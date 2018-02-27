using Microsoft.AspNet.Identity.EntityFramework;

namespace Authentication.Models
{
    public class ApplicationUser : IdentityUser
    {
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("CRMContext")
        {
        }
    }
}