<%@ Page Title="Search Sales" Language="C#" AutoEventWireup="true" CodeBehind="SaleSearch.aspx.cs" Inherits="Blue_Fish.SaleSearch" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <h1>Customer Index</h1>
    <a href="CustAdd.aspx">Create Customer</a>
    <div class="row mt-4">
        <div class="col-4">
            <div class="form-group">
                <label>Customer Name</label>
                    <asp:TextBox ID="txtSearchFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-4">
            <div class="form-group">
                <label>Employee Name </label>
                    <asp:TextBox ID="txtSearchLastName" runat="server" CssClass="form-control"></asp:TextBox >
                </div>
                </div>
                <div class="col-4">
            <div class="form-group">
                <label>Date</label>
        <asp:TextBox ID="txtSearchPhoneNumber" runat="server" Placeholder="Phone Number" CssClass="form-control"></asp:TextBox >
                </div>
                               <div class="form-group">
                <label></label>
                <input type="Submit" value="Search" class="btn btn-block btn-primary"/>
                </div>
                    </div>
    </div>
    <table class="table table-striped mt-4">
      <thead>
        <tr>
            <th>Customer Name</th>
            <th>Employee Name</th>
            <th>Payment Type</th>
            <th>Date</th>
            <th></th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td class="align-middle">Mark Jimmerson</td>
            <td class="align-middle">Otto Bobberson</td>
            <td class="align-middle">Credit</td>
            <td class="align-middle">Today</td>
            <td class="d-flex justify-content-end">
                    <a href="SaleDetails.aspx" title="Details" class="btn btn-sm w-30">
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="#000000" d="M7.5,15C8.63,15 9.82,15.26 11.09,15.77C12.35,16.29 13,16.95 13,17.77V20H2V17.77C2,16.95 2.65,16.29 3.91,15.77C5.18,15.26 6.38,15 7.5,15M13,13H22V15H13V13M13,9H22V11H13V9M13,5H22V7H13V5M7.5,8A2.5,2.5 0 0,1 10,10.5A2.5,2.5 0 0,1 7.5,13A2.5,2.5 0 0,1 5,10.5A2.5,2.5 0 0,1 7.5,8Z" />
                        </svg>
                    </a>
            </td>
        </tr>
      </tbody>
    </table>
</asp:Content>
