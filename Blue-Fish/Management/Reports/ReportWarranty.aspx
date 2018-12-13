<%--

    Created by:         Nigel Girouard
    Date:               2018-12-11
    Last modified by:   Nigel Girouard
    Date:               2018-12-13
    Description:        Warranty report

--%>

<%@ Page Title="Create Warranty Report" Language="C#" AutoEventWireup="true" CodeBehind="ReportWarranty.aspx.cs" Inherits="Blue_Fish.ReportWarranty" MasterPageFile="~/Site.Master" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Warranty Report</h2>
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label>Manufacturer</label>
                    <asp:DropDownList ID="ddlManufact" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="sdsManufact" DataTextField="manName" DataValueField="id">
                        <asp:ListItem>All manufacturers</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-4">
            <div class="form-group">
                <div class="form-group">
                    <label for="<%= txtDateInLow.ClientID %>">Date In Between</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtDateInLow" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <div class="input-group-append">
                            <label for="<%= txtDateInLow.ClientID %>" class="input-group-text">
                                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                                    <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="<%= txtDateInHigh.ClientID %>">And</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtDateInHigh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <div class="input-group-append">
                            <label for="<%= txtDateInHigh.ClientID %>" class="input-group-text">
                                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                                    <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                <div class="col-4">
            <div class="form-group">
                <div class="form-group">
                    <label for="<%= txtDateOutLow.ClientID %>">Date Out Between</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtDateOutLow" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <div class="input-group-append">
                            <label for="<%= txtDateOutLow.ClientID %>" class="input-group-text">
                                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                                    <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="<%= txtDateOutHigh.ClientID %>">And</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtDateOutHigh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <div class="input-group-append">
                            <label for="<%= txtDateOutHigh.ClientID %>" class="input-group-text">
                                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                                    <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>
        <div class="row mt-3">
            <div class="col-3"></div>
            <div class="col-3">
                <asp:Button runat="server" ID="btnSubmit" Text="Apply Filter" CssClass="btn btn-block btn-primary" OnClick="btnSubmit_Click" />

            </div>
            <div class="col-3">
                <asp:Button runat="server" ID="btnClear" Text="Clear Filter" CssClass="btn btn-block btn-secondary" OnClick="btnClear_Click" />
            </div>
        </div>

        <asp:Table id="table" runat="server" CssClass="table table-striped mt-3">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Manufacturer</asp:TableHeaderCell>
                <asp:TableHeaderCell>Issue</asp:TableHeaderCell>
                <asp:TableHeaderCell>Date In</asp:TableHeaderCell>
                <asp:TableHeaderCell>Date Out</asp:TableHeaderCell>
                <asp:TableHeaderCell>Price</asp:TableHeaderCell>

            </asp:TableRow>
        </asp:Table>

        <asp:SqlDataSource ID="sdsManufact" runat="server" ConnectionString="<%$ ConnectionStrings:EmmaConnectionString %>" SelectCommand="SELECT manName, id FROM manufacturer"></asp:SqlDataSource>
    </asp:Content>