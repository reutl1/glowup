using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlowUp
{
    public partial class Cart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        protected void CartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                CartService.RemoveOne(Session, e.CommandArgument.ToString());
                BindCart();
            }
        }

        protected void ClearCartButton_Click(object sender, EventArgs e)
        {
            CartService.ClearCart(Session);
            BindCart();
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
            if (CartService.GetItemCount(Session) == 0)
            {
                BindCart();
                return;
            }

            if (!AuthService.IsLoggedIn(Session))
            {
                Response.Redirect("SignIn.aspx?returnUrl=Checkout.aspx");
                return;
            }

            Response.Redirect("Checkout.aspx");
        }

        private void BindCart()
        {
            var lineItems = CartService.GetCartLineItems(Session);
            var isEmpty = lineItems.Count == 0;

            EmptyCartPanel.Visible = isEmpty;
            CartPanel.Visible = !isEmpty;
            if (isEmpty)
            {
                return;
            }

            CartRepeater.DataSource = lineItems;
            CartRepeater.DataBind();
            TotalLabel.Text = string.Format("${0:F2}", CartService.GetTotal(Session));
        }
    }
}
