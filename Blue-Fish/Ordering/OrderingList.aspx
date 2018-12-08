<%@ Page Title="Ordering" Language="C#" AutoEventWireup="true" CodeBehind="OrderingList.aspx.cs" Inherits="Blue_Fish.OrderingList" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Here's some content.</h2>
    <p>Content.</p>

    <asp:Table id="table" runat="server" CssClass="table table-striped mt-3">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Order Number</asp:TableHeaderCell>
                <asp:TableHeaderCell>Date Ordered</asp:TableHeaderCell>
                <asp:TableHeaderCell>Paid?</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell>
                    <a href='#' title='Add Order' class='btn btn-sm'>
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <path fill="white" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </svg>
                    </a>
                </asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
</asp:Content>
