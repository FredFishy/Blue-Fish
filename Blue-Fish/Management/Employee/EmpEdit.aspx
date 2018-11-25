<%@ Page Title="Edit Employee" Language="C#" AutoEventWireup="true" CodeBehind="EmpEdit.aspx.cs" Inherits="Blue_Fish.EmpEdit" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Edit Employee</h1>
    <div class="form-group">
        <label for="txtFirstName">First Name</label>&nbsp;
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtLastName">Last Name</label>&nbsp;
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="ddlPosition">Last Name</label>&nbsp;       
        <asp:DropDownList ID="ddlPosition" runat="server" AppendDataBoundItems="True" CssClass="form-control">
            <asp:ListItem>Select Position</asp:ListItem>
        </asp:DropDownList>
    </div>
</asp:Content>
