<%@ Page Title="Add Employee" Language="C#" AutoEventWireup="true" CodeBehind="EmpAdd.aspx.cs" Inherits="Blue_Fish.EmpAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h1>Create Employee</h1>
    <div class="form-group">
        <label for="txtFirstName">First Name</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtLastName">Last Name</label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="ddlPosition">Position</label><asp:RequiredFieldValidator runat="server" ControlToValidate="ddlPosition" ErrorMessage=" &lt;b&gt;*&lt;/b&gt; &lt;small&gt;Please select a Position&lt;/small&gt;" ForeColor="Red" Display="Dynamic" InitialValue="Select Position"></asp:RequiredFieldValidator>
        <asp:DropDownList ID="ddlPosition" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsPosition" DataTextField="posName" DataValueField="id">
            <asp:ListItem>Select Position</asp:ListItem>
        </asp:DropDownList>
    </div>
    <asp:Button type="submit" Text="Add Employee" CssClass="btn btn-primary" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
    <asp:ObjectDataSource ID="dsPosition" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmployeeDatasetTableAdapters.PositionDDLTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_posName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="posName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="posName" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_posName" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
