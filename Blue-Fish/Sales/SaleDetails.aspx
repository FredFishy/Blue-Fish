<%@ Page Title="Sale Details" Language="C#" AutoEventWireup="true" CodeBehind="SaleDetails.aspx.cs" Inherits="Blue_Fish.SaleDetails" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Sale Details</h1>
    <table class="mt-3">
        <tbody>
            <tr>
                <th class="pr-5">Customer Name</th>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Bob Jimmerson</asp:TextBox></td>
            </tr>
            <tr>
                <th>Employee Name</th>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Jim Boberson</asp:TextBox></td>
            </tr>
            <tr>
                <th>Paid</th>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Yes</asp:TextBox></td>
            </tr>
            <tr>
                <th>Type</th>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Credit</asp:TextBox></td>
            </tr>
            <tr>
                <th>Date</th>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Year-Month-Day</asp:TextBox></td>
            </tr>

        </tbody>
    </table>
    <div class="mt-3">
        <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnEdit">Edit</asp:LinkButton>
        <asp:LinkButton runat="server" CssClass="btn btn-danger col-1" ID="btnDelete">Delete</asp:LinkButton>
    </div>
</asp:Content>
