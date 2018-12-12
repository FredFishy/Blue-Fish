<%--

    Created by:         Paul Vandyk
    Date:               2018-12-12
    Last modified by:   Paul Vandyk
    Date:               2018-12-12
    Description:        Details Repair Item

--%>

<%@ Page Title="Repair Details" Language="C#" AutoEventWireup="true" CodeBehind="RepairDetails.aspx.cs" Inherits="Blue_Fish.RepairDetails" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel id="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h1>Repair Details</h1>
    <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
    <asp:Label runat="server" ID="id"></asp:Label>
    <table class="mt-3">
        <tbody>
            <tr>
              <th class="pr-5">Date In</th>
              <td><asp:TextBox ID="txtDateIn" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
              <th>Date Out</th>
              <td><asp:TextBox ID="txtDateOut" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Equipment</th>
                <td><asp:TextBox ID="txtEquipment" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Issue</th>
                <td><asp:TextBox ID="txtIssue" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Warranty</th>
                <td><asp:TextBox ID="txtWarranty" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>
            <tr>
                <th>Service</th>
                <td><asp:TextBox ID="txtServiceID" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
            </tr>

        </tbody>
        </table>
        <div class="mt-3">
            <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnStart" OnClick="btnStart_Click">Start Repair</asp:LinkButton>
        </div>
</asp:Content>
