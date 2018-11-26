<%@ Page Title="Delete Customer" Language="C#" AutoEventWireup="true" CodeBehind="CustDelete.aspx.cs" Inherits="Blue_Fish.CustDelete" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Delete Customer</h1>
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
                <th>Phone Number</th>
                <td><asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control-plaintext" ReadOnly="true">1234567890</asp:TextBox></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control-plaintext" ReadOnly="true">123 Generic Street</asp:TextBox></td>
            </tr>
            <tr>
                <th>City</th>
                <td><asp:TextBox ID="txtCity" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Cityville</asp:TextBox></td>
            </tr>
            <tr>
                <th>Postal Code</th>
                <td><asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control-plaintext" ReadOnly="true">A1A1A1</asp:TextBox></td>
            </tr>
            <tr>
                <th>Email Address</th>
                <td><asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control-plaintext" ReadOnly="true">email@email.org</asp:TextBox></td>
            </tr>
        </tbody>
    </table>
    <input type="submit" value="Yes" class="btn btn-primary"/>
    <button class="btn btn-primary">No</button>
</asp:Content>
