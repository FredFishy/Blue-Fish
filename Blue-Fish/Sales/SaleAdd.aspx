<%@ Page Title="Add Sale" Language="C#" AutoEventWireup="true" CodeBehind="SaleAdd.aspx.cs" Inherits="Blue_Fish.SaleAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<h1>Create Sale</h1>

<div class="form-group col-8">
    <h2>Choose Customer</h2>
    <asp:TextBox runat="server" ID="txtCustomerSearch" placeholder="1234567890">1</asp:TextBox>
    <asp:Button ID="btnCustSearch" runat="server" Text="Search" OnClick="btnCustSearch_Click" />
    <br />
    <asp:ListBox ID="lbCustomer" runat="server" DataSourceID="dsCustomer" DataTextField="fullPhone" DataValueField="id"></asp:ListBox>
    <div class="form-group col-4">
        <asp:Button runat="server" Text="Add Customer" PostBackUrl="/Management/Customer/CustAdd.aspx"/>
    </div>
</div>
<hr />
<div class="form-group col-8">
    <label for="ddlInventory">Inventory</label>&nbsp;
    <br />
    <asp:ListBox ID="lbInventory" runat="server" DataSourceID="dsItems" DataTextField="prodDescription" DataValueField="id"></asp:ListBox>
</div>
    <div class="form-group col-4">
        Note:
        <asp:TextBox ID="txtItemNote" runat="server"></asp:TextBox>
        <br />
        Paid:
        <asp:RadioButtonList ID="rblItemPaid" runat="server">
            <asp:ListItem Value="yes">Yes</asp:ListItem>
            <asp:ListItem Value="no">No</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label runat="server">Qty: </asp:Label><asp:TextBox runat="server" ID="txtQuantityItem"></asp:TextBox>
        <asp:Button runat="server" ID="btnItemAdd" Text="Add Item" OnClick="btnItemAdd_Click" CausesValidation="False" UseSubmitBehavior="False" ValidateRequestMode="Disabled" />
    </div>
<div class="form-group col-8">
    <label for="txtFirstName">Services</label>&nbsp;
    <br />
    <asp:ListBox ID="lbService" runat="server" DataSourceID="dsServices" DataTextField="serDescription" DataValueField="id"></asp:ListBox>
    <br />
    Issue:
    <asp:TextBox ID="txtServIssue" runat="server"></asp:TextBox>
    <br />
    Under Warranty:<asp:RadioButtonList ID="rblWarranty" runat="server">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    Equipment:
    <asp:DropDownList ID="ddlEquipment" runat="server" DataSourceID="dsEquipment" DataTextField="equDetails" DataValueField="id">
    </asp:DropDownList>
</div>
    <asp:Label runat="server">Qty: </asp:Label>
    <div class="form-group col-4">
        <asp:TextBox runat="server" ID="txtQuantityService"></asp:TextBox>    
        <!-- TO DISABLE POSTBACK OnClientClick="return false;" -->
        <asp:Button runat="server" ID="btnServiceAdd" Text="Add Service" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnServiceAdd_Click" ValidateRequestMode="Disabled"  />
        <asp:Panel ID="pItem" runat="server" Visible="False">
            Items:<br />
            <asp:Table ID="itemTable" runat="server" CssClass="table">
                <asp:TableHeaderRow>
                    <asp:TableCell>Item</asp:TableCell>
                    <asp:TableCell>Quantity</asp:TableCell>
                    <asp:TableCell>Price</asp:TableCell>
                    <asp:TableCell>Total</asp:TableCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </asp:Panel>
        <br />
        <asp:Panel ID="pService" runat="server">
            Services:<asp:Table ID="serviceTable" runat="server" CssClass="table">
                <asp:TableHeaderRow>
                    <asp:TableCell>Item</asp:TableCell>
                    <asp:TableCell>Issue</asp:TableCell>
                    <asp:TableCell>Warranty</asp:TableCell>
                    <asp:TableCell>Price</asp:TableCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </asp:Panel>
    </div>
<hr />
<div class="form-group col-8">
    <label for="txtFirstName">Payment Type</label>&nbsp;
    <asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsPayment" DataTextField="payType" DataValueField="id" ID="ddlPayment">
        <asp:ListItem Value="0">Choose Payment</asp:ListItem>
    </asp:DropDownList>
</div>
<div class="form-group col-8">
    <label for="txtFirstName">Employee Name</label>&nbsp;
    <asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsEmployee" DataTextField="empFull" DataValueField="id" ID="ddlEmployee">
        <asp:ListItem Value="0">Choose Employee</asp:ListItem>
    </asp:DropDownList>
</div>

<asp:Button runat="server" Text="Submit" ID="submit" CssClass="btn btn-primary" OnClick="submit_Click" />

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

    <asp:ObjectDataSource ID="dsCustomer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ProcessSaleDatasetTableAdapters.customerTableAdapter" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCustomerSearch" Name="Param1" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="dsItems" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ProcessSaleDatasetTableAdapters.getItemsTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsServices" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ProcessSaleDatasetTableAdapters.getServicesTableAdapter"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="dsEquipment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.ProcessSaleDatasetTableAdapters.equipmentTableAdapter" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>

</asp:Content>
