<%@ Page Title="Edit Employee" Language="C#" AutoEventWireup="true" CodeBehind="EmpEdit.aspx.cs" Inherits="Blue_Fish.EmpEdit" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Edit Employee</h1>
    <div class="form-group">
        <label for="txtFirstName">First Name</label>&nbsp;
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtLastName">Last Name</label>&nbsp;
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
            <div class="form-group">
                <label>Position</label>
                <asp:DropDownList ID="ddlPosition" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="PositionDS" DataTextField="posName" DataValueField="id">
        </asp:DropDownList>
                <asp:ObjectDataSource ID="PositionDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmployeeDatasetTableAdapters.PositionDDLTableAdapter">
                </asp:ObjectDataSource>
                </div>
</asp:Content>
