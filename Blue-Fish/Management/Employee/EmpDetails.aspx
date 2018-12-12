<%@ Page Title="Employee Details" Language="C#" AutoEventWireup="true" CodeBehind="EmpDetails.aspx.cs" Inherits="Blue_Fish.EmpDetails" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Employee Details</h1>
    <table class="mt-3">
        <tbody>
            <tr>
                <th class="pr-5">First Name</th>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Bob</asp:TextBox></td>
            </tr>
            <tr>
                <th>Last Name</th>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Boberson</asp:TextBox></td>
            </tr>
            <tr>
                <th>Position</th>
                <td>
                    <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Manager</asp:TextBox></td>
            </tr>
        </tbody>
    </table>
    <div class="mt-3">
        <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnEdit">Edit</asp:LinkButton>
        <asp:LinkButton runat="server" CssClass="btn btn-danger col-1" ID="btnDelete">Delete</asp:LinkButton>
    </div>
</asp:Content>
