<%@ Page Title="Create Weekly Report" Language="C#" AutoEventWireup="true" CodeBehind="ReportAdmin.aspx.cs" Inherits="Blue_Fish.ReportAdmin" MasterPageFile="~/Site.Master" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Admin Report</h2>
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label>Department</label>
                    <asp:DropDownList ID="ddladDepart" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem>Any Department</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Manufacturer</label>
                    <asp:DropDownList ID="ddladManu" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem>Any Manufacturer</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label>Month</label>
                    <asp:DropDownList ID="ddladMonth" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem>Select Month</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Week</label>
                    <asp:DropDownList ID="ddladWeek" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem>Select Week</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </div>
            <div class="col-4">

                <div class="form-group">
                    <label>Equipment Type</label>
                    <asp:DropDownList ID="ddladType" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem>Any Equipment Type</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label></label>
                    <asp:Button ID="btnadSearch" runat="server" Text="Search" class="btn btn-primary btn-block" />
                </div>
            </div>
        </div>
        <h3 class="mt-4">2018/11/26</h3>
        <table class="table table-striped">
            <tr>
                <th>Name</th>
                <th>Number</th>
                <th>Description</th>
                <th>Date</th>
                <th>Warranty</th>
                <th>Qty</th>
                <th>Order-Price</th>
                <th>Amount</th>
                <th>Gross Profit</th>
            </tr>
            <tr>
                <td>2 stroke oil</td>
                <td>20180001</td>
                <td>Blue-Oil </td>
                <td>11/12/2018</td>
                <td>Yes</td>
                <td>1</td>
                <td>2.00</td>
                <td>0</td>
                <td>-2.00</td>
            </tr>
            <tr>
                <td>Fuel Stabilizer</td>
                <td>20180002</td>
                <td>Red-Oil</td>
                <td>11/14/2018</td>
                <td>No</td>
                <td>1</td>
                <td>3.00</td>
                <td>11.00</td>
                <td>1</td>
            </tr>
            <tr>
                <td>40:1 Mixed Gas</td>
                <td>20180010</td>
                <td>Yellow-Oil</td>
                <td>11/16/2018</td>
                <td>No</td>
                <td>1</td>
                <td>4.00</td>
                <td>12.00</td>
                <td>1.56</td>
            </tr>
            <tr>
                <td>Blade</td>
                <td>20170011</td>
                <td>Black-Oil</td>
                <td>11/16/2018</td>
                <td>No</td>
                <td>1</td>
                <td>5.00</td>
                <td>11.00</td>
                <td>1.43</td>
            </tr>
            <tr>
                <th>Grand Total</th>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>55.00</td>
                <td>5.72</td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <p>Content.</p>
    </asp:Content>