<%--

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Will Ashcroft
    Date:               2018-12-08
    Description:        Inventory list 

--%>

<%@ Page Title="Inventory" Language="C#" AutoEventWireup="true" CodeBehind="InventoryList.aspx.cs" Inherits="Blue_Fish.InventoryList" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Inventory</h1>
    <a href="InventoryAdd.aspx">Add item to Inventory</a>

    <div class="row mt-3">
        <div class="col-4">
                        <div class="form-group">
                <label>Quantity</label>
                    <div class="input-group" style="width: 78%">
                        <asp:TextBox ID="txtQuantityLow" runat="server" CssClass="form-control" PlaceHolder="Min Quantity"></asp:TextBox>
                        <asp:TextBox ID="txtQuantityHigh" runat="server" CssClass="form-control" PlaceHolder="Max Quantity"></asp:TextBox>
                    </div>
            </div>
            <div class="form-group">
                <label>Size</label>
                    <div class="input-group" style="width: 78%">
                        <asp:TextBox ID="txtSizeLow" runat="server" CssClass="form-control" PlaceHolder="Min Size"></asp:TextBox>
                        <asp:TextBox ID="txtSizeHigh" runat="server" CssClass="form-control" PlaceHolder="Max Size"></asp:TextBox>
                    </div>
            </div>
        </div>
        <div class="col-4">
            <div class="form-group">
                <label>Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

        </div>
        <div class="col-4">
            <div class="form-group">
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
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
                <asp:TableHeaderCell>Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Description</asp:TableHeaderCell>
                <asp:TableHeaderCell>Size</asp:TableHeaderCell>
                <asp:TableHeaderCell>Quantity</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell>
                    <a href='InventoryAdd.aspx' title='Add item to Inventory' class='btn btn-sm'>
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <path fill="white" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </svg>
                    </a>
                </asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
</asp:Content>
