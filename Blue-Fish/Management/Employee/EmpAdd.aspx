<%@ Page Title="Add Employee" Language="C#" AutoEventWireup="true" CodeBehind="EmpAdd.aspx.cs" Inherits="Blue_Fish.EmpAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Create Employee</h1>
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
    <input type="submit" value="Submit" class="btn btn-primary"/>
</asp:Content>
