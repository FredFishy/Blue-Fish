<%@ Page Title="Create Weekly Report" Language="C#" AutoEventWireup="true" CodeBehind="ReportSales.aspx.cs" Inherits="Blue_Fish.ReportSales" MasterPageFile="~/Site.Master" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Sales Report</h2>
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label>Department</label>
                    <asp:DropDownList ID="ddlDepart" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem>Any Department</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </div>
            <div class="col-4">
                <div class="form-group">
                    <label>Month</label>
                    <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem>Select Month</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </div>
            <div class="col-4">
                <div class="form-group">
                    <label>Week</label>
                    <asp:DropDownList ID="ddlWeek" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem>Select Week</asp:ListItem>
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
                <th>Size</th>
                <th>Date</th>
                <th>Warranty</th>
                <th>Qty</th>
                <th>Amount</th>
                <th>Tax</th>
                <th>Total</th>
            </tr>
            <tr>
                <td>2 stroke oil</td>
                <td>20180001</td>

                <td>Blue-Oil </td>
                <td>Small</td>
                <td>11/12/2018</td>
                <td>Yes</td>
                <td>1</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
            </tr>
            <tr>
                <td>Fuel Stabilizer</td>
                <td>20180002</td>
                <td>Red-Oil</td>
                <td>Medium</td>
                <td>11/14/2018</td>
                <td>No</td>
                <td>1</td>
                <td>11.00</td>
                <td>1.43</td>
                <td>12.43</td>
            </tr>
            <tr>
                <td>40:1 Mixed Gas</td>
                <td>20180010</td>
                <td>Yellow-Oil</td>
                <td>Large</td>
                <td>11/16/2018</td>
                <td>No</td>
                <td>1</td>
                <td>12.00</td>
                <td>1.56</td>
                <td>13.56</td>
            </tr>
            <tr>
                <td>Blade</td>
                <td>20170011</td>
                <td>Black-Oil</td>
                <td>11/16/2018</td>
                <td>No</td>
                <td>1</td>
                <td>11.00</td>
                <td>1.43</td>
                <td>12.43</td>
                <td>12.43</td>
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
                <td>65.72</td>

            </tr>
        </table>
        <p>&nbsp;</p>
        <p>Content.</p>
    </asp:Content>