<%@ Page Title="Employees" Language="C#" AutoEventWireup="true" CodeBehind="EmpIndex.aspx.cs" Inherits="Blue_Fish.EmpIndex" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Employee List</h1>
    <a href="EmpAdd.aspx">Add a new Employee</a>

        <div class="row mt-4">
        <div class="col-4">
            <div class="form-group">
                <label>Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
                <div class="col-4" style="left: 0px; top: 0px">
            <div class="form-group">
                <label>Position</label>
                <asp:DropDownList ID="ddlPosition" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="PositionDS" DataTextField="posName" DataValueField="id">
            <asp:ListItem Value="-1">Any Position</asp:ListItem>
        </asp:DropDownList>
                <asp:ObjectDataSource ID="PositionDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmployeeDatasetTableAdapters.PositionDDLTableAdapter">
                </asp:ObjectDataSource>
                </div>
                    </div>
    </div>
        <div class="row mt-4">
            <div class="col-3"></div>
            <div class="col-3">
                    <asp:Button runat="server" ID="btnSubmit" Text="Apply Filter" CssClass="btn btn-block btn-primary" OnClick="btnSubmit_Click" />
            </div>
            <div class="col-3">
                    <asp:Button runat="server" ID="btnClear" Text="Clear Filter" CssClass="btn btn-block btn-secondary" OnClick="btnClear_Click"/>
            </div>
        </div>
        <asp:Table id="table" runat="server" CssClass="table table-striped mt-4">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Full Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Position</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell>
                    <a href='EmpAdd.aspx' title='Add Employee' class='btn btn-sm'>
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <path fill="white" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </svg>
                    </a>
                </asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
</asp:Content>
