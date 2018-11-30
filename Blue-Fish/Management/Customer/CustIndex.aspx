<%@ Page Title="Customers" Language="C#" AutoEventWireup="true" CodeBehind="CustIndex.aspx.cs" Inherits="Blue_Fish.CustIndex" MasterPageFile="~/Site.Master" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h1>Customer Index</h1>
        <a href="CustAdd.aspx">Create Customer</a>
        <div class="row mt-4">
            <div class="col-4">
                <div class="form-group">
                    <label>Name</label>
                    <asp:TextBox ID="txtName" runat="server" Placeholder="First Last" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label>Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" Placeholder="1234567890" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label>City</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-8"></div>
            <div class="col-4">
                <div class="form-group">
                    <label></label>
                    <asp:Button runat="server" ID="btnSubmit" Text="Search" CssClass="btn btn-block btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
        <asp:Table id="tblCustomer" runat="server" CssClass="table table-striped mt-4">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Full Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Phone Number</asp:TableHeaderCell>
                <asp:TableHeaderCell>City</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Content>