using EmmaLibrary;
using EmmaLibrary.CustomerDatasetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

//Will Ashcroft
namespace Blue_Fish
{
    public partial class CustIndex : System.Web.UI.Page
    {
        static CustomerDataset dsCust = new CustomerDataset();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            {
                CustomerIndexTableAdapter daCust = new CustomerIndexTableAdapter();
                try
                {
                    daCust.Fill(dsCust.CustomerIndex);
                }
                catch { }

                foreach (DataRow r in dsCust.CustomerIndex)
                {
                    MakeTable(r);
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Building the where clause
            StringBuilder where = new StringBuilder();
            where.Append("custFull LIKE '%" + txtName.Text + "%'");
            where.Append("AND custPhone LIKE '%" + txtPhone.Text + "%'");
            where.Append("AND custCity LIKE '%" + txtCity.Text + "%'");

            //Execute where clause
            DataRow[] rows = dsCust.CustomerIndex.Select(where.ToString());

            //display results
            foreach (DataRow r in rows)
            {
                MakeTable(r);
            }
        }

        //Build the table rows and add them to the table
        private void MakeTable(DataRow r)
        {
            TableRow row = new TableRow();

            TableCell name = new TableCell();
            TableCell number = new TableCell();
            TableCell city = new TableCell();
            TableCell details = new TableCell();
            TableCell edit = new TableCell();
            TableCell delete = new TableCell();

            //assigning text values for table cells
            name.Text = r.ItemArray[2].ToString();
            number.Text = String.Format("{0:(###) ###-####}", Convert.ToInt64(r.ItemArray[1].ToString()));
            city.Text = r.ItemArray[3].ToString();

            //adding the buttons for Details/Edit/Delete
            details.Text =
            "<a href='CustDetails.aspx/?id="+r.ItemArray[0]+"' title='Details' class='btn btn-sm'>" +
                "<svg style='width: 24px; height: 24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M7.5,15C8.63,15 9.82,15.26 11.09,15.77C12.35,16.29 13,16.95 13,17.77V20H2V17.77C2,16.95 2.65,16.29 3.91,15.77C5.18,15.26 6.38,15 7.5,15M13,13H22V15H13V13M13,9H22V11H13V9M13,5H22V7H13V5M7.5,8A2.5,2.5 0 0,1 10,10.5A2.5,2.5 0 0,1 7.5,13A2.5,2.5 0 0,1 5,10.5A2.5,2.5 0 0,1 7.5,8Z' />" +
                "</svg>" +
            "</a>";
            details.Style.Value = "width:20px";

            edit.Text =
            "<a href='CustEdit.aspx?id=" + r.ItemArray[0] + "' title='Edit' class='btn btn-sm'>" +
                "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18,2.9 17.35,2.9 16.96,3.29L15.12,5.12L18.87,8.87M3,17.25V21H6.75L17.81,9.93L14.06,6.18L3,17.25Z' />" +
                "</svg" +
            "</a>";
            edit.Style.Value = "width:20px";

            delete.Text =
            "<a href='CustDelete.aspx?id=" + r.ItemArray[0] + "' title='Delete' class='btn btn-sm'>" +
                "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z' />" +
                "</svg>" +
            "</a>";
            delete.Style.Value = "width:20px";

            //Commit Cells to row
            row.Cells.Add(name);
            row.Cells.Add(number);
            row.Cells.Add(city);
            row.Cells.Add(details);
            row.Cells.Add(edit);
            row.Cells.Add(delete);


            //Commit row to table
            table.Rows.Add(row);
        }

        //Clears filters and returns all records
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPhone.Text = "";
            txtCity.Text = "";
            btnSubmit_Click(this, new EventArgs());
        }
    }
}