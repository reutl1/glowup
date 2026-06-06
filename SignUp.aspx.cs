using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlowUp
{
    public partial class SingUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msg = "we didn't press submit yet";

            if (Request.Form["submit"] != null)
            {
                string firstName = Request.Form["fName"];
                string lastName = Request.Form["lName"];
                string userName = Request.Form["uName"];
                string email = Request.Form["email"];
                string password = Request.Form["password"];
                string gender = Request.Form["gender"];
                int isAdmin = 0;
                int age = 15;

                password = "12345";
                
                string query = "insert into Users values('" + lastName + "','" + firstName + "','" + userName + "','" + password + "','" + isAdmin + "')";

            }
        }
    }
}