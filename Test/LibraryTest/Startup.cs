using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LibraryTest.Startup))]
namespace LibraryTest
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
