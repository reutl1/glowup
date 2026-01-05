<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="GlowUp.SingIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




<div class="container">
  <h1 class="title">GLOW UP</h1>
  <p class="subtitle">Log in to your account</p>

  <form class="signin-form">
    <label for="email">Email</label>
    <input type="email" id="email" placeholder="Enter your email" required>

    <label for="password">Password</label>
    <input type="password" id="password" placeholder="Enter your password" required>

    <button type="submit">Sign In</button>
  </form>

  <p class="signup-text">
    Don't have an account? 
    <a href="SignUp.aspx">Sign Up</a>
  </p>
</div>


























</asp:Content>
