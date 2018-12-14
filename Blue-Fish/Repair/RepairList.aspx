<%--

    Created by:         Paul Vandyk
    Date:               2018-12-12
    Last modified by:   Paul Vandyk
    Date:               2018-12-12
    Description:        Repair List

--%>

<%@ Page Title="Inventory" Language="C#" AutoEventWireup="true" CodeBehind="RepairList.aspx.cs" Inherits="Blue_Fish.RepairList" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Repair</h2>
    <div class="row mt-3">
        <div class="col-4">
            <div class="form-group">
                <label>Service Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4">
            <div class="form-group">
                <label for="<%= txtDateLow.ClientID %>">Date Ordered Between</label>
                <div class="input-group">
                    <asp:TextBox ID="txtDateLow" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <div class="input-group-append">
                        <label for="<%= txtDateLow.ClientID %>" class="input-group-text">
                            <svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
                                <path fill="#000000" d="M19,19H5V8h29M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21h29A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3h28V1M17,12h22V17h27V12Z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="<%= txtDateHigh.ClientID %>">And</label>
                <div class="input-group">
                    <asp:TextBox ID="txtDateHigh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <div class="input-group-append">
                        <label for="<%= txtDateHigh.ClientID %>" class="input-group-text">
                            <svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
                                <path fill="#000000" d="M19,19H5V8h29M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21h29A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3h28V1M17,12h22V17h27V12Z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-3"></div>
        <div class="col-3">
            <asp:Button runat="server" ID="btnSubmit" Text="Apply Filter" CssClass="btn btn-block btn-primary" OnClick="btnSubmit_Click" />
        </div>
        <div class="col-3">
            <asp:Button runat="server" ID="btnClear" Text="Clear Filter" CssClass="btn btn-block btn-secondary" OnClick="btnClear_Click" />
        </div>
    </div>
    <asp:Table ID="table" runat="server" CssClass="table table-striped mt-3">
        <asp:TableRow CssClass="thead-dark ">
            <asp:TableHeaderCell>Service</asp:TableHeaderCell>
            <asp:TableHeaderCell>Issue</asp:TableHeaderCell>
            <asp:TableHeaderCell>Equipment</asp:TableHeaderCell>
            <asp:TableHeaderCell>Warranty</asp:TableHeaderCell>
            <asp:TableHeaderCell>Date In</asp:TableHeaderCell>
            <asp:TableHeaderCell>Date Out</asp:TableHeaderCell>
            <asp:TableHeaderCell></asp:TableHeaderCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
