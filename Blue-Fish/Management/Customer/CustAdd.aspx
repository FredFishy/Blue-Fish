<%@ Page Title="Add Customer" Language="C#" AutoEventWireup="true" CodeBehind="CustAdd.aspx.cs" Inherits="Blue_Fish.CustAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Create Customer</h1>
    <div class="form-group">
        <label for="firstName">First Name</label>
        <input name="firstName" type ="text" class="form-control"/>
    </div>
    <div class="form-group">
        <label for="lastName">Last Name</label>
        <input name="lastName" type ="text" class="form-control"/>
    </div>
    <div class="form-group">
        <label for="phoneNumber">Phone Number</label>
        <input name="phoneNumber" type ="text" placeholder="1233567890" maxlength="10" class="form-control"/>
    </div>
    <div class="form-group">
        <label for="address">Address</label>
        <input name="address" type ="text" class="form-control"/>
    </div>
    <div class="form-group">
        <label for="city">City</label>
        <input name="city" type ="text" class="form-control"/>
    </div>
    <div class="form-group">
        <label for="postalCode">Postal Code</label>
        <input name="postalCode" type ="text" placeholder="A1A1A1" maxlength="6" class="form-control"/>
    </div>
    <div class="form-group">
        <label for="emailAddress">Email Address</label>
        <input name="emailAddress" type ="text" placeholder="email@email.org" class="form-control"/>
    </div>
    <input type="submit" value="Submit" class="btn btn-primary"/>
</asp:Content>