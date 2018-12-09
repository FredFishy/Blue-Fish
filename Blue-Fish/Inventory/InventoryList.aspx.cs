/*

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Nigel Girouard
    Date:               2018-12-08
    Description:        Inventory list 

*/

using EmmaLibrary;
using EmmaLibrary.InventoryDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class InventoryList : System.Web.UI.Page
    {

        static InventoryDataSet dsInv = new InventoryDataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            {
                InventoryTableAdapter daInv = new InventoryTableAdapter();
                try
                {
                    daInv.Fill(dsInv.Inventory);
                }
                catch { }

                foreach (DataRow r in dsInv.Inventory)
                {
                    MakeTable(r);
                }
            }
        }

        //Build the table rows and add them to the table
        private void MakeTable(DataRow r)
        {
            TableRow row = new TableRow();

            TableCell quantity = new TableCell();
            TableCell size = new TableCell();
            TableCell name = new TableCell();
            TableCell description = new TableCell();
            TableCell details = new TableCell();
            TableCell edit = new TableCell();
            TableCell delete = new TableCell();

            //assigning text values for table cells
            quantity.Text = r.Field<int>("invQuantity").ToString();
            size.Text = r.Field<decimal>("invSize").ToString();
            name.Text = r.Field<string>("prodName");
            description.Text = r.Field<string>("prodDescription");

            //adding the buttons for Details/Edit/Delete
            details.Text =
            "<a href='InventoryDetails.aspx?id=" + r.Field<int>("id") + "' title='Details' class='btn btn-sm'>" +
                "<svg style='width: 24px; height: 24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M7.5,15C8.63,15 9.82,15.26 11.09,15.77C12.35,16.29 13,16.95 13,17.77V20H2V17.77C2,16.95 2.65,16.29 3.91,15.77C5.18,15.26 6.38,15 7.5,15M13,13H22V15H13V13M13,9H22V11H13V9M13,5H22V7H13V5M7.5,8A2.5,2.5 0 0,1 10,10.5A2.5,2.5 0 0,1 7.5,13A2.5,2.5 0 0,1 5,10.5A2.5,2.5 0 0,1 7.5,8Z' />" +
                "</svg>" +
            "</a>";
            details.Style.Value = "width:20px";

            edit.Text =
            "<a href='InventoryEdit.aspx?id=" + r.Field<int>("id") + "' title='Edit' class='btn btn-sm'>" +
                "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18,2.9 17.35,2.9 16.96,3.29L15.12,5.12L18.87,8.87M3,17.25V21H6.75L17.81,9.93L14.06,6.18L3,17.25Z' />" +
                "</svg" +
            "</a>";
            edit.Style.Value = "width:20px";

            delete.Text =
            "<a href='InventoryDelete.aspx?id=" + r.Field<int>("id") + "' title='Delete' class='btn btn-sm'>" +
                "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z' />" +
                "</svg>" +
            "</a>";
            delete.Style.Value = "width:20px";

            //Commit Cells to row
            row.Cells.Add(quantity);
            row.Cells.Add(size);
            row.Cells.Add(name);
            row.Cells.Add(description);
            row.Cells.Add(details);
            row.Cells.Add(edit);
            row.Cells.Add(delete);


            //Commit row to table
            table.Rows.Add(row);
        }

        private StringBuilder CheckAnd(StringBuilder sb)
        {
            if(!string.IsNullOrEmpty(sb.ToString()))
            {
                return sb.Append(" and ");
            }
            else
            {
                return sb;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Building the where clause
            StringBuilder where = new StringBuilder();

            //where.Append("invQuantity between " + txtQuantityLow.Text + " and " + txtQuantityHigh.Text);
            int quantityLow = 1;
            if(!string.IsNullOrEmpty(txtQuantityLow.Text) && int.TryParse(txtQuantityLow.Text, out quantityLow))
            {
                where.Append("invQuantity >= ").Append(quantityLow);
            }

            int quantityHigh = 1;
            if (!string.IsNullOrEmpty(txtQuantityHigh.Text) && int.TryParse(txtQuantityHigh.Text, out quantityHigh))
            {
                where = CheckAnd(where);
                where.Append("invQuantity <= ").Append(quantityHigh);
            }

            decimal sizeLow = 1;
            if (!string.IsNullOrEmpty(txtSizeLow.Text) && decimal.TryParse(txtSizeLow.Text, out sizeLow))
            {
                where = CheckAnd(where);
                where.Append("invSize >= ").Append(sizeLow);
            }

            decimal sizeHigh = 1;
            if (!string.IsNullOrEmpty(txtSizeHigh.Text) && decimal.TryParse(txtSizeHigh.Text, out sizeHigh))
            {
                where = CheckAnd(where);
                where.Append("invSize <= ").Append(sizeHigh);
            }

            if (!string.IsNullOrEmpty(txtName.Text))
            {
                where = CheckAnd(where);
                where.Append("prodName LIKE '%").Append(txtName.Text).Append("%'");
            }

            if (!string.IsNullOrEmpty(txtDescription.Text))
            {
                where = CheckAnd(where);
                where.Append("prodDescription LIKE '%").Append(txtDescription.Text).Append("%'");
            }

            //Execute where clause
            DataRow[] rows = dsInv.Inventory.Select(where.ToString());

            //display results
            foreach (DataRow r in rows)
            {
                MakeTable(r);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtQuantityLow.Text = "";
            txtQuantityHigh.Text = "";
            txtSizeLow.Text = "";
            txtSizeHigh.Text = "";
            txtName.Text = "";
            txtDescription.Text = "";
            btnSubmit_Click(this, new EventArgs());
        }
    }
}