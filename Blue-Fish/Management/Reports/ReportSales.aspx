<%@ Page Title="Create Weekly Report" Language="C#" AutoEventWireup="true" CodeBehind="ReportSales.aspx.cs" Inherits="Blue_Fish.ReportSales" MasterPageFile="~/Site.Master" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h1>Sales Report</h1>
        <h4>Party Fund: <asp:Label ID="lblParty" runat="server"></asp:Label></h4>
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label>Brand</label>
                    <asp:DropDownList ID="ddlBrand" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsBrand" DataTextField="prodBrand" DataValueField="prodBrand">
                        <asp:ListItem Value="0">Any Brand</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Paid</label>
                    <asp:DropDownList ID="ddlPaid" runat="server" CssClass="form-control">
                        <asp:ListItem>Either</asp:ListItem>
                        <asp:ListItem>True</asp:ListItem>
                        <asp:ListItem>False</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label for="<%= txtStartDate.ClientID %>">Start Date</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <div class="input-group-append">
                            <label for="<%= txtStartDate.ClientID %>" class="input-group-text">
                                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                                    <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="<%= txtEndDate.ClientID %>">End Date</label>
                    <div class="input-group">
                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <div class="input-group-append">
                        <label for="<%= txtEndDate.ClientID %>" class="input-group-text">
                            <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                                <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                            </svg>
                        </label>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-8"></div>
                <div class="col-4">
                        <div class="form-group">
                            <label>
                            <asp:ObjectDataSource ID="dsBrand" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.AdminSalesReportTableAdapters.productTableAdapter"></asp:ObjectDataSource>
                            </label>
                            <asp:Button type="Submit" value="Search" CssClass="btn btn-block btn-primary" runat="server" Text="Search" OnClick="Unnamed1_Click"/>
                        </div>
                </div>
        </div>

        <asp:Table id="table" runat="server" CssClass="table table-striped mt-3">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Order Number</asp:TableHeaderCell>
                <asp:TableHeaderCell>Date</asp:TableHeaderCell>
                <asp:TableHeaderCell>Number of Items</asp:TableHeaderCell>
                <asp:TableHeaderCell>Total</asp:TableHeaderCell>

            </asp:TableRow>
        </asp:Table>
    </asp:Content>