<%@ Page Title="Customers" Language="C#" AutoEventWireup="true" CodeBehind="CustIndex.aspx.cs" Inherits="Blue_Fish.CustIndex" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Customer Index</h1>
    <table class="table table-striped">
      <thead>
        <tr>
            <th>First</th>
            <th>Last</th>
            <th>Phone Number</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td>Mark</td>
            <td>Otto</td>
            <td>1234567890</td>
        </tr>
        <tr>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>1234567890</td>
        </tr>
        <tr>
            <td>Larry</td>
            <td>King</td>
            <td>1234567890</td>
        </tr>
      </tbody>
    </table>
</asp:Content>
