<%--

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Nigel Girouard
    Date:               2018-12-09
    Description:        Edit Inventory 

--%>

<%@ Page Title="Edit Inventory Item" Language="C#" AutoEventWireup="true" CodeBehind="InventoryEdit.aspx.cs" Inherits="Blue_Fish.InventoryEdit" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel id="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h2>Edit Inventory Item</h2>
    <div class="form-group">
        <label for="txtQuantity">Quantity</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtQuantity" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" PlaceHolder="27"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtSize">Size</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtSize" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtSize" runat="server" CssClass="form-control" PlaceHolder="4.00"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtMeasure">Measure</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtMeasure" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtMeasure" runat="server" CssClass="form-control" ></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtPrice">Price</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtPrice" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtName">Name</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" PlaceHolder="Bolt"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtDescription">Description</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtDescription" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" PlaceHolder="This is made of metal"></asp:TextBox>
    </div>
    <div class="w-25 mt-4">
         <asp:Button text="Update Item" class="btn btn-primary w-100" runat="server" ID="btnSubmit" UseSubmitBehavior="False"/>
    </div>
</asp:Content>
