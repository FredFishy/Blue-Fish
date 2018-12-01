<%@ Page Title="Employees" Language="C#" AutoEventWireup="true" CodeBehind="EmpIndex.aspx.cs" Inherits="Blue_Fish.EmpIndex" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Employee Index</h1>
    <a href="EmpAdd.aspx">Create Employee</a>

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
                <asp:ObjectDataSource ID="PositionDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmployeeDatasetTableAdapters.PositionDDLTableAdapter" UpdateMethod="Update">
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
                </div>
                    </div>
    </div>
        <div class="row">
        <div class="col-8"></div>
        <div class="col-4">
                <div class="form-group">
                <label></label>
                <asp:Button runat="server" ID="btnSubmit" Text="Search" CssClass="btn btn-block btn-primary" OnClick="btnSubmit_Click" />
                </div>
        </div>
    </div>
        <asp:Table id="tblCustomer" runat="server" CssClass="table table-striped mt-4">
            <asp:TableRow CssClass="thead-dark ">
                <asp:TableHeaderCell>Full Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Position</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
</asp:Content>
