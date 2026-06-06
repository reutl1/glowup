<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Special.aspx.cs" Inherits="GlowUp.Special" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h1>SPECIAL</h1>
        <p>Exclusive products just for our members! 💖</p>

        <asp:Panel ID="SpecialPanel" runat="server" CssClass="row">
            <a href="Product.aspx?id=setting" class="product-link"><img src="images/setting.jpg" alt="Charlotte Tilbury Airbrush Setting Spray" /></a>
            <a href="Product.aspx?id=gel" class="product-link"><img src="images/gel.jpg" alt="Benefit Brow Gel" /></a>
            <a href="Product.aspx?id=mascara" class="product-link"><img src="images/mascara.jpg" alt="Too Faced Better Than Sex Mascara" /></a>
        </asp:Panel>

        <asp:Label ID="MessageLabel" runat="server" CssClass="error-message"></asp:Label>
    </form>

</asp:Content>
