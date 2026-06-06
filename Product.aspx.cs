using System;
using System.Web.UI;

namespace GlowUp
{
    public partial class Product : Page
    {
        private ProductItem _currentProduct;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                _currentProduct = ProductCatalog.GetById(Request.QueryString["id"]);
                return;
            }

            var productId = Request.QueryString["id"];
            _currentProduct = ProductCatalog.GetById(productId);

            if (_currentProduct == null)
            {
                ProductPanel.Visible = false;
                NotFoundPanel.Visible = true;
                return;
            }

            ProductImage.ImageUrl = _currentProduct.ImageUrl;
            ProductImage.AlternateText = _currentProduct.Name;
            ProductName.Text = _currentProduct.Name;
            ProductPrice.Text = string.Format("${0:F2}", _currentProduct.Price);

            if (_currentProduct.Category == "Special")
            {
                BackLink.NavigateUrl = "Special.aspx";
            }
            else
            {
                BackLink.NavigateUrl = "Gallery.aspx";
            }
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            if (_currentProduct == null)
            {
                return;
            }

            CartService.AddToCart(Session, _currentProduct.Id);

            CartMessage.Text = string.Format(
                "{0} added to cart! ({1} item{2} in cart)",
                _currentProduct.Name,
                CartService.GetItemCount(Session),
                CartService.GetItemCount(Session) == 1 ? "" : "s");
            CartMessagePanel.Visible = true;
        }
    }
}
