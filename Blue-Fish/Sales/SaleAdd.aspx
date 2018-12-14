﻿<%@ Page Title="Add Sale" Language="C#" AutoEventWireup="true" CodeBehind="SaleAdd.aspx.cs" Inherits="Blue_Fish.SaleAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblError" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h2>Create Sale</h2>
    <h3>
        <asp:Label runat="server" ID="KENDELL" Visible="false">Sale Completed Successfully!</asp:Label></h3>
    <div class="col-4 p-0">
        <div class="form-group">
            <label>
                Choose Customer<asp:RequiredFieldValidator ID="validCustomer" runat="server" ControlToValidate="lbCustomer" ErrorMessage="Customer is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </label>
            &nbsp;<div class="form-group mb-0">
                <asp:ListBox ID="lbCustomer" runat="server" DataSourceID="dsCustomer" DataTextField="fullPhone" DataValueField="id" CssClass="form-control"></asp:ListBox>
            </div>
            <div class="input-group" style="width: 74%">
                <asp:TextBox runat="server" ID="txtCustomerSearch" CssClass="form-control"></asp:TextBox>
                <div class="input-group-append">
                    <asp:Button ID="btnCustSearch" runat="server" Text="Search" CssClass="btn btn-outline-secondar" />
                </div>
            </div>
        </div>
        <asp:Button runat="server" Text="Add Customer" PostBackUrl="/Management/Customer/CustAdd.aspx" CssClass="btn btn-primary form-control" />
    </div>
    <hr />
    <div class="row mt-3">
        <div class="col-4">
            <h2>Orders</h2>
            <div class="form-group">
                <label for="ddlInventory">Select an Item</label>&nbsp;<asp:RequiredFieldValidator ID="validItemSelect" runat="server" ControlToValidate="lbInventory" ErrorMessage="Item selection is required" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;<asp:ListBox ID="lbInventory" runat="server" DataSourceID="dsItems" DataTextField="prodDescription" DataValueField="id" CssClass="form-control"></asp:ListBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server">Note</asp:Label>
                <asp:TextBox ID="txtItemNote" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server">Qty</asp:Label>
                <asp:RequiredFieldValidator ID="validItemQuant" runat="server" ControlToValidate="txtQuantityItem" ErrorMessage="Quantity is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txtQuantityItem" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="btnItemAdd" Text="Add Item" OnClick="btnItemAdd_Click" CausesValidation="False" UseSubmitBehavior="False" ValidateRequestMode="Disabled" CssClass="btn btn-primary form-control" />
        </div>
        <div class="col-8">
            <asp:Panel ID="pItem" runat="server" Visible="False">
                <asp:Table ID="itemTable" runat="server" CssClass="table table-striped">
                    <asp:TableRow CssClass="thead-dark">
                        <asp:TableHeaderCell>Item</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Quantity</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Price</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Total</asp:TableHeaderCell>
                    </asp:TableRow>
                </asp:Table>
                <div class="float-right">
                    <asp:TextBox ID="txtOrderDateLow" runat="server" CssClass="form-control" Text="Item Total: " ReadOnly="true"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Label for="<%= txtOrderDateLow.ClientID %>" class="input-group-text" ID="itemTotal" runat="server">
                                <svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </svg>
                        </asp:Label>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <hr />
    <div class="row mt-4">
        <div class="col-4">
            <h2>Services</h2>
            <div class="form-group">
                <label for="txtFirstName">
                    Please select a Service<asp:RequiredFieldValidator ID="validServiceSelect" runat="server" ControlToValidate="ddlServices" ErrorMessage="Service is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<br />
                <asp:DropDownList ID="ddlServices" runat="server" DataSourceID="dsServices" DataTextField="serDescription" DataValueField="id">
                </asp:DropDownList>

            </div>
            <div class="form-group">
                <label for="txtServIssue">Issue</label>
                <asp:TextBox ID="txtServIssue" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="rblWarranty">
                    Under Warranty<asp:RequiredFieldValidator ID="validWarentyCheck" runat="server" ControlToValidate="rblWarranty" ErrorMessage="Warranty is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:RadioButtonList ID="rblWarranty" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="form-group">
                <label for="ddlEquipment">
                    Equipment<asp:RequiredFieldValidator ID="validEquipment" runat="server" ControlToValidate="ddlEquipment" ErrorMessage="Equipment is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:DropDownList ID="ddlEquipment" runat="server" DataSourceID="dsEquipment" DataTextField="equDetails" DataValueField="id" CssClass="form-control"></asp:DropDownList>
            </div>
            <asp:Button runat="server" ID="btnServiceAdd" Text="Add Service" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnServiceAdd_Click" ValidateRequestMode="Disabled" CssClass="btn btn-primary form-control" />
        </div>
        <div class="col-8">
            <!-- TO DISABLE POSTBACK OnClientClick="return false;" -->
            <asp:Panel ID="pService" runat="server" Visible="false">
                <asp:Table ID="serviceTable" runat="server" CssClass="table table-striped">
                    <asp:TableRow CssClass="thead-dark">
                        <asp:TableHeaderCell>Item</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Issue</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Warranty</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Price</asp:TableHeaderCell>
                    </asp:TableRow>
                </asp:Table>
                <div class="float-right">
                    <asp:TextBox ID="txtServTotalLabel" runat="server" CssClass="form-control" Text="Sale Total: " ReadOnly="true"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Label for="<%= txtServTotalLabel.ClientID %>" class="input-group-text" ID="serviceTotal" runat="server">
                                <svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </svg>
                        </asp:Label>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <hr />
    <div class="form-group col-8">
        <label for="txtFirstName">Payment Type</label>&nbsp;<asp:RequiredFieldValidator ID="validPayment" runat="server" ControlToValidate="ddlPayment" ErrorMessage="Payment Type is required" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;<asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsPayment" DataTextField="payType" DataValueField="id" ID="ddlPayment">
            <asp:ListItem Value="0">Choose Payment</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group col-8">
        <label for="txtFirstName">Employee Name</label>&nbsp;<asp:RequiredFieldValidator ID="validEmployee" runat="server" ControlToValidate="ddlEmployee" ErrorMessage="Employee is required" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;<asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsEmployee" DataTextField="empFull" DataValueField="id" ID="ddlEmployee">
            <asp:ListItem Value="0">Choose Employee</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group">
        <asp:Label runat="server">Paid</asp:Label>
        <asp:RadioButtonList ID="rblItemPaid" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="true">Yes</asp:ListItem>
            <asp:ListItem Value="false">No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="validPaid" runat="server" ControlToValidate="rblItemPaid" ErrorMessage="Paid is required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <asp:TextBox ID="txtGrandTotal" runat="server" CssClass="form-control" Text="Grand Total: " ReadOnly="true"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Label for="<%= txtGrandTotal.ClientID %>" class="input-group-text" ID="grandTotal" runat="server">
                                <svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </svg>
                        </asp:Label>
                    </div>
    <asp:Button runat="server" Text="Submit" ID="submit" CssClass="btn btn-primary" OnClick="submit_Click" />


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
            <asp:ControlParameter ControlID="txtCustomerSearch" Name="Param1" PropertyName="Text" Type="String" DefaultValue="P" />
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
