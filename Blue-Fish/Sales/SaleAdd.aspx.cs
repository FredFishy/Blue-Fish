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
        



        protected void Page_Load(object sender, EventArgs e)
        {
            
            // Create the headings for the receipt Table
            TableRow row = new TableRow();
            TableCell a = new TableCell();
            a.Text = "Product";
            row.Cells.Add(a);
            TableCell b = new TableCell();
            b.Text = "Quantity";
            row.Cells.Add(a);
            TableCell c = new TableCell();
            c.Text = "Price";
            TableCell d = new TableCell();
            d.Text = "Total";
            TableCell f = new TableCell();
            f.Text = "Edit";

            row.Cells.Add(a);
            row.Cells.Add(b);
            row.Cells.Add(c);
            row.Cells.Add(d);
            row.Cells.Add(f);

            receiptTable.Rows.Add(row);

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
                          
            // Take the data in the textbox and qty and add a row to the table
            TableRow row = new TableRow();
            TableCell a = new TableCell();
            a.Text = ddlInventory.Text;
            row.Cells.Add(a);
            TableCell b = new TableCell();
            b.Text = txtQuantityItem.Text;
            row.Cells.Add(b);
            TableCell c = new TableCell();
            decimal price = 0m;
            //c.Text = 
            row.Cells.Add(c);
            TableCell d = new TableCell();
            int quant = Int32.Parse(txtQuantityItem.Text);
            //decimal price = Decimal.Parse(c.Text);
            d.Text = "none";//(quant * price).ToString();
            TableCell f = new TableCell();
            f.Text = "<Asp:Button runat='server' Text='Delete'>";

            row.Cells.Add(a);
            row.Cells.Add(b);
            row.Cells.Add(c);
            row.Cells.Add(d);
            row.Cells.Add(f);

            receiptTable.Rows.Add(row);
        }
    }
}