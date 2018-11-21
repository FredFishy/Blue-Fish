<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Blue_Fish.Login" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Register:</h1>

    <div class="row">
        <div class="form-group col-4">
            <label for="username">Username:</label>
            <input name="firstName" type ="text" class="form-control"/>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">
            <label for="password">Password:</label>
            <input name="password1" type ="text" class="form-control"/>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">
            <label for="password">Confirm Password:</label>
            <input name="password2" type ="text" class="form-control"/>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">           
            <input type ="submit" value="Login" class="btn btn-primary"/>
        </div>
    </div>

    <p>Content.</p>
</asp:Content>

