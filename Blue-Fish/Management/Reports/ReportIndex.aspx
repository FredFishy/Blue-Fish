<%@ Page Title="Create Weekly Report" Language="C#" AutoEventWireup="true" CodeBehind="ReportIndex.aspx.cs" Inherits="Blue_Fish.ReportWeeklyCreate" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Sales Report</h2>
    <p>&nbsp;</p>
    <table style="width: 847px">
        <tr>
            <td style="width: 182px">
        <asp:TextBox ID="txtDepart" runat="server" Width="107px">Department: </asp:TextBox>
            </td>
            <td style="width: 326px">
                <asp:DropDownList ID="ddlDepart" runat="server" Width="154px">
                </asp:DropDownList>
            </td>
            <td style="width: 576px">&nbsp;</td>
            <td style="width: 503px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 36px; width: 182px">
        <asp:TextBox ID="txtMonth" runat="server" Width="107px">Month: </asp:TextBox>
            </td>
            <td style="height: 36px; width: 326px">
                <asp:DropDownList ID="ddlMonth" runat="server" Width="153px">
                </asp:DropDownList>
            </td>
            <td style="width: 576px; height: 36px"></td>
            <td style="width: 503px; height: 36px"></td>
        </tr>
        <tr>
            <td style="width: 182px">
        <asp:TextBox ID="txtWeek" runat="server" Width="107px">Week:</asp:TextBox>
            </td>
            <td style="width: 326px">
                <asp:DropDownList ID="ddlWeek" runat="server" Width="151px">
                </asp:DropDownList>
            </td>
            <td style="width: 576px">&nbsp;</td>
            <td style="width: 503px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 182px; height: 31px"></td>
            <td style="width: 326px; height: 31px"></td>
            <td style="width: 576px; height: 31px">&nbsp;</td>
            <td style="width: 503px; height: 31px"></td>
        </tr>
        <tr>
            <td style="width: 182px">
                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="93px" class="btn btn-primary"/>
            </td>
            <td style="width: 326px">
                <asp:Button ID="btnSearch" runat="server" Text="Search" Width="108px" class="btn btn-primary"/>
            </td>
            <td style="width: 576px">&nbsp;</td>
            <td style="width: 503px">&nbsp;</td>
        </tr>
    </table>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="txtDate" runat="server" Width="107px">Date</asp:TextBox>
    </p>
    <table style="width: 70%">
        <tr>
            <td>Name</td>
            <td>Number</td>
            <td>&nbsp;</td>
            <td>Description</td>
            <td>Size</td>
            <td>Date</td>
            <td>Warranty</td>
            <td>Qty</td>
            <td>Amount</td>
            <td>Tax</td>
            <td>Total</td>
        </tr>
        <tr>
            <td>2 stroke oil</td>
            <td>20180001</td>
            <td>&nbsp;</td>
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
            <td style="height: 32px">Fuel Stabilizer</td>
            <td style="height: 32px">20180002</td>
            <td style="height: 32px">&nbsp;</td>
            <td style="height: 32px">Red-Oil</td>
            <td style="height: 32px">Medium</td>
            <td style="height: 32px">11/14/2018</td>
            <td style="height: 32px">No</td>
            <td style="height: 32px">1</td>
            <td style="height: 32px">11.00</td>
            <td style="height: 32px">1.43</td>
            <td style="height: 32px">12.43</td>
        </tr>
        <tr>
            <td style="height: 31px">40:1 Mixed Gas</td>
            <td style="height: 31px">20180010</td>
            <td style="height: 31px"></td>
            <td style="height: 31px">Yellow-Oil</td>
            <td style="height: 31px">Large</td>
            <td style="height: 31px">11/16/2018</td>
            <td style="height: 31px">No</td>
            <td style="height: 31px">1</td>
            <td style="height: 31px">12.00</td>
            <td style="height: 31px">1.56</td>
            <td style="height: 31px">13.56</td>
        </tr>
        <tr>
            <td>Blade</td>
            <td>20170011</td>
            <td>&nbsp;</td>
            <td>Black-Oil</td>
            <td>&nbsp;</td>
            <td>11/16/2018</td>
            <td>No</td>
            <td>1</td>
            <td>11.00</td>
            <td>1.43</td>
            <td>12.43</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Grand Total</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>55.00</td>
            <td>5.72</td>
            <td>60.72</td>
        </tr>
    </table>
    <p>&nbsp;</p>
    <p>Content.</p>
</asp:Content>
