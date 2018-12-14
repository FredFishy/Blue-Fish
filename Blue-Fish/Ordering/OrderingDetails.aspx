<%--

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Nigel Girouard
    Date:               2018-12-08
    Description:        Order Details

--%>

<%@ Page Title="Order Details" Language="C#" AutoEventWireup="true" CodeBehind="OrderingDetails.aspx.cs" Inherits="Blue_Fish.OrderingDetails" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Order Details</h2>
    <table class="mt-3">
        <tbody>
            <tr>
                <th class="pr-5">Order Number</th>
                <td>
                    <asp:TextBox ID="txtNum" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Date Ordered</th>
                <td>
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Paid</th>
                <td>
                    <asp:TextBox ID="txtPaid" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Arrive Date</th>
                <td>
                    <asp:TextBox ID="txtArrive" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="mt-3">
        <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnEdit">Edit</asp:LinkButton>
        <asp:LinkButton runat="server" CssClass="btn btn-danger col-1" ID="btnDelete">Delete</asp:LinkButton>
    </div>
</asp:Content>
