<%--

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Will Ashcroft
    Date:               2018-12-08
    Description:        Add Order

--%>

<%@ Page Title="Create Order" Language="C#" AutoEventWireup="true" CodeBehind="OrderingAdd.aspx.cs" Inherits="Blue_Fish.OrderingAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>New Order</h1>
    <div class="row">
        <div class="col-4">
            <div class="form-group">
                <label for="<%= txtDateOrdered.ClientID %>">Date Ordered</label>
                <div class="input-group">
                    <asp:TextBox ID="txtDateOrdered" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <div class="input-group-append">
                        <label for="<%= txtDateOrdered.ClientID %>" class="input-group-text">
                            <svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
                                <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="lbInventory">Item to Order</label><asp:RequiredFieldValidator runat="server" ControlToValidate="lbInventory" ErrorMessage=" <b>*</b> <small>Please select an Item</small>" ForeColor="Red" Display="Dynamic" InitialValue=""></asp:RequiredFieldValidator>
                <asp:ListBox ID="lbInventory" runat="server" DataSourceID="dsInv" DataTextField="display" DataValueField="id" CssClass="form-control" Height="150px"></asp:ListBox>
            </div>
            <div class="form-group">
                <label for="txtQuantity">Quantity</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuantity" ErrorMessage=" <b>*</b> <small>Please enter a Quantity</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button Text="Add to Order" CssClass="btn btn-primary btn-block form-control" runat="server" ID="btnAddItem" OnClick="btnAddItem_Click" />
            </div>
        </div>
        <div class="col-8">
            <asp:Label runat="server" ID="lblOrder" Visible="false"><h3>Order Summary</h3></asp:Label>
            <asp:Table ID="table" runat="server" CssClass="table table-striped mt-3" Visible="false">
                <asp:TableRow CssClass="thead-dark ">
                    <asp:TableHeaderCell>Item</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Quantity</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Price</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Total</asp:TableHeaderCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-3"></div>
        <div class="col-3">
            <asp:Button runat="server" ID="btnSubmit" Text="Place Order" CssClass="btn btn-block btn-primary" />
        </div>
        <div class="col-3">
            <asp:Button runat="server" ID="btnClear" Text="Cancel" CssClass="btn btn-block btn-secondary" />
        </div>
    </div>
    <asp:ObjectDataSource ID="dsInv" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.InventoryDataSetTableAdapters.InventoryTableAdapter"></asp:ObjectDataSource>
</asp:Content>
