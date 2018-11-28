<%@ Page Title="Customers" Language="C#" AutoEventWireup="true" CodeBehind="CustIndex.aspx.cs" Inherits="Blue_Fish.CustIndex" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Customer Index</h1>
    <a href="CustAdd.aspx">Create Customer</a>
    <div class="row mt-4">
        <div class="col-4">
            <div class="form-group">
                <label>First Name</label>
                    <asp:TextBox ID="txtSearchFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-4">
            <div class="form-group">
                <label>Last Name</label>
                    <asp:TextBox ID="txtSearchLastName" runat="server" CssClass="form-control"></asp:TextBox >
                </div>
                </div>
                <div class="col-4">
            <div class="form-group">
                <label>Phone Number</label>
        <asp:TextBox ID="txtSearchPhoneNumber" runat="server" Placeholder="Phone Number" CssClass="form-control"></asp:TextBox >
                </div>
                    </div>
    </div>
    <div class="row">
        <div class="col-8"></div>
        <div class="col-4">
                <div class="form-group">
                <label></label>
                <input type="Submit" value="Search" class="btn btn-block btn-primary"/>
                </div>
        </div>
    </div>
    <table class="table table-striped mt-4">
      <thead>
        <tr>
            <th>First</th>
            <th>Last</th>
            <th>Phone Number</th>
            <th></th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td class="align-middle">Mark</td>
            <td class="align-middle">Otto</td>
            <td class="align-middle">1234567890</td>
            <td class="d-flex justify-content-end">
                    <a href="CustDetails.aspx" title="Details" class="btn btn-sm w-30">
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="#000000" d="M7.5,15C8.63,15 9.82,15.26 11.09,15.77C12.35,16.29 13,16.95 13,17.77V20H2V17.77C2,16.95 2.65,16.29 3.91,15.77C5.18,15.26 6.38,15 7.5,15M13,13H22V15H13V13M13,9H22V11H13V9M13,5H22V7H13V5M7.5,8A2.5,2.5 0 0,1 10,10.5A2.5,2.5 0 0,1 7.5,13A2.5,2.5 0 0,1 5,10.5A2.5,2.5 0 0,1 7.5,8Z" />
                        </svg>
                    </a>
                    <a href="CustEdit.aspx" title="Edit" class="btn btn-sm w-30">
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="#000000" d="M20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18,2.9 17.35,2.9 16.96,3.29L15.12,5.12L18.87,8.87M3,17.25V21H6.75L17.81,9.93L14.06,6.18L3,17.25Z" />
                        </svg>
                    </a>
                    <a href="CustDelete.aspx" title="Delete" class="btn btn-sm w-30">
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="#000000" d="M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z" />
                        </svg>
                    </a>
            </td>
        </tr>
      </tbody>
    </table>
</asp:Content>
