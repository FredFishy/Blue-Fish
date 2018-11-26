﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Blue_Fish._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    <asp:Panel ID="loggedIn" runat="server" Visible ="false">
        <h1><asp:Label ID="logInMessage" runat="server" Text="Welcome "></asp:Label><asp:LoginName ID="LoginName" runat="server" />!!</h1>
    </asp:Panel>

    <asp:Panel ID="notLogged" runat="server" Visible =" false">
        <asp:Label ID="notLoggedMessage" runat="server" Text="Login"></asp:Label>
    </asp:Panel>



    

    <div class="row">
        <div class="col-md-4">
            <h2>Customer</h2>
            <ul>
            <li><p><a href="~/Management/Customer/CustAdd">New Customer</a></p></li>
            <li><p><a href="~/Management/Customer/CustIndex">Customer List</a></p></li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Employee</h2>
            <ul>
            <li><p><a href="~/Management/Employee/EmpAdd">New Employee</a></p></li>
            <li><p><a href="~/Management/Employee/EmpIndex">Employee List</a></p></li>
            </ul>
            
        </div>
        <div class="col-md-4">
            <h2>Reports</h2>
            <ul>
            <li><p><a href="~/Management/Reports/ReportSales">Sales Report</a></p></li>
            <li><p><a href="~/Management/Reports/ReportAdmin">Admin Report</a></p></li>
            </ul>
        </div>
    </div>

</asp:Content>
