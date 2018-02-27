using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;
using Owin.Security.Providers.LinkedIn;
using System.Configuration;
namespace CRM.Web
{
    public partial class Startup
    {
        // For more information on configuring authentication, please visit http://go.microsoft.com/fwlink/?LinkId=301864
        private  string GoogleId = ConfigurationManager.AppSettings["GoogleId"];
        private string GoogleSecret = ConfigurationManager.AppSettings["GoogleSecret"];
        private string FacebookId = ConfigurationManager.AppSettings["FacebookId"];
        private string FacebookSecret = ConfigurationManager.AppSettings["FacebookSecret"];
        private string TwitterId = ConfigurationManager.AppSettings["TwitterId"];
        private string TwitterSecret = ConfigurationManager.AppSettings["TwitterSecret"];
        private string LinkedInId = ConfigurationManager.AppSettings["LinkedInId"];
        private string LinkedInSecret = ConfigurationManager.AppSettings["LinkedInSecret"];
        public void ConfigureAuth(IAppBuilder app)
        {
            
            // Enable the application to use a cookie to store information for the signed in user
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/login")
            });
            // Use a cookie to temporarily store information about a user logging in with a third party login provider
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // Uncomment the following lines to enable logging in with third party login providers
            app.UseLinkedInAuthentication(
                    clientId: LinkedInId,
                    clientSecret: LinkedInSecret);

           // app.UseMicrosoftAccountAuthentication(
             //   clientId: "00000000481220CC",
               // clientSecret: "dV9ZDkmhujrRxHtgLNgmvWuHg7AJw3dA");

            app.UseTwitterAuthentication(
               consumerKey: TwitterId,
               consumerSecret: TwitterSecret);

            app.UseFacebookAuthentication(
               appId: FacebookId,
               appSecret: FacebookSecret);

            app.UseGoogleAuthentication(
                        clientId: GoogleId,
                        clientSecret: GoogleSecret);
        }
    }
}