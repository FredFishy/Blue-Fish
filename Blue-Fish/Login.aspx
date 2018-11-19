<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Blue_Fish.Login" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Login:</h2>
    <p>&nbsp;</p>
    <p>
        
        <asp:Table ID="Table1" runat="server" Height="100px" Width="300px">
            <asp:TableRow>
                <asp:TableCell>Username:</asp:TableCell>
                <asp:TableCell><input id="username" type="text" /></asp:TableCell>
             </asp:TableRow>    
            <asp:TableRow>
                <asp:TableCell>Password:</asp:TableCell>
                <asp:TableCell><input id="password" type="text" /></asp:TableCell>
           </asp:TableRow>
            <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
            <asp:TableRow>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell><input type="submit" class="btn btn-primary float-right" value="Login"/></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
