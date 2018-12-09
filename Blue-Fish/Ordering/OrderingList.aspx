﻿<%--

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Nigel Girouard
    Date:               2018-12-08
    Description:        Order list 

--%>

<%@ Page Title="Ordering" Language="C#" AutoEventWireup="true" CodeBehind="OrderingList.aspx.cs" Inherits="Blue_Fish.OrderingList" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Ordering</h1>
    <a href="OrderingAdd.aspx">Add an Order</a>

    <div class="row">
        <div class="col-4">
            <div class="form-group">
                <label>Order Number</label>
                <asp:TextBox ID="txtOrderNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Paid for?</label>
                <asp:DropDownList ID="ddlPaid" runat="server" CssClass="form-control">
                    <asp:ListItem>Either</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-4">
            <div class="form-group">
                <label>Date Ordered between</label>
                <asp:TextBox ID="txtOrderDateLow" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <div class="input-group-append">
                    <label for="<%= txtOrderDateLow.ClientID %>" class="input-group-text">
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                        </svg>
                    </label>
                </div>
                <label>and</label>
                <asp:TextBox ID="txtOrderDateHigh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <div class="input-group-append">
                    <label for="<%= txtOrderDateHigh.ClientID %>" class="input-group-text">
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                        </svg>
                    </label>
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
                <asp:Button runat="server" ID="btnClear" Text="Clear Filter" CssClass="btn btn-block btn-secondary" OnClick="btnClear_Click"/>
        </div>
    </div>

    <asp:Table id="table" runat="server" CssClass="table table-striped mt-3">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Order Number</asp:TableHeaderCell>
                <asp:TableHeaderCell>Date Ordered</asp:TableHeaderCell>
                <asp:TableHeaderCell>Paid for?</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell>
                    <a href='OrderingAdd.aspx' title='Add Order' class='btn btn-sm'>
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <path fill="white" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </svg>
                    </a>
                </asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
</asp:Content>
