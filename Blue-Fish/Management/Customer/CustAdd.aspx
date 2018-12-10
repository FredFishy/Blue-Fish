<%@ Page Title="Add Customer" Language="C#" AutoEventWireup="true" CodeBehind="CustAdd.aspx.cs" Inherits="Blue_Fish.CustAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel id="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h1>New Customer</h1>
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
        <label for="txtPostalCode">Postal Code - <small><i>Optional</i></small></label>
        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" PlaceHolder="A1A1A1"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPostalCode" Display="Dynamic" ErrorMessage="&lt;small&gt;Please enter a valid Postal Code&lt;/small&gt;" ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]"></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <label for="txtEmailAddress">Email Address</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control" PlaceHolder="email@host.com"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmailAddress" Display="Dynamic" ErrorMessage="&lt;small&gt;Please enter a valid Email Address&lt;/small&gt;" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
    <div style="width:280px">
    <div class="d-flex justify-content-between">
        <asp:Button Width="130px" text="Add" class="btn btn-primary" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" UseSubmitBehavior="False"/>
        <asp:Button Width="130px" text="Cancel" class="btn btn-secondary" runat="server" ID="btnReturn" UseSubmitBehavior="False" CausesValidation="false" OnClick="btnReturn_Click"/>
    </div>
    </div>


</asp:Content>