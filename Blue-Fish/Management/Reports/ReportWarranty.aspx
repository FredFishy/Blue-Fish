<%--

    Created by:         Nigel Girouard
    Date:               2018-12-11
    Last modified by:   Nigel Girouard
    Date:               2018-12-12
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
        </div>
        <div class="row">
            <div class="col-8"></div>
                <div class="col-4">
                        <div class="form-group">
                            <asp:Button type="Submit" value="Search" CssClass="btn btn-block btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click"/>
                        </div>
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