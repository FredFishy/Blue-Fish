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
        order_lineTableAdapter daOrderLine = new order_lineTableAdapter();
        service_orderTableAdapter daServiceOrder = new service_orderTableAdapter();
        receiptTableAdapter daReceipt = new receiptTableAdapter();
        equipmentTableAdapter daEquipment = new equipmentTableAdapter();

        // create a variable for receiptID so we can use it for the lineOrder creates
        private int receiptID;
        public int recID
        {
            get { return receiptID; }
            set { receiptID = value; }
        }
        // list to add rows to because website's postback doesn't keep the rows
        static List<TableRow> allRows = new List<TableRow>();
        static List<RadioButton> allRadioButtons = new List<RadioButton>();

        protected void Page_Load(object sender, EventArgs e)
        {
            receipt.paymentID = 1;
            receipt.custID = 1;
            receipt.empID = 1;
            if (Receipt.CreateReceipt(receipt, out string status, out int id))
            {
                lblTest.Text = "First receipt successfully created";
                recID = id;
            }
            else
            {
                lblTest.Text = "There was an error creating the receipt. " + status;
                lblTest.ForeColor = System.Drawing.Color.Red;
            }
            // Hide the receiptTable until there is info to put in it
            receiptTable.Visible = false;
        }

        protected void btnItemAdd_Click(object sender, EventArgs e)
        {
            

            // for the first item, make the receipt table visible
            if (receiptTable.Visible == false)
            {
                receiptTable.Visible = true;
            }

            daInvPrice.ClearBeforeFill = true;
            daInvPrice.Fill(dsSale.getInvPrice, int.Parse(ddlInventory.SelectedValue));
            

            // Take the data in the textbox and qty and add a row to the table
            TableRow row = new TableRow();
            
            TableCell a = new TableCell();
            a.Width = 1000;
            a.Text = ddlInventory.SelectedItem.ToString();
            row.Cells.Add(a);
            TableCell b = new TableCell();
            b.Text = txtQuantityItem.Text;
            row.Cells.Add(b);
            TableCell c = new TableCell();
            decimal price = daInvPrice.GetData(1)[0].invPrice;
            c.Text = price.ToString("c");
            row.Cells.Add(c);
            TableCell d = new TableCell();
            int quant = int.Parse(txtQuantityItem.Text);
            d.Text = (quant * price).ToString("c");
            // create delete button at end of row
            TableCell f = new TableCell();
            RadioButton button = new RadioButton();
            button.ID = allRows.ToArray().Length.ToString();
            allRadioButtons.Add(button);
            f.Controls.Add(button);

            row.Cells.Add(a);
            row.Cells.Add(b);
            row.Cells.Add(c);
            row.Cells.Add(d);
            row.Cells.Add(f);

            //Add row to row list, populate table with all rows
            allRows.Add(row);
            receiptTable.Rows.AddRange(allRows.ToArray());

            Order_Line line = new Order_Line();
            line.orlQuantity = int.Parse(txtQuantityItem.Text);
            line.orlPrice = daInvPrice.GetData(1)[0].invPrice;
            line.inventoryID = int.Parse(ddlInventory.SelectedValue);
            line.orlNote = txtItemNote.Text;
            if (rblItemPaid.SelectedValue == "yes")
            {
                line.orlOrderReq = false;
            } else
            {
                line.orlOrderReq = true;
            }
            // set id to created receipt item id
            line.receiptID = receiptID;

            string status;
            int id;

            if (Order_Line.CreateOrder_Line(line, out status, out id))
            {
                lblTest.Text = "Order Line successfully created";
            }
            else
            {
                lblTest.Text = "There was an error creating the Order Line " + status;
                lblTest.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void btnServiceAdd_Click(object sender, EventArgs e)
        {

            // for the first item, make the receipt table visible
            if (receiptTable.Visible == false)
            {
                receiptTable.Visible = true;
            }

            daServPrice.ClearBeforeFill = true;
            daServPrice.Fill(dsSale.getServPrice, int.Parse(ddlService.SelectedValue));

            // Take the data in the textbox and qty and add a row to the table
            TableRow row = new TableRow();
            TableCell a = new TableCell();
            a.Width = 1000;
            a.Text = ddlService.SelectedItem.ToString();
            row.Cells.Add(a);
            TableCell b = new TableCell();
            b.Text = txtQuantityService.Text;
            row.Cells.Add(b);
            TableCell c = new TableCell();
            decimal price = daServPrice.GetData(1)[0].serPrice;
            c.Text = price.ToString("c");
            row.Cells.Add(c);
            TableCell d = new TableCell();
            int quant = int.Parse(txtQuantityService.Text);
            d.Text = (quant * price).ToString("c");
            TableCell f = new TableCell();
            RadioButton button = new RadioButton();
            button.Checked = true;
            button.ID = allRows.ToArray().Length.ToString();
            allRadioButtons.Add(button);
            f.Controls.Add(button);

            row.Cells.Add(a);
            row.Cells.Add(b);
            row.Cells.Add(c);
            row.Cells.Add(d);
            row.Cells.Add(f);

            //Add row to row list, populate table with all rows
            allRows.Add(row);
            receiptTable.Rows.AddRange(allRows.ToArray());

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
            
            service.serviceID = int.Parse(ddlService.SelectedValue);
            service.equipID = int.Parse(ddlEquipment.SelectedValue);
            // set id to created receipt item id
            service.receiptID = receiptID;
            // set empID in order to create record. 
            //I believe this is the empID of who is working on the repair? 
            //Not the one who made the sale. 
            //I set it to 1 just for now, not knowing why this is required at this point. 
            service.empID = 1;
            
            if (Service_Order.CreateService_Order(service, out string status, out int id))
            {
                lblTest.Text = "Service Order successfully created";
            }
            else
            {
                lblTest.Text = "There was an error creating the Service Order " + status;
                lblTest.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            foreach (RadioButton r in allRadioButtons)
            {
                if (r.Checked)
                {
                    allRows.RemoveAt(int.Parse(r.ID) - 1);
                    lblTest.Text = "Checked";
                }
            }

            // keep showing the table
            receiptTable.Visible = true;
            // populate table with remaining items
            receiptTable.Rows.AddRange(allRows.ToArray());
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (Receipt.UpdateReceipt(receipt, out string status))
            {
                lblTest.Text = "Receipt updated successfully";
            }
            else
            {
                lblTest.Text = "There was an error creating the receipt. " + status;
                lblTest.ForeColor = System.Drawing.Color.Red;
            }
                
        }
    }
}