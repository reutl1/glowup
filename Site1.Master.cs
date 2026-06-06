using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlowUp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string userMsg;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                string userName = Session["userName"].ToString();
                userMsg = "<td class =\"tdStyle\"> " + "hello" + userName + "<\td>";


            }
            else
            {
                userMsg = "";
            }


        }
    }
}