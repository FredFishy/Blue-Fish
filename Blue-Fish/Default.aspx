<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Blue_Fish._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <p>Here is a direct list of all the pages that need to be created.</p>
        <ul>
            <li><a runat="server" href="~/Management/Customer/CustIndex">CustIndex</a></li>
            <li><a runat="server" href="~/Management/Customer/CustAdd">CustAdd</a></li>
            <li><a runat="server" href="~/Management/Customer/CustEdit">CustEdit</a></li>
            <li><a runat="server" href="~/Management/Customer/CustDelete">CustDelete</a></li>
            </ul><ul>
            <li><a runat="server" href="~/Management/Employee/EmpIndex">EmpIndex</a></li>
            <li><a runat="server" href="~/Management/Employee/EmpAdd">EmpAdd</a></li>
            <li><a runat="server" href="~/Management/Employee/EmpEdit">EmpEdit</a></li>
            <li><a runat="server" href="~/Management/Employee/EmpDelete">EmpDelete</a></li>
            </ul><ul>
            <li><a runat="server" href="~/Management/Reports/ReportWarrantyCreate">ReportWarrantyCreate</a></li>
            <li><a runat="server" href="~/Management/Reports/ReportWeeklyCreate">ReportWeeklyCreate</a></li>
            <li><a runat="server" href="~/Management/Reports/ReportEdit">ReportEdit</a></li>
            <li><a runat="server" href="~/Management/Reports/ReportDelete">ReportDelete</a></li>
            <li><a runat="server" href="~/Management/Reports/ReportIndex">ReportIndex</a></li>
            </ul><ul>
            <li><a runat="server" href="~/Sales/SaleAdd">SaleAdd</a></li>
            <li><a runat="server" href="~/Sales/SaleSearch">SaleSearch</a></li>
            </ul><ul>
            <li><a runat="server" href="~/LandingPage">LandingPage</a></li>
            </ul><ul>
            <li><a runat="server" href="~/Login">Login</a></li>

        </ul>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
