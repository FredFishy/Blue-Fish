﻿<%@ Page Title="Add Sale" Language="C#" AutoEventWireup="true" CodeBehind="SaleAdd.aspx.cs" Inherits="Blue_Fish.SaleAdd" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="error" CssClass="bg-danger p-3 my-3 rounded" runat="server" Visible="false">
        <h4 class="text-light">Error!</h4>
        <asp:Label runat="server" ID="lblError" CssClass="text-light"></asp:Label>
    </asp:Panel>
    <h2>Create Sale</h2>
    <h3>
        <asp:Label runat="server" ID="KENDELL" Visible="false">Sale Completed Successfully!</asp:Label></h3>
    <div class="row">
        <div class="col-6">
            <div class="form-group">
                <label>
                    Choose Customer
                </label><asp:RequiredFieldValidator runat="server" ControlToValidate="lbCustomer" ErrorMessage=" &lt;b&gt;*&lt;/b&gt; &lt;small&gt;Please select a customer&lt;/small&gt;" ForeColor="Red" Display="Dynamic" ValidationGroup="customer" InitialValue=""></asp:RequiredFieldValidator><asp:RequiredFieldValidator runat="server" ControlToValidate="txtId" ErrorMessage=" &lt;b&gt;*&lt;/b&gt; &lt;small&gt;Please select a customer&lt;/small&gt;" ForeColor="Red" Display="Dynamic" ValidationGroup="sale"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtId" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
                <div class="form-group mb-0">
                    <asp:ListBox ID="lbCustomer" runat="server" DataSourceID="dsCustomer" DataTextField="fullPhone" DataValueField="id" CssClass="form-control" Height="150px"></asp:ListBox>
                </div>
                <div class="input-group" style="width: 74%">
                    <asp:TextBox runat="server" ID="txtCustomerSearch" CssClass="form-control"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button ID="btnCustSearch" runat="server" Text="Search" CssClass="btn btn-outline-secondar" />
                    </div>
                </div>
            </div>
            <asp:Button runat="server" Text="Select Customer" CssClass="btn btn-primary form-control" OnClick="Unnamed1_Click" UseSubmitBehavior="False" ValidationGroup="customer" />
        </div>
        <div class="col-6">
            <h4>Customer Details</h4>
            <table class="mt-3">
                <tbody>
                    <tr>
                        <th class="pr-5">First Name</th>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>Last Name</th>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>Phone Number</th>
                        <td>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>City</th>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>Postal Code</th>
                        <td>
                            <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>Email Address</th>
                        <td>
                            <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control-plaintext" ReadOnly="true">N/A</asp:TextBox></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <hr />
    <div class="row mt-3">
        <div class="col-4">
            <h2>Orders</h2>
            <div class="form-group">
                <label for="lbInventory">Select an Item</label><asp:RequiredFieldValidator runat="server" ControlToValidate="lbInventory" ErrorMessage=" &lt;b&gt;*&lt;/b&gt; &lt;small&gt;Please select an item&lt;/small&gt;" ForeColor="Red" Display="Dynamic" InitialValue="" ValidationGroup="order"></asp:RequiredFieldValidator>
                <asp:ListBox ID="lbInventory" runat="server" DataSourceID="dsItems" DataTextField="prodDescription" DataValueField="id" CssClass="form-control" Height="150px"></asp:ListBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server">Note</asp:Label>
                <asp:TextBox ID="txtItemNote" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server">Qty</asp:Label><asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuantityItem" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic" ValidationGroup="order"></asp:RequiredFieldValidator>
       
                <asp:TextBox runat="server" ID="txtQuantityItem" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="btnItemAdd" Text="Add Item" OnClick="btnItemAdd_Click" UseSubmitBehavior="False" ValidateRequestMode="Disabled" CssClass="btn btn-primary form-control" ValidationGroup="order" />
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
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Sale Total</span>
                        </div>
                        <asp:TextBox ID="itemTotal" runat="server" ReadOnly="true" Enabled="false" CssClass="form-control"></asp:TextBox>
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
                    Select a Service
                </label><asp:RequiredFieldValidator runat="server" ControlToValidate="ddlServices" ErrorMessage=" <b>*</b> <small>Please select a service</small>" ForeColor="Red" Display="Dynamic" InitialValue="" ValidationGroup="service"></asp:RequiredFieldValidator>
                <asp:ListBox ID="ddlServices" runat="server" DataSourceID="dsServices" DataTextField="serDescription" DataValueField="id" CssClass="form-control" Height="150px"></asp:ListBox>
            </div>
            <div class="form-group">
                <label for="txtServIssue">Issue</label>
                <asp:TextBox ID="txtServIssue" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="rblWarranty">Under Warranty</label><asp:RequiredFieldValidator runat="server" ControlToValidate="rblWarranty" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic" ValidationGroup="service"></asp:RequiredFieldValidator>
                <asp:RadioButtonList ID="rblWarranty" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="form-group">
                <label for="ddlEquipment">
                    Equipment
                </label><asp:RequiredFieldValidator runat="server" ControlToValidate="ddlEquipment" ErrorMessage=" &lt;b&gt;*&lt;/b&gt; &lt;small&gt;Please select equipment&lt;/small&gt;" ForeColor="Red" Display="Dynamic" InitialValue="0" ValidationGroup="service"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlEquipment" runat="server" DataSourceID="dsEquipment" DataTextField="equDetails" DataValueField="id" CssClass="form-control" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">Select Equipment</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button runat="server" ID="btnServiceAdd" Text="Add Service" UseSubmitBehavior="False" OnClick="btnServiceAdd_Click" ValidateRequestMode="Disabled" CssClass="btn btn-primary form-control" ValidationGroup="service" />
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
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Service Total</span>
                        </div>
                        <asp:TextBox ID="serviceTotal" runat="server" ReadOnly="true" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <hr />
    <h2>Sale Details</h2>
    <div class="form-group">
        <label for="txtFirstName">Payment Type</label><asp:RequiredFieldValidator runat="server" ControlToValidate="ddlPayment" ErrorMessage=" <b>*</b> <small>Please select payment type</small>" ForeColor="Red" Display="Dynamic" ValidationGroup="sale" InitialValue="0"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsPayment" DataTextField="payType" DataValueField="id" ID="ddlPayment">
            <asp:ListItem Value="0">Choose Payment</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group">
        <label for="txtFirstName">Employee Name</label><asp:RequiredFieldValidator runat="server" ControlToValidate="ddlEmployee" ErrorMessage=" <b>*</b> <small>Please select an Employee</small>" ForeColor="Red" Display="Dynamic" ValidationGroup="sale" InitialValue="0"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="dsEmployee" DataTextField="empFull" DataValueField="id" ID="ddlEmployee">
            <asp:ListItem Value="0">Choose Employee</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group">
        <asp:Label runat="server">Paid</asp:Label><asp:RequiredFieldValidator runat="server" ControlToValidate="rblItemPaid" ErrorMessage=" <b>*</b> <small>Required</small>" ForeColor="Red" Display="Dynamic" ValidationGroup="sale"></asp:RequiredFieldValidator>
        <asp:RadioButtonList ID="rblItemPaid" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="true">Yes</asp:ListItem>
            <asp:ListItem Value="false">No</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">Grand Total</span>
        </div>
        <asp:TextBox ID="grandTotal" runat="server" ReadOnly="true" Enabled="false" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="mt-3">
        <asp:Button runat="server" ID="submit" Text="Finalize Sale" UseSubmitBehavior="False" OnClick="submit_Click" ValidateRequestMode="Disabled" CssClass="btn btn-primary form-control" ValidationGroup="sale" />
    </div>

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
