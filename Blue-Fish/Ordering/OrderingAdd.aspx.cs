/*

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Will Ashcroft
    Date:               2018-12-08
    Description:        Add Order

*/

using EmmaLibrary;
using EmmaLibrary.InventoryDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class OrderingAdd : System.Web.UI.Page
    {
        //This will store items in the order
        static List<OnOrder> onOrders;
        static InventoryDataSet dsInventory = new InventoryDataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //checking if its not a postback before newing makes the list persistant while building it
                //it will reset when coming from elsewhere
                onOrders = new List<OnOrder>();
            }
            //defaults date ordered to now
            txtDateOrdered.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
            InventoryTableAdapter inventory = new InventoryTableAdapter();
            inventory.Fill(dsInventory.Inventory);
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            //Get record based on whats selected in listbox
            DataRow item = dsInventory.Inventory.FindByid(Convert.ToInt32(lbInventory.SelectedValue));
            //assign relevant values to variables
            int quantity = Convert.ToInt32(txtQuantity.Text);
            decimal price = Math.Round(Convert.ToDecimal(item.ItemArray[6]) * Convert.ToDecimal(0.9), 2);
            string name = item.ItemArray[5].ToString();
            //construct onorders object and add to list
            onOrders.Add(new OnOrder(quantity, price, name));
            //Stores total
            decimal total = 0;
            //Build summary table off of list
            foreach (OnOrder onOrder in onOrders)
            {
                //increment total
                total += onOrder.price * onOrder.quantity;
                MakeTable(onOrder);
            }
            //add total to table
            MakeTotal(total);
            //Make table visible
            if (onOrders.Count > 0)
            {
                table.Visible = true;
                lblOrder.Visible = true;
            }
        }

        //Build the table rows and add them to the table
        private void MakeTable(OnOrder r)
        {
            TableRow row = new TableRow();

            TableCell item = new TableCell();
            TableCell quantity = new TableCell();
            TableCell price = new TableCell();
            TableCell total = new TableCell();

            //assigning text values for table cells
            item.Text = r.name;
            quantity.Text = r.quantity.ToString();
            price.Text = String.Format("{0:C2}", r.price);
            total.Text = String.Format("{0:C2}", Math.Round((r.price * r.quantity), 2));

            //Commit Cells to row
            row.Cells.Add(item);
            row.Cells.Add(quantity);
            row.Cells.Add(price);
            row.Cells.Add(total);

            //Commit row to table
            table.Rows.Add(row);
        }
        private void MakeTotal(decimal tot)
        {
            TableRow row = new TableRow();

            TableCell item = new TableCell();
            TableCell quantity = new TableCell();
            TableCell price = new TableCell();
            TableCell total = new TableCell();
            
            item.Text = "<b>Grand Total</b>";
            total.Text = "<b>"+String.Format("{0:C2}", Math.Round(tot,2))+"</b>";

            //Commit Cells to row
            row.Cells.Add(item);
            row.Cells.Add(quantity);
            row.Cells.Add(price);
            row.Cells.Add(total);

            //Commit row to table
            table.Rows.Add(row);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            KENDELL.Visible = true;
        }
    }
}