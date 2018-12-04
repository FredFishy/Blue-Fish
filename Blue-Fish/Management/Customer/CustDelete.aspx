<%@ Page Title="Delete Customer" Language="C#" AutoEventWireup="true" CodeBehind="CustDelete.aspx.cs" Inherits="Blue_Fish.CustDelete" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label runat="server" ID="lblStatus" ForeColor="Red"></asp:Label>
    <h2>Are you sure you want to delete this Customer?</h2>
    <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
    <table class="mt-3">
        <tbody>
            <tr>
                <th class="pr-5">First Name</th>
                <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
              <th>Last Name</th>
              <td><asp:TextBox ID="txtLastName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td><asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>City</th>
                <td><asp:TextBox ID="txtCity" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Postal Code</th>
                <td><asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Email Address</th>
                <td><asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
        </tbody>
    </table>
        <div class="mt-3">
            <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnConfirm" OnClick="btnConfirm_Click">Yes</asp:LinkButton>
            <asp:LinkButton PostBackUrl="~/Management/Customer/CustIndex.aspx" runat="server" CssClass="btn btn-secondary col-1" ID="btnCancel">No</asp:LinkButton>
        </div>
</asp:Content>
