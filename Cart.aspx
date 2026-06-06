<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="GlowUp.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="cart-container">
            <h1 class="cart-title">Your Cart</h1>

            <asp:Panel ID="EmptyCartPanel" runat="server" Visible="false">
                <p class="cart-empty-message">Your cart is empty.</p>
                <a href="Gallery.aspx" class="btn">Browse Products</a>
            </asp:Panel>

            <asp:Panel ID="CartPanel" runat="server" Visible="false">
                <asp:Repeater ID="CartRepeater" runat="server" OnItemCommand="CartRepeater_ItemCommand">
                    <HeaderTemplate>
                        <div class="cart-items">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="cart-item">
                            <img src="<%# Eval("Product.ImageUrl") %>" alt="<%# Eval("Product.Name") %>" class="cart-item-image" />
                            <div class="cart-item-details">
                                <h2 class="cart-item-name"><%# Eval("Product.Name") %></h2>
                                <p class="cart-item-price"><%# string.Format("{0:C}", Eval("Product.Price")) %> each</p>
                                <p class="cart-item-quantity">Qty: <%# Eval("Quantity") %></p>
                                <p class="cart-item-total"><%# string.Format("{0:C}", Eval("LineTotal")) %></p>
                                <asp:LinkButton ID="RemoveButton" runat="server"
                                    CommandName="Remove"
                                    CommandArgument='<%# Eval("Product.Id") %>'
                                    CssClass="cart-remove-btn"
                                    Text="Remove" />
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>

                <div class="cart-summary">
                    <p class="cart-total">
                        Total: <asp:Label ID="TotalLabel" runat="server" />
                    </p>
                    <div class="cart-actions">
                        <asp:Button ID="ClearCartButton" runat="server" Text="Clear Cart" CssClass="btn-secondary" OnClick="ClearCartButton_Click" />
                        <a href="Gallery.aspx" class="btn-secondary-link">Continue Shopping</a>
                        <asp:Button ID="CheckoutButton" runat="server" Text="Checkout" CssClass="btn add-to-cart-btn" OnClick="CheckoutButton_Click" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>

</asp:Content>
