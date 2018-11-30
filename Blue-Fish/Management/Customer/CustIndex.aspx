<%@ Page Title="Customers" Language="C#" AutoEventWireup="true" CodeBehind="CustIndex.aspx.cs" Inherits="Blue_Fish.CustIndex" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Customer Index</h1>
    <a href="CustAdd.aspx">Create Customer</a>
    <div class="row mt-4">
        <div class="col-4">
            <div class="form-group">
                <label>First Name</label>
                    <asp:TextBox ID="txtSearchFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-4">
            <div class="form-group">
                <label>Last Name</label>
                    <asp:TextBox ID="txtSearchLastName" runat="server" CssClass="form-control"></asp:TextBox >
                </div>
                </div>
                <div class="col-4">
            <div class="form-group">
                <label>Phone Number</label>
        <asp:TextBox ID="txtSearchPhoneNumber" runat="server" Placeholder="Phone Number" CssClass="form-control"></asp:TextBox >
                </div>
                    </div>
    </div>
    <div class="row">
        <div class="col-8"></div>
        <div class="col-4">
                <div class="form-group">
                <label></label>
                <input type="Submit" value="Search" class="btn btn-block btn-primary"/>
                </div>
        </div>
    </div>
<asp:Table id="tblCustomer" runat="server" CssClass="table table-striped">
       <asp:TableRow CssClass="thead-dark ">
        <asp:TableHeaderCell>Full Name</asp:TableHeaderCell>
        <asp:TableHeaderCell>Phone Number</asp:TableHeaderCell>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell></asp:TableHeaderCell>
        <asp:TableHeaderCell></asp:TableHeaderCell>
    </asp:TableRow>
</asp:Table>
</asp:Content>
