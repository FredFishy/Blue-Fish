<%@ Page Title="Customer Details" Language="C#" AutoEventWireup="true" CodeBehind="CustDetails.aspx.cs" Inherits="Blue_Fish.CustDetails" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h1>Customer Details</h1>
    <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
    <asp:Label runat="server" ID="id"></asp:Label>
    <table class="mt-3">
        <tbody>
            <tr>
                <th class="pr-5">First Name</th>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Last Name</th>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Address</th>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>City</th>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Postal Code</th>
                <td>
                    <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Email Address</th>
                <td>
                    <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
        </tbody>
    </table>
    <div class="mt-3">
        <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnEdit">Edit</asp:LinkButton>
        <asp:LinkButton runat="server" CssClass="btn btn-danger col-1" ID="btnDelete">Delete</asp:LinkButton>
    </div>


    <h3 class="mt-4">Sale History</h3>
    <asp:Label ID="lblNoSale" runat="server" Visible="true">This customer has no previous sales<asp:LinkButton runat="server" ID="lnkOrder">, click here to add a new one</asp:LinkButton></asp:Label>
    <asp:Table ID="tableOrder" runat="server" CssClass="table table-striped mt-4" Visible="false">
        <asp:TableRow CssClass="thead-dark ">
            <asp:TableHeaderCell>Order Number</asp:TableHeaderCell>
            <asp:TableHeaderCell>Order Note</asp:TableHeaderCell>
            <asp:TableHeaderCell>Order Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Order Total</asp:TableHeaderCell>
            <asp:TableHeaderCell>
                <asp:LinkButton ID="addSale" runat="server" CssClass="px-2 py-1 btn btn-small btn-primary">
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="white" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                        </svg>
                </asp:LinkButton>
            </asp:TableHeaderCell>
        </asp:TableRow>
    </asp:Table>

    <h3 class="mt-4">Service History</h3>
    <asp:Label ID="lblNoService" runat="server" Visible="true">This customer has no previous services<asp:LinkButton runat="server" ID="lnkService">, click here to add a new one</asp:LinkButton></asp:Label>
    <asp:Table ID="tableService" runat="server" CssClass="table table-striped mt-4" Visible="false">
        <asp:TableRow CssClass="thead-dark ">
            <asp:TableHeaderCell>Order Number</asp:TableHeaderCell>
            <asp:TableHeaderCell>Equipment</asp:TableHeaderCell>
            <asp:TableHeaderCell>Service</asp:TableHeaderCell>
            <asp:TableHeaderCell>Issue</asp:TableHeaderCell>
            <asp:TableHeaderCell>Under Warranty</asp:TableHeaderCell>
            <asp:TableHeaderCell>Service Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Price</asp:TableHeaderCell>
            <asp:TableHeaderCell>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="px-2 py-1 btn btn-small btn-primary">
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="white" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                        </svg>
                </asp:LinkButton>
            </asp:TableHeaderCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
