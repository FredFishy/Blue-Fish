<%@ Page Title="Create Weekly Report" Language="C#" AutoEventWireup="true" CodeBehind="ReportAdmin.aspx.cs" Inherits="Blue_Fish.ReportWeeklyCreate" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Admin Report</h2>
    <p>&nbsp;</p>
    <table style="width: 847px">
        <tr>
            <td style="width: 182px">
        <asp:TextBox ID="txtadDepart" runat="server" Width="107px">Department: </asp:TextBox>
            </td>
            <td style="width: 326px">
                <asp:DropDownList ID="ddladDepart" runat="server" Width="154px">
                </asp:DropDownList>
            </td>
            <td style="width: 259px">
        <asp:TextBox ID="txtadManu" runat="server" Width="160px">Manufacturer</asp:TextBox>
            </td>
            <td style="width: 503px">
                <asp:DropDownList ID="ddladManu" runat="server" Width="154px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="height: 36px; width: 182px">
        <asp:TextBox ID="txtadMonth" runat="server" Width="107px">Month: </asp:TextBox>
            </td>
            <td style="height: 36px; width: 326px">
                <asp:DropDownList ID="ddladMonth" runat="server" Width="153px">
                </asp:DropDownList>
            </td>
            <td style="width: 259px; height: 36px">
        <asp:TextBox ID="txtadType" runat="server" Width="160px">equType</asp:TextBox>
            </td>
            <td style="width: 503px; height: 36px">
                <asp:DropDownList ID="ddladType" runat="server" Width="154px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 182px">
        <asp:TextBox ID="txtadWeek" runat="server" Width="107px">Week:</asp:TextBox>
            </td>
            <td style="width: 326px">
                <asp:DropDownList ID="ddladWeek" runat="server" Width="151px">
                </asp:DropDownList>
            </td>
            <td style="width: 259px">&nbsp;</td>
            <td style="width: 503px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 182px; height: 31px"></td>
            <td style="width: 326px; height: 31px"></td>
            <td style="width: 259px; height: 31px">&nbsp;</td>
            <td style="width: 503px; height: 31px"></td>
        </tr>
        <tr>
            <td style="width: 182px">
                &nbsp;</td>
            <td style="width: 326px">
                <asp:Button ID="btnadReset" runat="server" Text="Reset" Width="93px" class="btn btn-primary"/>
            </td>
            <td style="width: 259px">
                <asp:Button ID="btnadSearch" runat="server" Text="Search" Width="108px" class="btn btn-primary"/>
            </td>
            <td style="width: 503px">&nbsp;</td>
        </tr>
    </table>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        &nbsp;<asp:TextBox ID="txtadDate" runat="server" Width="107px">Date</asp:TextBox>
    </p>
    <table style="width: 81%">
        <tr>
            <td style="height: 31px">Name</td>
            <td style="height: 31px">Number</td>
            <td style="width: 12px; height: 31px;"></td>
            <td style="height: 31px">Description</td>
            <td style="height: 31px">Date</td>
            <td style="height: 31px">Warranty</td>
            <td style="height: 31px">Qty</td>
            <td style="height: 31px">Order-Price</td>
            <td style="height: 31px">Amount</td>
            <td style="height: 31px">Gross Profit</td>
        </tr>
        <tr>
            <td>2 stroke oil</td>
            <td>20180001</td>
            <td style="width: 12px">&nbsp;</td>
            <td>Blue-Oil </td>
            <td>11/12/2018</td>
            <td>Yes</td>
            <td>1</td>
            <td>2.00</td>
            <td>0</td>
            <td>-2.00</td>
        </tr>
        <tr>
            <td style="height: 32px">Fuel Stabilizer</td>
            <td style="height: 32px">20180002</td>
            <td style="height: 32px; width: 12px;">&nbsp;</td>
            <td style="height: 32px">Red-Oil</td>
            <td style="height: 32px">11/14/2018</td>
            <td style="height: 32px">No</td>
            <td style="height: 32px">1</td>
            <td style="height: 32px">3.00</td>
            <td style="height: 32px">11.00</td>
            <td style="height: 32px">1</td>
        </tr>
        <tr>
            <td style="height: 31px">40:1 Mixed Gas</td>
            <td style="height: 31px">20180010</td>
            <td style="height: 31px; width: 12px;"></td>
            <td style="height: 31px">Yellow-Oil</td>
            <td style="height: 31px">11/16/2018</td>
            <td style="height: 31px">No</td>
            <td style="height: 31px">1</td>
            <td style="height: 31px">4.00</td>
            <td style="height: 31px">12.00</td>
            <td style="height: 31px">1.56</td>
        </tr>
        <tr>
            <td>Blade</td>
            <td>20170011</td>
            <td style="width: 12px">&nbsp;</td>
            <td>Black-Oil</td>
            <td>11/16/2018</td>
            <td>No</td>
            <td>1</td>
            <td>5.00</td>
            <td>11.00</td>
            <td>1.43</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Grand Total</td>
            <td style="width: 12px">&nbsp;</td>
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
