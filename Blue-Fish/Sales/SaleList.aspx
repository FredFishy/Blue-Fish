<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SaleList.aspx.cs" Inherits="Blue_Fish.Sales.SaleList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Sale List</h1>
    <a href="SaleAdd.aspx">Add a new Sale</a>

    <div class="row mt-3">
        <div class="col-4">
            <div class="form-group">
                <label>Order Number</label>
                <asp:TextBox ID="txtOrderNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Customer Phone</label>
                <asp:TextBox ID="txtCustPhone" runat="server" Placeholder="1234567890" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4">
            <div class="form-group">
                <label>Paid</label>
                <asp:DropDownList ID="ddlPaid" runat="server" CssClass="form-control">
                    <asp:ListItem>Either</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </div>
            <label>Sale Total</label>
            <div class="input-group" style="width: 78%">
                <asp:TextBox ID="txtTotalLow" runat="server" CssClass="form-control" PlaceHolder="Min Total" TextMode="Number"></asp:TextBox>
                <asp:TextBox ID="txtTotalHigh" runat="server" CssClass="form-control" PlaceHolder="Max Total" TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <div class="col-4">
            <div class="form-group">
                <div class="form-group">
                    <label for="<%= txtDateLow.ClientID %>">Order Date Between</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtDateLow" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <div class="input-group-append">
                            <label for="<%= txtDateLow.ClientID %>" class="input-group-text">
                                <svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
                                    <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
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
                <asp:Button runat="server" ID="btnClear" Text="Clear Filter" CssClass="btn btn-block btn-secondary" OnClick="btnClear_Click"/>
        </div>
    </div>


    <asp:Table ID="table" runat="server" CssClass="table table-striped mt-3">
        <asp:TableRow CssClass="thead-dark ">
            <asp:TableHeaderCell>Order Number</asp:TableHeaderCell>
            <asp:TableHeaderCell>Customer Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Customer Phone</asp:TableHeaderCell>
            <asp:TableHeaderCell>Order Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Order Paid</asp:TableHeaderCell>
            <asp:TableHeaderCell>Order Total</asp:TableHeaderCell>
            <asp:TableHeaderCell></asp:TableHeaderCell>
            <asp:TableHeaderCell></asp:TableHeaderCell>
            <asp:TableHeaderCell>
                    <a href='SaleAdd.aspx' title='Add Sale' class='px-2 py-1 btn btn-small btn-primary'>
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="white" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                        </svg>
                    </a>
            </asp:TableHeaderCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
