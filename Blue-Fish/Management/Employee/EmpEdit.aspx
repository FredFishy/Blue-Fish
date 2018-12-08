<%@ Page Title="Edit Employee" Language="C#" AutoEventWireup="true" CodeBehind="EmpEdit.aspx.cs" Inherits="Blue_Fish.EmpEdit" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel id="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h1>Edit Employee</h1>
        <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
    <div class="form-group">
        <label for="txtFirstName">First Name</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtLastName">Last Name</label><asp:RequiredfieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredfieldValidator>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
            <div class="form-group">
                <label>Position</label><asp:RequiredfieldValidator runat="server" ControlToValidate="ddlPosition" ErrorMessage=" &lt;b&gt;*&lt;/b&gt; &lt;small&gt;Please select a Position&lt;/small&gt;" ForeColor="Red" Display="Dynamic" InitialValue="Select Position"></asp:RequiredfieldValidator>
                <asp:DropDownList ID="ddlPosition" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="PositionDS" DataTextField="posName" DataValueField="id">
                    <asp:ListItem>Select Position</asp:ListItem>
        </asp:DropDownList>
                <asp:ObjectDataSource ID="PositionDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmployeeDatasetTableAdapters.PositionDDLTableAdapter">
                </asp:ObjectDataSource>
                </div>
        <div class="w-25 mt-4">
         <asp:Button text="Update Information" class="btn btn-primary w-100" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click"/>
    </div>
</asp:Content>
