﻿<%@ Page Title="Edit Customer" Language="C#" AutoEventWireup="true" CodeBehind="CustEdit.aspx.cs" Inherits="Blue_Fish.CustEdit" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h2>Edit Customer</h2>
    <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
    <div class="form-group">
        <label for="txtFirstName">First Name</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtLastName">Last Name</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtPhoneNumber">Phone Number</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="&lt;small&gt;Please enter a valid Phone Number&lt;/small&gt;" ValidationExpression="^\d{10}$" ControlToValidate="txtPhoneNumber" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <label for="txtAddress">Address - <small><i>Optional</i></small></label>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtCity">City - <small><i>Optional</i></small></label>
        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtPostalCode">Postal Code - <small><i>Optional</i></small></label>
        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPostalCode" Display="Dynamic" ErrorMessage="&lt;small&gt;Please enter a valid Postal Code&lt;/small&gt;" ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]"></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <label for="txtEmailAddress">Email Address</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmailAddress" Display="Dynamic" ErrorMessage="&lt;small&gt;Please enter a valid Email Address&lt;/small&gt;" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
    <div class="w-25 mt-4">
        <asp:Button Text="Update Information" class="btn btn-primary w-100" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
