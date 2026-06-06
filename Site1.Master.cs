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
        protected void Page_Load(object sender, EventArgs e)
        {
            var itemCount = CartService.GetItemCount(Session);
            CartCountLabel.Text = itemCount > 0 ? "(" + itemCount + ")" : "";

            if (AuthService.IsLoggedIn(Session))
            {
                SignInLink.Visible = false;
                SignOutLink.Visible = true;
            }
            else
            {
                SignInLink.Visible = true;
                SignOutLink.Visible = false;
            }
        }

    }
}