/*

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Nigel Girouard
    Date:               2018-12-08
    Description:        Order list 

*/

using EmmaLibrary;
using EmmaLibrary.OrderDatasetTableAdapters;
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
    public partial class OrderingList : System.Web.UI.Page
    {
        static OrderDataset dsOrd = new OrderDataset();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            {
                OrderTableAdapter daOrd = new OrderTableAdapter();
                try
                {
                    daOrd.Fill(dsOrd.Order);
                }
                catch { }

                foreach (DataRow r in dsOrd.Order)
                {
                    MakeTable(r);
                }
            }
        }

        //Build the table rows and add them to the table
        private void MakeTable(DataRow r)
        {
            TableRow row = new TableRow();

            TableCell number = new TableCell();
            TableCell date = new TableCell();
            TableCell paid = new TableCell();
            TableCell details = new TableCell();
            TableCell edit = new TableCell();
            TableCell delete = new TableCell();

            //assigning text values for table cells
            number.Text = r.Field<string>("pordNumber");
            date.Text = r.Field<DateTime>("pordDateOrdered").ToShortDateString();
            paid.Text = r.Field<bool>("pordPaid") ? "Yes" : "No";

            //adding the buttons for Details/Edit/Delete
            details.Text =
            "<a href='OrderingDetails.aspx?id=" + r.Field<int>("id") + "' title='Details' class='btn btn-sm'>" +
                "<svg style='width: 24px; height: 24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M7.5,15C8.63,15 9.82,15.26 11.09,15.77C12.35,16.29 13,16.95 13,17.77V20H2V17.77C2,16.95 2.65,16.29 3.91,15.77C5.18,15.26 6.38,15 7.5,15M13,13H22V15H13V13M13,9H22V11H13V9M13,5H22V7H13V5M7.5,8A2.5,2.5 0 0,1 10,10.5A2.5,2.5 0 0,1 7.5,13A2.5,2.5 0 0,1 5,10.5A2.5,2.5 0 0,1 7.5,8Z' />" +
                "</svg>" +
            "</a>";
            details.Style.Value = "width:20px";

            edit.Text =
            "<a href='OrderingEdit.aspx?id=" + r.Field<int>("id") + "' title='Edit' class='btn btn-sm'>" +
                "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18,2.9 17.35,2.9 16.96,3.29L15.12,5.12L18.87,8.87M3,17.25V21H6.75L17.81,9.93L14.06,6.18L3,17.25Z' />" +
                "</svg" +
            "</a>";
            edit.Style.Value = "width:20px";

            delete.Text =
            "<a href='OrderingDelete.aspx?id=" + r.Field<int>("id") + "' title='Delete' class='btn btn-sm'>" +
                "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z' />" +
                "</svg>" +
            "</a>";
            delete.Style.Value = "width:20px";

            //Commit Cells to row
            row.Cells.Add(number);
            row.Cells.Add(date);
            row.Cells.Add(paid);
            row.Cells.Add(details);
            row.Cells.Add(edit);
            row.Cells.Add(delete);


            //Commit row to table
            table.Rows.Add(row);
        }

        private StringBuilder CheckAnd(StringBuilder sb)
        {
            if (!string.IsNullOrEmpty(sb.ToString()))
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
            ////Building the where clause
            StringBuilder where = new StringBuilder();

            DateTime orderDateLow;
            if(!string.IsNullOrEmpty(txtOrderDateLow.Text) && DateTime.TryParse(txtOrderDateLow.Text, out orderDateLow))
            {
                where.Append("pordDateOrdered >= '").Append(orderDateLow.ToShortDateString()).Append("'");
            }

            DateTime orderDateHigh;
            if (!string.IsNullOrEmpty(txtOrderDateHigh.Text) && DateTime.TryParse(txtOrderDateHigh.Text, out orderDateHigh))
            {
                where = CheckAnd(where);
                where.Append("pordDateOrdered <= '").Append(orderDateHigh.ToShortDateString()).Append("'");
            }

            if (!string.IsNullOrEmpty(txtOrderNumber.Text))
            {
                where = CheckAnd(where);
                where.Append("pordNumber LIKE '%").Append(txtOrderNumber.Text).Append("%'");
            }

            if(ddlPaid.SelectedIndex == 1)
            {
                where = CheckAnd(where);
                where.Append("pordPaid = 1");
            }
            else if (ddlPaid.SelectedIndex == 2)
            {
                where = CheckAnd(where);
                where.Append("pordPaid = 0");
            }

            //Execute where clause
            DataRow[] rows = dsOrd.Order.Select(where.ToString());

            //display results
            foreach (DataRow r in rows)
            {
                MakeTable(r);
            }
        }

        //Clears filters and returns all records
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtOrderNumber.Text = "";
            txtOrderDateLow.Text = "";
            txtOrderDateHigh.Text = "";
            ddlPaid.SelectedIndex = 0;
            btnSubmit_Click(this, new EventArgs());
        }
    }
}