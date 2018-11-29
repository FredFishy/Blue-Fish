<%@ Page Title="Edit Customer" Language="C#" AutoEventWireup="true" CodeBehind="CustEdit.aspx.cs" Inherits="Blue_Fish.CustEdit" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Edit Customer</h1>
    <div class="form-group">
        <label for="firstName">First Name</label>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="lastName">Last Name</label>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="phoneNumber">Phone Number</label>
        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="address">Address</label>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="city">City</label>
        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="postalCode">Postal Code</label>
        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="emailAddress">Email Address</label>
        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <input type="submit" value="Submit" class="btn btn-primary"/>
</asp:Content>