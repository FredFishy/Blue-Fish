<%--

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Nigel Girouard
    Date:               2018-12-08
    Description:        Order Details

--%>

<%@ Page Title="Order Details" Language="C#" AutoEventWireup="true" CodeBehind="OrderingDetails.aspx.cs" Inherits="Blue_Fish.OrderingDetails" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Here's some content.</h2>
    <p>Content.</p>
    <div class="mt-3">
        <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnEdit">Edit</asp:LinkButton>
        <asp:LinkButton runat="server" CssClass="btn btn-danger col-1" ID="btnDelete">Delete</asp:LinkButton>
    </div>
</asp:Content>
