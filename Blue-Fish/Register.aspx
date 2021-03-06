﻿<%--

    Created by:         Paul Vandyk
    Date:               2018-11-19
    Last modified by:   Nigel Girouard
    Date:               2018-12-11
    Description:        Register page

--%>

<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Blue_Fish.Register" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Register:</h2>

    <div class="row">
        <div class="form-group col-4">
            <label for="username">Username:</label>
            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">
            <label for="password">Password:</label>
            <asp:TextBox ID="password1" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">
            <label for="password">Confirm Password:</label>
            <asp:TextBox ID="password2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-8"></div>
        <div class="form-group col-4">
            <asp:Label ID="lblMessage" runat="server" Visible="False" BackColor="#CC0000"></asp:Label>
        </div>
        <div class="form-group col-4">           
           <asp:Button ID="btnRegister" runat="server" Text="Register" class="btn btn-primary" OnClick="btnRegister_Click" UseSubmitBehavior="False"/>
        </div>
    </div>


    <asp:panel id="toLanding" visible="false" runat="server">
        <asp:HyperLink runat="server" href="Default">Click here to go to Landing Page</asp:HyperLink>
    </asp:panel>

</asp:Content>

