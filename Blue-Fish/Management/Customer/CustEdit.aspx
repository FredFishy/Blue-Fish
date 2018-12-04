<%@ Page Title="Edit Customer" Language="C#" AutoEventWireup="true" CodeBehind="CustEdit.aspx.cs" Inherits="Blue_Fish.CustEdit" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label runat="server" ID="lblStatus" ForeColor="Red"></asp:Label>
    <h1>Update Customer</h1>
    <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
    <div class="form-group">
        <label for="txtFirstName">First Name</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" PlaceHolder="John"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtLastName">Last Name</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" PlaceHolder="Smith"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtPhoneNumber">Phone Number</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" PlaceHolder="1234567890"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="&lt;small&gt;Please enter a valid Phone Number&lt;/small&gt;" ValidationExpression="^\d{10}$" ControlToValidate="txtPhoneNumber" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <label for="txtAddress">Address - <small><i>Optional</i></small></label>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" PlaceHolder="123 Generic Ave"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtCity">City - <small><i>Optional</i></small></label>
        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" PlaceHolder="Cityville"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtPostalCode">Postal Code - <small><i>Optional</i>
        </small></label>
        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" PlaceHolder="A1A1A1"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtEmailAddress">Email Address</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control" PlaceHolder="email@host.com"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmailAddress" Display="Dynamic" ErrorMessage="&lt;small&gt;Please enter a valid Email Address&lt;/small&gt;" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
    <div class="w-25 mt-4">
         <asp:Button text="Update Customer" class="btn btn-primary w-100" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" UseSubmitBehavior="False"/>
    </div>
</asp:Content>