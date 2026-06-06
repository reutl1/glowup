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
                string userName = Request.Form["uName"];
                string password = Request.Form["password"];

                string query = "select userName from Users where userName = '"+ userName + "' and password = '" + password + "'";
                string user = SQLHelper.SelectScalarToString(query);
                if (user != "")
                {
                    Session["userName"] = user;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Console.WriteLine("User not found");
                }
                

            }
        }

    }
}