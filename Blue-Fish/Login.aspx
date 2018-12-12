<%--

    Created by:         Paul Vandyk
    Date:               2018-11-19
    Last modified by:   Nigel Girouard
    Date:               2018-12-11
    Description:        Register page

--%>

<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Blue_Fish.Login" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Login:</h1>

    <asp:Label ID="message" runat="server" ForeColor="#CC0000"></asp:Label>

    <div class="row">
        <div class="form-group col-4">
            <label for="username">Username:</label>
            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">
            <label for="password">Password:</label>            
            <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">           
            <asp:Button Width="110px" ID="Button1" runat="server" OnClick="Button1_Click" Text="OK" CssClass="btn btn-primary"/>
        </div>
    </div>
    
</asp:Content>
