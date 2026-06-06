using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlowUp
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] == null)
            {
                return;
            }

            string email = Request.Form["email"];
            string password = Request.Form["password"];

            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                return;
            }

            if (email == "reut@gmail.com")
            {
                AuthService.Login(Session, email);

                var returnUrl = Request.QueryString["returnUrl"];
                if (!string.IsNullOrEmpty(returnUrl) && returnUrl.StartsWith("/") == false && !returnUrl.Contains("://"))
                {
                    Response.Redirect(returnUrl);
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}