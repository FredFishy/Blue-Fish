<%@ Page Title="Create Weekly Report" Language="C#" AutoEventWireup="true" CodeBehind="ReportAdmin.aspx.cs" Inherits="Blue_Fish.ReportAdmin" MasterPageFile="~/Site.Master" %>

    
    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Admin Report</h2>
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label>Full Name</label>
                    <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                </div>

            </div>
            <div class="col-4">
                <div class="form-group">
                    <label>Minimum Total</label>
                    <asp:TextBox runat="server" ID="txtTotal"  CssClass="form-control"></asp:TextBox>
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

        <asp:Table id="table" runat="server" CssClass="table table-striped mt-3">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Employee Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Sale Count</asp:TableHeaderCell>
                <asp:TableHeaderCell>Total</asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
        <asp:ObjectDataSource ID="dsBrand" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.AdminSalesReportTableAdapters.productTableAdapter"></asp:ObjectDataSource>
    </asp:Content>