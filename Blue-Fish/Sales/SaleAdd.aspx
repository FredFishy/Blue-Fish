<%@ Page Title="Add Sale" Language="C#" AutoEventWireup="true" CodeBehind="SaleAdd.aspx.cs" Inherits="Blue_Fish.SaleAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<h1>Create Sale</h1>

<div class="form-group col-8">
    <label for="ddlCustomer">Customer</label>&nbsp;
    <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsCustomer" DataTextField="custFull" DataValueField="id">
        <asp:ListItem>Select Customer</asp:ListItem>
    </asp:DropDownList>
    <div class="form-group col-4">
        <asp:Button runat="server" Text="Add Customer" PostBackUrl="/Management/Customer/CustAdd.aspx"/>
    </div>
</div>
<hr />
<div class="form-group col-8">
    <label for="ddlInventory">Inventory</label>&nbsp;
    <asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsItems" DataTextField="prodDescription" DataValueField="id" ID="ddlInventory">
        <asp:ListItem Value="0">Select Item</asp:ListItem>
    </asp:DropDownList>
</div>
    <div class="form-group col-4">
        <asp:Label runat="server">Qty: </asp:Label><asp:TextBox runat="server" ID="txtQuantityItem"></asp:TextBox>
        <asp:Button runat="server" ID="btnItemAdd" Text="Add Item" OnClick="btnItemAdd_Click" CausesValidation="False" UseSubmitBehavior="False" ValidateRequestMode="Disabled" />
    </div>
<div class="form-group col-8">
    <label for="txtFirstName">Services</label>&nbsp;
    <asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsServices" DataTextField="serDescription" DataValueField="id" ID="ddlService">
        <asp:ListItem Value="0">Select Service</asp:ListItem>
    </asp:DropDownList>
</div>
    <asp:Label runat="server">Qty: </asp:Label>
    <div class="form-group col-4">
        <asp:TextBox runat="server" ID="txtQuantityService"></asp:TextBox>    
        <!-- TO DISABLE POSTBACK OnClientClick="return false;" -->
        <asp:Button runat="server" ID="btnServiceAdd" Text="Add Service" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnServiceAdd_Click" ValidateRequestMode="Disabled"  />
    </div>
<asp:Table runat="server" ID="receiptTable" CssClass="table">
    <asp:TableRow CssClass="thead-dark ">
        <asp:TableHeaderCell>Product</asp:TableHeaderCell>
        <asp:TableHeaderCell>Quantity</asp:TableHeaderCell>
        <asp:TableHeaderCell>Price</asp:TableHeaderCell>
        <asp:TableHeaderCell>Total</asp:TableHeaderCell>
        <asp:TableHeaderCell>Delete</asp:TableHeaderCell>
    </asp:TableRow>
</asp:Table>
    <asp:Button runat="server" Text="Delete Items" ID="Delete" OnClick="Delete_Click"/>
<hr />
<div class="form-group col-8">
    <label for="txtFirstName">Payment Type</label>&nbsp;
    <asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsPayment" DataTextField="payType" DataValueField="id">
        <asp:ListItem Value="0">Choose Payment</asp:ListItem>
    </asp:DropDownList>
</div>
<div class="form-group col-8">
    <label for="txtFirstName">Employee Name</label>&nbsp;
    <asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsEmployee" DataTextField="empFull" DataValueField="id">
        <asp:ListItem Value="0">Choose Employee</asp:ListItem>
    </asp:DropDownList>
</div>

<input type="submit" value="Submit" class="btn btn-primary"/>&nbsp;<asp:ObjectDataSource ID="dsCustomer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.CustomerDatasetTableAdapters.CustomerIndexTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_custPhone" Type="String" />
            <asp:Parameter Name="Original_custCity" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="custPhone" Type="String" />
            <asp:Parameter Name="custCity" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="custPhone" Type="String" />
            <asp:Parameter Name="custCity" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_custPhone" Type="String" />
            <asp:Parameter Name="Original_custCity" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
    <asp:ObjectDataSource ID="dsEmployee" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmployeeDatasetTableAdapters.EmployeeIndexTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsPayment" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.PaymentDataSetTableAdapters.paymentTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_payType" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="payType" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="payType" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_payType" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="dsItems" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ProcessSaleDatasetTableAdapters.getItemsTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsServices" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ProcessSaleDatasetTableAdapters.getServicesTableAdapter"></asp:ObjectDataSource>

</asp:Content>
