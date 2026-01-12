<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="GlowUp.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container">
  <h1 class="title">GLOW UP</h1>
  <p class="subtitle">Create your account</p>

  <form class="signup-form">
    
    <div>
    <label for="name">Name</label>
    <input type="text" id="name" placeholder="Enter your name" required>
    </div>
    
     <div>
    <label for="email">Email</label>
    <input type="email" id="email" placeholder="Enter your email" required>
    </div>
    <div>
    <label for="password">Password</label>
    <input type="password" id="password" placeholder="Enter your password" required>
      </div>

    <div>
    <label for="confirm-password">Confirm Password</label>
    <input type="password" id="confirm-password" placeholder="Confirm your password" required>
    </div>

    
    <p class="updates-label">Do you want to receive updates from our site?</p>
    <div class="radio-group">
      <label><input type="radio" name="updates" value="yes" checked> Yes</label>
      <label><input type="radio" name="updates" value="no"> No</label>
    </div>

    
    <button type="submit">Sign Up</button>
  </form>

  <p class="signin-text">
    Already have an account? 
    <a href="SignIn.aspx">Sign In</a>
  </p>
</div>










</asp:Content>
