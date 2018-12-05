<%@ Page Title="Create Weekly Report" Language="C#" AutoEventWireup="true" CodeBehind="ReportSales.aspx.cs" Inherits="Blue_Fish.ReportSales" MasterPageFile="~/Site.Master" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Sales Report</h2>
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label>Brand</label>
                    <asp:DropDownList ID="ddlBrand" runat="server" CssClass="form-control" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="dsBrand" DataTextField="prodBrand" DataValueField="id">
                        <asp:ListItem Value="0">Any Brand</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Paid?</label>
                    <asp:DropDownList ID="ddlPaid" runat="server" CssClass="form-control" DataSourceID="dsPaid" DataTextField="ordPaid" DataValueField="ordPaid">
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
                <div class="input-group">
                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <div class="input-group-append">
                            <label for="<%= txtEndDate.ClientID %>" class="input-group-text">
                                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                                    <path fill="#000000" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
                                </svg>
                            </label>
                        </div>
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

        <h3 class="mt-4">2018/11/26</h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsSearch">
                <Columns>
                    <asp:BoundField DataField="orlPrice" HeaderText="orlPrice" SortExpression="orlPrice" />
                    <asp:BoundField DataField="orlQuantity" HeaderText="orlQuantity" SortExpression="orlQuantity" />
                    <asp:BoundField DataField="ordDate" HeaderText="ordDate" SortExpression="ordDate" />
                    <asp:CheckBoxField DataField="ordPaid" HeaderText="ordPaid" SortExpression="ordPaid" />
                    <asp:BoundField DataField="prodName" HeaderText="prodName" SortExpression="prodName" />
                    <asp:BoundField DataField="orderTotal" HeaderText="orderTotal" ReadOnly="True" SortExpression="orderTotal" />
                    <asp:BoundField DataField="prodBrand" HeaderText="prodBrand" SortExpression="prodBrand" />
                </Columns>
            </asp:GridView>
        </p>
        <p>Content.<asp:ObjectDataSource ID="dsBrand" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.AdminSalesReportTableAdapters.productTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_prodBrand" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="prodBrand" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="prodBrand" Type="String" />
                <asp:Parameter Name="Original_prodBrand" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsPaid" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.AdminSalesReportTableAdapters.receiptTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ordPaid" Type="Boolean" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ordPaid" Type="Boolean" />
                    <asp:Parameter Name="Original_ordPaid" Type="Boolean" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsSearch" runat="server" OldValuesParameterFormatString="original_{0}" OnSelecting="dsSearch_Selecting" SelectMethod="GetData" TypeName="EmmaLibrary.AdminSalesReportTableAdapters.SalesTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtStartDate" Name="Param1" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtEndDate" Name="Param2" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddlPaid" Name="Param3" PropertyName="SelectedValue" Type="Boolean" />
                    <asp:ControlParameter ControlID="ddlBrand" Name="Param4" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </p>
    </asp:Content>