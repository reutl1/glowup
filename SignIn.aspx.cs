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
            if (Request.Form["submit"] != null)
            {
                string email = Request.Form["email"];
                string password = Request.Form["password"];
                if (email == "reut@gmail.com")
                {
                    Response.Redirect("Home.aspx");

                }
            }
        }
    }
}