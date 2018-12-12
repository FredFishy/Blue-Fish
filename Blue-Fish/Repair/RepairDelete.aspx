<%--

    Created by:         Paul Vandyk
    Date:               2018-12-12
    Last modified by:   Paul Vandyk
    Date:               2018-12-12
    Description:        Delete Repair Item

--%>

<%@ Page Title="Delete Inventory Item" Language="C#" AutoEventWireup="true" CodeBehind="RepairDelete.aspx.cs" Inherits="Blue_Fish.RepairDelete" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h2>Are you sure you want to delete this Inventory Item?</h2>
    <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>

    <table class="mt-3">
        <tbody>
            <tr>
                <th class="pr-5">Quantity</th>
                <td>
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Size</th>
                <td>
                    <asp:TextBox ID="txtSize" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Measure</th>
                <td>
                    <asp:TextBox ID="txtMeasure" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Price</th>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Product</th>
                <td>
                    <asp:TextBox ID="txtProductID" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
        </tbody>
    </table>
    <div class="mt-3">
        <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnConfirm" OnClick="btnConfirm_Click">Yes</asp:LinkButton>
        <asp:LinkButton PostBackUrl="~/Inventory/InventoryList.aspx" runat="server" CssClass="btn btn-secondary col-1" ID="btnCancel">No</asp:LinkButton>
    </div>
</asp:Content>
