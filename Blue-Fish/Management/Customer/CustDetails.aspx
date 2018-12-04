<%@ Page Title="Customer Details" Language="C#" AutoEventWireup="true" CodeBehind="CustDetails.aspx.cs" Inherits="Blue_Fish.CustDetails" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Customer Details</h1>
    <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
    <asp:Label runat="server" ID="id"></asp:Label>
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
            <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnEdit">Edit</asp:LinkButton>
            <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnDelete">Delete</asp:LinkButton>
        </div>


        <h3 class="mt-4">Purchase History</h3>
         <asp:Table id="table" runat="server" CssClass="table table-striped mt-4">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Note</asp:TableHeaderCell>
                <asp:TableHeaderCell>Date</asp:TableHeaderCell>
                <asp:TableHeaderCell>Net Total</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell>
                    <asp:LinkButton id="addSale" runat="server">
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="white" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                        </svg>
                    </asp:LinkButton>
                </asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
</asp:Content>
