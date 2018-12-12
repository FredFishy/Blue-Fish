<%@ Page Title="Create Weekly Report" Language="C#" AutoEventWireup="true" CodeBehind="ReportAdmin.aspx.cs" Inherits="Blue_Fish.ReportAdmin" MasterPageFile="~/Site.Master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Employee Report</h1>
    <div class="row">
        <div class="col-4">
            <div class="form-group">
                <label>Full Name</label>
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4">
            <div class="form-group">
                <label>Sales Total</label>
                <div class="input-group" style="width: 78%">
                    <asp:TextBox ID="txtSizeLow" runat="server" CssClass="form-control" PlaceHolder="Min Size" TextMode="Number"></asp:TextBox>
                    <asp:TextBox ID="txtSizeHigh" runat="server" CssClass="form-control" PlaceHolder="Max Size" TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label>Sales Made</label>
                <div class="input-group" style="width: 78%">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" PlaceHolder="Min Size" TextMode="Number"></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" PlaceHolder="Max Size" TextMode="Number"></asp:TextBox>
                </div>
            </div>
        </div>
    <div class="col-4">
        <div class="form-group">
            <div class="form-group">
                <label for="<%= txtOrderDateLow.ClientID %>">Date Ordered Between</label>
                <div class="input-group">
                    <asp:TextBox ID="txtOrderDateLow" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <div class="input-group-append">
                        <label for="<%= txtOrderDateLow.ClientID %>" class="input-group-text">
                            <svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
                                <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="<%= txtOrderDateHigh.ClientID %>">And</label>
                <div class="input-group">
                    <asp:TextBox ID="txtOrderDateHigh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <div class="input-group-append">
                        <label for="<%= txtOrderDateHigh.ClientID %>" class="input-group-text">
                            <svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
                                <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                            </svg>
                        </label>
                    </div>
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
            <asp:Button runat="server" ID="btnClear" Text="Clear Filter" CssClass="btn btn-block btn-secondary" />
        </div>
    </div>

    <asp:Table ID="table" runat="server" CssClass="table table-striped mt-3">
        <asp:TableRow CssClass="thead-dark ">
            <asp:TableHeaderCell>Employee Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Sales Made</asp:TableHeaderCell>
            <asp:TableHeaderCell>Sales Total</asp:TableHeaderCell>
        </asp:TableRow>
    </asp:Table>
    <asp:ObjectDataSource ID="dsBrand" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.AdminSalesReportTableAdapters.productTableAdapter"></asp:ObjectDataSource>
</asp:Content>
