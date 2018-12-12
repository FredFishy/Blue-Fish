<%--

    Created by:         Nigel Girouard
    Date:               2018-11-12
    Last modified by:   Nigel Girouard
    Date:               2018-12-12
    Description:        Home page

--%>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Blue_Fish._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    <asp:Panel ID="loggedIn" runat="server" Visible ="false">
        <h1><asp:Label ID="logInMessage" runat="server" Text="Welcome, "></asp:Label><asp:LoginName class="text-info" ID="LoginName" runat="server" /><asp:Label runat="server">!</asp:Label></h1>
    </asp:Panel>

   
    <div class="jumbotron">
        <h1>Emma's Small Engine shop </h1>
        <p class="lead">We fix any and all home lawn care equipment, at affordable prices.</p>
    </div>
    

    <div class="row">
        <div class="col-md-4">
            <h2>Customer</h2>
            <ul>
            <li><p><a href="/Customer/CustAdd">New Customer</a></p></li>
            <li><p><a href="/Customer/CustIndex">Customer List</a></p></li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Employee</h2>
            <ul>
            <li><p><a href="/Management/Employee/EmpAdd">New Employee</a></p></li>
            <li><p><a href="/Management/Employee/EmpIndex">Employee List</a></p></li>
            </ul>            
        </div>
        <div class="col-md-4">
            <h2>Sales</h2>
            <ul>
            <li><p><a href="/Sales/SaleAdd">New Sales</a></p></li>
            <li><p><a href="/Sales/SaleList">Sales List</a></p></li>
            </ul>
        </div>       
        <div class="col-md-4">
            <h2>Inventory</h2>
            <ul>
            <li><p><a href="/Inventory/InventoryAdd">New Inventory</a></p></li>
            <li><p><a href="/Inventory/InventoryList">Inventory List</a></p></li>
            </ul>
        </div>
         <div class="col-md-4">
            <h2>Order</h2>
            <ul>
            <li><p><a href="/Ordering/OrderingAdd">New Order</a></p></li>
            <li><p><a href="/Ordering/OrderingList">Order List</a></p></li>
            </ul>
        </div>
        
        <div class="col-md-4">
            <h2>Reports</h2>
            <ul>
            <li><p><a href="/Management/Reports/ReportSales">Sales Report</a></p></li>
            <li><p><a href="/Management/Reports/ReportAdmin">Admin Report</a></p></li>
            <li><p><a href="/Management/Reports/ReportWarranty">Warranty Report</a></p></li>
            </ul>
        </div>
    </div>

</asp:Content>
