using System;
using System.Web.UI;

namespace GlowUp
{
    public partial class Checkout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            if (!AuthService.IsLoggedIn(Session))
            {
                Response.Redirect("SignIn.aspx?returnUrl=Checkout.aspx");
                return;
            }

            if (CartService.GetItemCount(Session) == 0)
            {
                Response.Redirect("Cart.aspx");
                return;
            }

            BindCheckout();
        }

        protected void PlaceOrderButton_Click(object sender, EventArgs e)
        {
            if (!AuthService.IsLoggedIn(Session) || CartService.GetItemCount(Session) == 0)
            {
                Response.Redirect("Cart.aspx");
                return;
            }

            CartService.ClearCart(Session);
            CheckoutPanel.Visible = false;
            SuccessPanel.Visible = true;
        }

        private void BindCheckout()
        {
            UserEmailLabel.Text = AuthService.GetUserEmail(Session);
            OrderRepeater.DataSource = CartService.GetCartLineItems(Session);
            OrderRepeater.DataBind();
            OrderTotalLabel.Text = string.Format("${0:F2}", CartService.GetTotal(Session));

            LoginRequiredPanel.Visible = false;
            CheckoutPanel.Visible = true;
            SuccessPanel.Visible = false;
        }
    }
}
