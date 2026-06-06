<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="GlowUp.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
    <div class="product-detail">
        <asp:HyperLink ID="BackLink" runat="server" CssClass="back-link" Text="&larr; Back" />

        <asp:Panel ID="ProductPanel" runat="server">
            <asp:Image ID="ProductImage" runat="server" CssClass="product-detail-image" />
            <h1 class="product-detail-name">
                <asp:Label ID="ProductName" runat="server" />
            </h1>
            <p class="product-detail-price">
                <asp:Label ID="ProductPrice" runat="server" />
            </p>
            <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart" CssClass="btn add-to-cart-btn" OnClick="AddToCartButton_Click" />
            <asp:Panel ID="CartMessagePanel" runat="server" Visible="false" CssClass="cart-message-panel">
                <asp:Label ID="CartMessage" runat="server" CssClass="cart-message" />
                <a href="Cart.aspx" class="view-cart-link">View Cart</a>
            </asp:Panel>
        </asp:Panel>

        <asp:Panel ID="NotFoundPanel" runat="server" Visible="false">
            <h1 class="product-detail-name">Product not found</h1>
            <p class="product-detail-price">Sorry, we couldn't find that product.</p>
            <a href="Gallery.aspx" class="btn">Browse Gallery</a>
        </asp:Panel>
    </div>
    </form>

</asp:Content>
