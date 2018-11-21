<%@ Page Title="Reports" Language="C#" AutoEventWireup="true" CodeBehind="ReportIndex.aspx.cs" Inherits="Blue_Fish.ReportIndex" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Report</h2>
    <p>&nbsp;</p>
    <table style="width: 55%">
        <tr>
            <td style="width: 154px">Search</td>
            <td style="width: 156px">&nbsp;</td>
            <td style="width: 200px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 154px">Start Date:</td>
            <td style="width: 156px">&nbsp;</td>
            <td style="width: 200px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 154px">End&nbsp; Date:</td>
            <td style="width: 156px">&nbsp;</td>
            <td style="width: 200px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 154px">
                <asp:Button ID="btnOk" runat="server" Text="OK" Width="141px" />
            </td>
            <td style="width: 156px">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="141px" />
            </td>
            <td style="width: 200px">
                <asp:Button ID="btnHelp" runat="server" Text="Help" Width="141px" />
            </td>
        </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
        <asp:Button ID="btnDaily" runat="server" Text="Daily" Width="141px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnMonthly" runat="server" Text="Monthly" Width="141px" />
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </p>
</asp:Content>
