<%--

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Nigel Girouard
    Date:               2018-12-09
    Description:        Inventory Details

--%>

<%@ Page Title="Inventory Item Details" Language="C#" AutoEventWireup="true" CodeBehind="InventoryDetails.aspx.cs" Inherits="Blue_Fish.InventoryDetails" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel id="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h2>Inventory Item Details</h2>
    <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
    <asp:Label runat="server" ID="id"></asp:Label>
    <table class="mt-3">
        <tbody>
            <tr>
                <th class="pr-5">Quantity</th>
                <td><asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
              <th>Size</th>
              <td><asp:TextBox ID="txtSize" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Measure</th>
                <td><asp:TextBox ID="txtMeasure" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Price</th>
                <td><asp:TextBox ID="txtPrice" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Product</th>
                <td><asp:TextBox ID="txtProductID" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
        </tbody>
        </table>
        <div class="mt-3">
            <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnEdit">Edit</asp:LinkButton>
            <asp:LinkButton runat="server" CssClass="btn btn-danger col-1" ID="btnDelete">Delete</asp:LinkButton>
        </div>
</asp:Content>
