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



        // list to add rows to because website's postback doesn't keep the rows
        static List<TableRow> allRows = new List<TableRow>();
        static List<RadioButton> allRadioButtons = new List<RadioButton>();

        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}