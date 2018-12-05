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
                    <label for="<%= txtStartDate.ClientID %>">Start Date</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <div class="input-group-append">
                            <label for="<%= txtStartDate.ClientID %>" class="input-group-text">
                                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                                    <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>End Date</label>
                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label>Equipment Type</label>
                    <asp:DropDownList ID="ddladType" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem>Any Equipment Type</asp:ListItem>
                    </asp:DropDownList>
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
        <h3 class="mt-4">2018/11/26<asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
        </h3>
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

        <script type="text/javascript">
    $(function () {
        $('[id*=txtDate]').datepicker({
            changeMonth: true,
            changeYear: true,
            format: "dd/mm/yyyy",
        });
    });
</script>
    </asp:Content>