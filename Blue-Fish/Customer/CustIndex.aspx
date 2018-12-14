<%@ Page Title="Customers" Language="C#" AutoEventWireup="true" CodeBehind="CustIndex.aspx.cs" Inherits="Blue_Fish.CustIndex" MasterPageFile="~/Site.Master" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Customer List</h2>
        <a href="CustAdd.aspx">Add a new Customer</a>

        <div class="row mt-3">
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
        <div class="row mt-4">
            <div class="col-3"></div>
            <div class="col-3">
                    <asp:Button runat="server" ID="btnSubmit" Text="Apply Filter" CssClass="btn btn-block btn-primary" OnClick="btnSubmit_Click" />

            </div>
            <div class="col-3">
                    <asp:Button runat="server" ID="btnClear" Text="Clear Filter" CssClass="btn btn-block btn-secondary" OnClick="btnClear_Click"/>
            </div>
        </div>


        <asp:Table id="table" runat="server" CssClass="table table-striped mt-3">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Full Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Phone Number</asp:TableHeaderCell>
                <asp:TableHeaderCell>City</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell>
                    <a href='CustAdd.aspx' title='Add Customer' class='px-2 py-1 btn btn-small btn-primary'>
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="white" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                        </svg>
                    </a>
                </asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Content>