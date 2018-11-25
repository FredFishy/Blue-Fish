<%@ Page Title="Add Customer" Language="C#" AutoEventWireup="true" CodeBehind="CustAdd.aspx.cs" Inherits="Blue_Fish.CustAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Create Customer</h1>
    <div class="form-group">
        <label for="txtFirstName">First Name</label>&nbsp;
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtLastName">Last Name</label>&nbsp;
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtPhoneNumber">Phone Number</label>&nbsp;
        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtAddress">Address</label>&nbsp;
        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtCity">City</label>&nbsp;
        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtPostalCode">Postal Code</label>&nbsp;
        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtEmailAddress">Email Address</label>&nbsp;
        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <input type="submit" value="Submit" class="btn btn-primary"/>
</asp:Content>