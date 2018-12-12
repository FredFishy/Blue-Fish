/*

    Created by:         Paul Vandyk
    Date:               2018-12-09
    Last modified by:   Paul Vandyk
    Date:               2018-12-09
    Description:        Sale Page

*/
using EmmaLibrary;
using EmmaLibrary.CustomerDatasetTableAdapters;
using EmmaLibrary.ProcessSaleDatasetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class SaleAdd : System.Web.UI.Page
    {
        Receipt receipt = new Receipt();
        ProcessSaleDataset dsSale = new ProcessSaleDataset();
        getInvPriceTableAdapter daInvPrice = new getInvPriceTableAdapter();
        getServPriceTableAdapter daServPrice = new getServPriceTableAdapter();
        customerTableAdapter daCustomer = new customerTableAdapter();
        //order_lineTableAdapter daOrderLine = new order_lineTableAdapter();
        //service_orderTableAdapter daServiceOrder = new service_orderTableAdapter();
        //receiptTableAdapter daReceipt = new receiptTableAdapter();
        //equipmentTableAdapter daEquipment = new equipmentTableAdapter();

        // create a variable for receiptID so we can use it for the lineOrder creates
        private int receiptID;
        public int recID
        {
            get { return receiptID; }
            set { receiptID = value; }
        }
        // list to add objects to because website's postback doesn't keep the rows
        static List<RadioButton> allRadioButtons = new List<RadioButton>();
        static List<Order_Line> olList = new List<Order_Line>();
        static List<Service_Order> servList = new List<Service_Order>();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!String.IsNullOrEmpty(Request.QueryString["custID"]))
            {
                lbCustomer.SelectedValue = Request.QueryString["custId"];
            }

            // set label font colout to red for errors
            lblError.ForeColor = System.Drawing.Color.Red;
            // set textbox to something to avoid error


            //if (IsPostBack) return;
            //{
            //    customerTableAdapter daCust = new customerTableAdapter();
            //    try
            //    {
            //        daCust.Fill(dsSale.customer);
            //    }
            //    catch { }


            //}
        }

        protected void btnItemAdd_Click(object sender, EventArgs e)
        {
            // for the first item, make the item panel visibl
            if (pItem.Visible == false)
            {
                pItem.Visible = true;
            }

            daInvPrice.ClearBeforeFill = true;
            daInvPrice.Fill(dsSale.getInvPrice, int.Parse(lbInventory.SelectedValue));

            Order_Line line = new Order_Line();
            line.orlQuantity = int.Parse(txtQuantityItem.Text);
            line.orlPrice = daInvPrice.GetData(1)[0].invPrice;
            line.inventoryID = int.Parse(lbInventory.SelectedValue);
            line.orlNote = txtItemNote.Text;
            if (rblItemPaid.SelectedValue == "yes")
            {
                line.orlOrderReq = false;
            }
            else
            {
                line.orlOrderReq = true;
            }

            //add this line item to the list of line items
            olList.Add(line);

            foreach (Order_Line orderLine in olList)
            {
                MakeItemRow(orderLine, itemTable);
            }
            foreach (Service_Order servOrd in servList)
            {
                MakeServiceRow(servOrd, serviceTable);
            }
        }

        protected void btnServiceAdd_Click(object sender, EventArgs e)
        {

            // for the first item, make the service panel visible
            if (pService.Visible == false)
            {
                pService.Visible = true;
            }

            daServPrice.ClearBeforeFill = true;
            daServPrice.Fill(dsSale.getServPrice, int.Parse(lbService.SelectedValue));

            Service_Order service = new Service_Order();
            service.serordDateIn = DateTime.Today.Date;
            service.serordIssue = txtServIssue.Text;
            if (rblWarranty.SelectedValue == "yes")
            {
                service.serordWarranty = false;
            }
            else
            {
                service.serordWarranty = true;
            }

            service.serviceID = int.Parse(lbService.SelectedValue);
            service.equipID = int.Parse(ddlEquipment.SelectedValue);

            // set empID in order to create record. 
            //I believe this is the empID of who is working on the repair? 
            //Not the one who made the sale. 
            //I set it to 1 just for now, not knowing why this is required at this point. 
            service.empID = 1;

            servList.Add(service);

            foreach (Service_Order servOrd in servList)
            {
                MakeServiceRow(servOrd, serviceTable);
            }
            foreach (Order_Line orderLine in olList)
            {
                MakeItemRow(orderLine, itemTable);
            }
        }



        protected void submit_Click(object sender, EventArgs e)
        {
            // create the receipt record
            // set the receipt fields to their controls on the page
            receipt.paymentID = int.Parse(ddlPayment.SelectedValue);
            receipt.custID = int.Parse(lbCustomer.SelectedValue);
            receipt.empID = int.Parse(ddlEmployee.SelectedValue);
            receipt.ordPaid = bool.Parse(rblItemPaid.SelectedValue);
            receipt.ordDate = DateTime.Today.Date;
            if (Receipt.CreateReceipt(receipt, out string status, out int receipt_id))
            {
                recID = receipt_id;
            }
            else
            {
                error.Visible = true;
                lblError.Text = "There was an error creating the receipt. " + status;
            }

            // create the order lines in the DB
            foreach (Order_Line l in olList)
            {
                l.receiptID = recID;
                if (Order_Line.CreateOrder_Line(l, out string ex, out int orderLine_id))
                {
                }
                else
                {
                    error.Visible = true;
                    lblError.Text = "Error creating Order Line" + ex;
                }
            }

            // create the service orders in the DB
            foreach (Service_Order s in servList)
            {
                s.receiptID = recID;
                if (Service_Order.CreateService_Order(s, out string ex, out int servord_id))
                {

                }
                else
                {
                    error.Visible = true;
                    lblError.Text = "Error creating Service Order" + ex;
                }
            }

            KENDELL.Visible = true;
        }

        private void MakeItemRow(Order_Line r, Table table)
        {
            TableRow row = new TableRow();

            TableCell item = new TableCell();
            TableCell quantity = new TableCell();
            TableCell price = new TableCell();
            TableCell total = new TableCell();

            //assigning text values for table cells
            item.Text = lbInventory.SelectedItem.ToString();
            quantity.Text = r.orlQuantity.ToString();
            price.Text = String.Format("{0:C2}", r.orlPrice);
            total.Text = String.Format("{0:C2}", Math.Round((r.orlPrice * r.orlQuantity), 2));

            //Commit Cells to row
            row.Cells.Add(item);
            row.Cells.Add(quantity);
            row.Cells.Add(price);
            row.Cells.Add(total);

            //Commit row to table
            table.Rows.Add(row);
        }

        private void MakeServiceRow(Service_Order r, Table table)
        {
            TableRow row = new TableRow();

            TableCell item = new TableCell();
            TableCell issue = new TableCell();
            TableCell warranty = new TableCell();
            TableCell price = new TableCell();

            daServPrice.ClearBeforeFill = true;
            daServPrice.Fill(dsSale.getServPrice, int.Parse(lbService.SelectedValue));

            //assigning text values for table cells
            item.Text = lbService.SelectedItem.ToString();
            issue.Text = txtServIssue.Text;
            warranty.Text = r.serordWarranty.ToString();
            price.Text = daServPrice.GetData(r.serviceID)[0].serPrice.ToString("c");

            //Commit Cells to row
            row.Cells.Add(item);
            row.Cells.Add(issue);
            row.Cells.Add(warranty);
            row.Cells.Add(price);

            //Commit row to table
            table.Rows.Add(row);
        }

    }
}