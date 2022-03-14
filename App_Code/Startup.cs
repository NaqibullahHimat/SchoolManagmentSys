using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SchoolManagmentSystem.Startup))]
namespace SchoolManagmentSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
