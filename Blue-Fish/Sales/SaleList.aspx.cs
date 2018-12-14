using EmmaLibrary;
using EmmaLibrary.SalesDatasetTableAdapters;
using System;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;

namespace Blue_Fish.Sales
{
    public partial class SaleList : System.Web.UI.Page
    {
        static SalesDataset dsSales = new SalesDataset();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            {

                receiptTableAdapter daSales = new receiptTableAdapter();
                try
                {
                    daSales.Fill(dsSales.receipt);
                }
                catch { }

                foreach (DataRow r in dsSales.receipt)
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
            TableCell customer = new TableCell();
            TableCell custPhone = new TableCell();
            TableCell paid = new TableCell();
            TableCell total = new TableCell();
            TableCell details = new TableCell();
            TableCell edit = new TableCell();
            TableCell delete = new TableCell();

            //assigning text values for table cells
            number.Text = r.Field<int>("id").ToString();
            date.Text = r.Field<DateTime>("ordDate").ToShortDateString();
            customer.Text = r.Field<string>("custFull");
            custPhone.Text = String.Format("{0:(###) ###-####}", Convert.ToInt64(r.ItemArray[5]));
            paid.Text = r.Field<bool>("ordPaid") ? "Yes" : "No";
            total.Text = String.Format("{0:C2}", r.ItemArray[4]);

            //adding the buttons for Details/Edit/Delete
            details.Text =
            "<a href='receiptingDetails.aspx?id=" + r.Field<int>("id") + "' title='Details' class='btn btn-sm'>" +
                "<svg style='width: 24px; height: 24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M7.5,15C8.63,15 9.82,15.26 11.09,15.77C12.35,16.29 13,16.95 13,17.77V20H2V17.77C2,16.95 2.65,16.29 3.91,15.77C5.18,15.26 6.38,15 7.5,15M13,13H22V15H13V13M13,9H22V11H13V9M13,5H22V7H13V5M7.5,8A2.5,2.5 0 0,1 10,10.5A2.5,2.5 0 0,1 7.5,13A2.5,2.5 0 0,1 5,10.5A2.5,2.5 0 0,1 7.5,8Z' />" +
                "</svg>" +
            "</a>";
            details.Style.Value = "width:20px";

            edit.Text =
            "<a href='receiptingEdit.aspx?id=" + r.Field<int>("id") + "' title='Edit' class='btn btn-sm'>" +
                "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18,2.9 17.35,2.9 16.96,3.29L15.12,5.12L18.87,8.87M3,17.25V21H6.75L17.81,9.93L14.06,6.18L3,17.25Z' />" +
                "</svg" +
            "</a>";
            edit.Style.Value = "width:20px";

            delete.Text =
            "<a href='receiptingDelete.aspx?id=" + r.Field<int>("id") + "' title='Delete' class='btn btn-sm'>" +
                "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z' />" +
                "</svg>" +
            "</a>";
            delete.Style.Value = "width:20px";

            //Commit Cells to row
            row.Cells.Add(number);
            row.Cells.Add(customer);
            row.Cells.Add(custPhone);
            row.Cells.Add(date);
            row.Cells.Add(paid);
            row.Cells.Add(total);
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

            DateTime dateLow;
            if (!string.IsNullOrEmpty(txtDateLow.Text) && DateTime.TryParse(txtDateLow.Text, out dateLow))
            {
                where.Append("ordDate >= '").Append(dateLow.ToShortDateString()).Append("'");
            }
            DateTime dateHigh;
            if (!string.IsNullOrEmpty(txtDateHigh.Text) && DateTime.TryParse(txtDateHigh.Text, out dateHigh))
            {
                where = CheckAnd(where);
                where.Append("ordDate <= '").Append(dateHigh.ToShortDateString()).Append("'");
            }
            if (!string.IsNullOrEmpty(txtTotalLow.Text))
            {
                where = CheckAnd(where);
                where.Append("saleTotal >= '").Append(txtTotalLow.Text).Append("'");
            }
            if (!string.IsNullOrEmpty(txtTotalHigh.Text))
            {
                where = CheckAnd(where);
                where.Append("saleTotal <= '").Append(txtTotalHigh.Text).Append("'");
            }
            if (!string.IsNullOrEmpty(txtOrderNumber.Text))
            {
                where = CheckAnd(where);
                where.Append("ordNumber LIKE '%").Append(txtOrderNumber.Text).Append("%'");
            }
            if (!string.IsNullOrEmpty(txtCustPhone.Text))
            {
                where = CheckAnd(where);
                where.Append("custPhone LIKE '%").Append(txtCustPhone.Text).Append("%'");
            }
            if (ddlPaid.SelectedIndex == 1)
            {
                where = CheckAnd(where);
                where.Append("ordPaid = 1");
            }
            else if (ddlPaid.SelectedIndex == 2)
            {
                where = CheckAnd(where);
                where.Append("ordPaid = 0");
            }

            //Execute where clause
            DataRow[] rows = dsSales.receipt.Select(where.ToString());

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
            txtDateLow.Text = "";
            txtDateHigh.Text = "";
            txtTotalLow.Text = "";
            txtTotalHigh.Text = "";
            txtCustPhone.Text = "";
            ddlPaid.SelectedIndex = 0;
            btnSubmit_Click(this, new EventArgs());
        }
    }
}
