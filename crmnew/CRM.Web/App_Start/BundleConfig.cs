using System.Web;
using System.Web.Optimization;

namespace CRM.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));



            //------------Style bundles for MultiOrg System------------------//
            bundles.Add(new StyleBundle("~/Content/Multiorg_general_css").Include(
                      "~/Content/multiorg.css",
                      "~/Content/css.css"
                      ));

            bundles.Add(new StyleBundle("~/Content/Multiorg_bootstrap_css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/font-awesome.css",
                      "~/Content/font-icon.css"
                      ));

            bundles.Add(new StyleBundle("~/Content/Multiorg_kendo_css").Include(
                      "~/Content/kendo/2014.1.528/kendo.common.min.css",
                      "~/Content/kendo/2014.1.528/kendo.dataviz.min.css",
                      "~/Content/kendo/2014.1.528/kendo.silver.min.css",
                      "~/Content/kendo/2014.1.528/kendo.dataviz.default.min.css"
                      ));
            //------------End-Style Bundles for MultiOrg System------------------//

            //------------Script Bundles for MultiOrg System------------------//
            bundles.Add(new ScriptBundle("~/bundles/Multiorg_jquery_script").Include(
                        "~/Scripts/jquery-1.10.2.js"));

            bundles.Add(new ScriptBundle("~/bundles/Multiorg_bootstrap_script").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new ScriptBundle("~/bundles/Multiorg_footer_script").Include(
                        "~/Scripts/multiorg-elements.js",
                        "~/Scripts/multiorg.js",
                        "~/Scripts/tabs-addon.js"));


            bundles.Add(new ScriptBundle("~/bundles/Multiorg_kendo_script").Include(
                      "~/Scripts/kendo/2014.1.528/kendo.all.min.js",
                      "~/Scripts/kendo/2014.1.528/kendo.aspnetmvc.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/Multiorg_validate_script").Include(
                      "~/Scripts/jquery.validate.min.js",
                      "~/Scripts/jquery.validate.unobtrusive.js",
                      "~/Scripts/GetvaluePhrase.js"));
        }


    }
}
