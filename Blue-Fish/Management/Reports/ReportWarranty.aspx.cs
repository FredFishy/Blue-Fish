/*

    Created by:         Nigel Girouard
    Date:               2018-12-11
    Last modified by:   Nigel Girouard
    Date:               2018-12-13
    Description:        Warranty report

*/

using EmmaLibrary;
using EmmaLibrary.WarrantyReportDataSetTableAdapters;
using System;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class ReportWarranty : System.Web.UI.Page
    {
        static WarrantyReportDataSet dsWar = new WarrantyReportDataSet();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            WarrantyReportTableAdapter daWar = new WarrantyReportTableAdapter();
            try
            {
                daWar.Fill(dsWar.WarrantyReport);
            }
            catch { }

            foreach (DataRow r in dsWar.WarrantyReport.OrderByDescending(w => w.serordDateIn).ThenByDescending(w => w.serordDateOut))
            {
                MakeTable(r);
            }
            MakeFinalRow();
        }

        protected void dsSearch_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

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
            StringBuilder where = new StringBuilder();

            if (ddlManufact.SelectedIndex > 0)
            {
                where.Append("id = ").Append(ddlManufact.SelectedIndex.ToString());
            }

            DataRow[] rows = dsWar.WarrantyReport.Select(where.ToString(), "serordDateIn Desc, serordDateOut Desc");

            foreach (DataRow r in rows)
            {
                MakeTable(r);
            }
            MakeFinalRow(rows);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ddlManufact.SelectedIndex = 0;
            txtDateInHigh.Text = "";
            txtDateInLow.Text = "";
            txtDateOutHigh.Text = "";
            txtDateOutLow.Text = "";
            btnSubmit_Click(this, new EventArgs());
        }

        //Build the table rows and add them to the table
        private void MakeTable(DataRow r)
        {
            TableRow row = new TableRow();

            TableCell manufact = new TableCell();
            TableCell prob = new TableCell();
            TableCell dateIn = new TableCell();
            TableCell dateOut = new TableCell();
            TableCell price = new TableCell();

            //assigning text values for table cells
            manufact.Text = r.Field<string>("manName");
            prob.Text = r.Field<string>("serordIssue");
            dateIn.Text = r.Field<DateTime>("serordDateIn").ToShortDateString();
            dateOut.Text = r.Field<DateTime>("serordDateOut").ToShortDateString();
            price.Text = r.Field<decimal>("serPrice").ToString("c");

            //Commit Cells to row
            row.Cells.Add(manufact);
            row.Cells.Add(prob);
            row.Cells.Add(dateIn);
            row.Cells.Add(dateOut);
            row.Cells.Add(price);

            //Commit row to table
            table.Rows.Add(row);
        }

        private void MakeFinalRow()
        {
            TableRow row = new TableRow();

            TableCell total = new TableCell();
            TableCell final = new TableCell();

            //assigning text values for table cells
            total.Text = "<b>Total</b>";

            decimal numTotal = 0;
            foreach (DataRow r in dsWar.WarrantyReport)
            {
                numTotal += r.Field<decimal>("serPrice");
            }

            final.Text = "<b>" + numTotal.ToString("c") + "</b>";

            //Commit Cells to row
            row.Cells.Add(total);
            row.Cells.Add(new TableCell());
            row.Cells.Add(new TableCell());
            row.Cells.Add(new TableCell());
            row.Cells.Add(final);

            //Commit row to table
            table.Rows.Add(row);
        }

        private void MakeFinalRow(DataRow[] rows)
        {
            TableRow row = new TableRow();

            TableCell total = new TableCell();
            TableCell final = new TableCell();

            //assigning text values for table cells
            total.Text = "<b>Total</b>";

            decimal numTotal = 0;
            foreach (DataRow r in rows)
            {
                numTotal += r.Field<decimal>("serPrice");
            }

            final.Text = "<b>" + numTotal.ToString("c") + "</b>";

            //Commit Cells to row
            row.Cells.Add(total);
            row.Cells.Add(new TableCell());
            row.Cells.Add(new TableCell());
            row.Cells.Add(new TableCell());
            row.Cells.Add(final);

            //Commit row to table
            table.Rows.Add(row);
        }
    }
}