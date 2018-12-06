<%@ Page Title="Delete Employee" Language="C#" AutoEventWireup="true" CodeBehind="EmpDelete.aspx.cs" Inherits="Blue_Fish.EmpDelete" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel id="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblStatus" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h1>Are you sure you want to delete this Employee?</h1>
    <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
    <table class="mt-3">
        <tbody>
            <tr>
                <th class="pr-5">First Name</th>
                <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Bob</asp:TextBox></td>
            </tr>
            <tr>
              <th>Last Name</th>
              <td><asp:TextBox ID="txtLastName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Boberson</asp:TextBox></td>
            </tr>
            <tr>
                <th>Position</th>
                <td><asp:TextBox ID="txtPosition" runat="server" CssClass="form-control-plaintext" ReadOnly="true">Manager</asp:TextBox></td>
            </tr>
        </tbody>
    </table>
        <div class="mt-3">
            <asp:LinkButton runat="server" CssClass="btn btn-primary col-1" ID="btnConfirm" OnClick="btnConfirm_Click">Yes</asp:LinkButton>
            <asp:LinkButton PostBackUrl="~/Management/Customer/CustIndex.aspx" runat="server" CssClass="btn btn-secondary col-1" ID="btnCancel">No</asp:LinkButton>
        </div>
</asp:Content>
