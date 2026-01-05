<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Special.aspx.cs" Inherits="GlowUp.Special" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <form id="form1" runat="server">
        <h1>SPECIAL</h1>
        <p>Exclusive products just for our members! 💖</p>

        <asp:Panel ID="SpecialPanel" runat="server">
            <img src="images/setting.jpg" />
            <img src="images/gel.jpg" />
             <img src="images/mascara.jpg" />
        </asp:Panel>

        <asp:Label ID="MessageLabel" runat="server" CssClass="error-message"></asp:Label>
    </form>
























</asp:Content>
