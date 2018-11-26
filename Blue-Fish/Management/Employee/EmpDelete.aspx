<%@ Page Title="Delete Employee" Language="C#" AutoEventWireup="true" CodeBehind="EmpDelete.aspx.cs" Inherits="Blue_Fish.EmpDelete" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Delete Employee</h1>
    <table class="mt-3">
        <tbody>
            <tr>
                <th class="pr-5">First Name</th>
                <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Bob</asp:TextBox></td>
            </tr>
            <tr>
              <th>Last Name</th>
              <td><asp:TextBox ID="txtLastName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Boberson</asp:TextBox></td>
            </tr>
            <tr>
                <th>Position</th>
                <td><asp:TextBox ID="txtPosition" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Manager</asp:TextBox></td>
            </tr>
        </tbody>
    </table>
    <input type="submit" value="Yes" class="btn btn-primary"/>
    <button class="btn btn-primary">No</button>
</asp:Content>
