<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Blue_Fish.Login" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Login:</h1>

    <asp:Label ID="message" runat="server"></asp:Label>

    <div class="row">
        <div class="form-group col-4">
            <label for="username">Username:</label>
            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">
            <label for="password">Password:</label>            
            <asp:TextBox ID="password" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">           
            <input type ="submit" value="Login" class="btn btn-primary" id="Login"/>
        </div>
    </div>
    
</asp:Content>
