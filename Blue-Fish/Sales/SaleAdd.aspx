<%@ Page Title="Add Sale" Language="C#" AutoEventWireup="true" CodeBehind="SaleAdd.aspx.cs" Inherits="Blue_Fish.SaleAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<h1>Create Sale</h1>

<div class="form-group">
    <label for="txtFirstName">Date</label>&nbsp;
    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="txtFirstName">Paid</label>&nbsp;
    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
</div>
<div class="form-group">
    <label for="txtFirstName">Customer Name</label>&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="form-group">
    <label for="txtFirstName">Payment Type</label>&nbsp;
    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
</div>
<div class="form-group">
    <label for="txtFirstName">Employee Name</label>&nbsp;
    <asp:DropDownList runat="server" CssClass="form-control"></asp:DropDownList>
</div>

<input type="submit" value="Submit" class="btn btn-primary"/>

</asp:Content>
