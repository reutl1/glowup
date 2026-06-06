using System;
using System.Web.UI;

namespace GlowUp
{
    public partial class SignOut : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthService.Logout(Session);
            Response.Redirect("Home.aspx");
        }
    }
}
