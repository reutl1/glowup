<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="GlowUp.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="cart-container">
            <h1 class="cart-title">Checkout</h1>

            <asp:Panel ID="LoginRequiredPanel" runat="server" Visible="false">
                <p class="cart-empty-message">You need to sign in before checking out.</p>
                <a href="SignIn.aspx?returnUrl=Checkout.aspx" class="btn">Sign In</a>
                <a href="SignUp.aspx" class="btn-secondary-link">Create Account</a>
            </asp:Panel>

            <asp:Panel ID="CheckoutPanel" runat="server" Visible="false">
                <p class="checkout-greeting">
                    Welcome, <asp:Label ID="UserEmailLabel" runat="server" />!
                </p>

                <asp:Repeater ID="OrderRepeater" runat="server">
                    <HeaderTemplate>
                        <div class="cart-items">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="cart-item cart-item-compact">
                            <img src="<%# Eval("Product.ImageUrl") %>" alt="<%# Eval("Product.Name") %>" class="cart-item-image" />
                            <div class="cart-item-details">
                                <h2 class="cart-item-name"><%# Eval("Product.Name") %></h2>
                                <p class="cart-item-quantity">Qty: <%# Eval("Quantity") %> &middot; <%# string.Format("{0:C}", Eval("LineTotal")) %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>

                <div class="cart-summary">
                    <p class="cart-total">
                        Order Total: <asp:Label ID="OrderTotalLabel" runat="server" />
                    </p>
                    <asp:Button ID="PlaceOrderButton" runat="server" Text="Place Order" CssClass="btn add-to-cart-btn" OnClick="PlaceOrderButton_Click" />
                </div>
            </asp:Panel>

            <asp:Panel ID="SuccessPanel" runat="server" Visible="false">
                <p class="checkout-success">Your order has been placed! Thank you for shopping with GLOW UP.</p>
                <a href="Gallery.aspx" class="btn">Continue Shopping</a>
            </asp:Panel>
        </div>
    </form>

</asp:Content>
