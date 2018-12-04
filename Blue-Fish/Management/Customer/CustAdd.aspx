<%@ Page Title="Add Customer" Language="C#" AutoEventWireup="true" CodeBehind="CustAdd.aspx.cs" Inherits="Blue_Fish.CustAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Create Customer</h1>
    <div class="form-group">
        <label for="txtFirstName">First Name</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
        
    </div>
    <div class="form-group">
        <label for="txtLastName">Last Name</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtPhoneNumber">Phone Number</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtAddress">Address - <small><i>Optional</i></small></label><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtCity">City - <small><i>Optional</i></small></label><asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtPostalCode">Postal Code - <small><i>Optional</i></small></label><asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtEmailAddress">Email Address</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <asp:Button text="Add Customer" class="btn btn-primary" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" UseSubmitBehavior="False"/>

    <asp:Label runat="server" ID="lblStatus" ForeColor="Red"></asp:Label>

    </asp:Content>