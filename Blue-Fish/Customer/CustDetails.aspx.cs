using EmmaLibrary;
using EmmaLibrary.CustomerDatasetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static EmmaLibrary.CustomerDataset;

namespace Blue_Fish
{
    public partial class CustDetails : System.Web.UI.Page
    {
        static CustomerDataset dsCust = new CustomerDataset();
        protected void Page_Load(object sender, EventArgs e)
        {
            //why does this work
            if (String.IsNullOrEmpty(Request.QueryString["id"]))
            {
                lnkOrder.Visible = false;
                lnkService.Visible = false;
            }
            else
            {
                btnDelete.PostBackUrl = "CustDelete.aspx/?id=" + Request.QueryString["id"];
                btnEdit.PostBackUrl = "CustEdit.aspx/?id=" + Request.QueryString["id"];
                addSale.PostBackUrl = "../Sales/SaleAdd.aspx/?custId=" + Request.QueryString["id"];
                lnkOrder.PostBackUrl = "../Sales/SaleAdd.aspx/?custId=" + Request.QueryString["id"];
                lnkService.PostBackUrl = "../Sales/SaleAdd.aspx/?custId=" + Request.QueryString["id"];
            }
            try
            {
                CustomerDetailsTableAdapter daCust = new CustomerDetailsTableAdapter();
                daCust.Fill(dsCust.CustomerDetails, Convert.ToInt32(Request.QueryString["id"]));
                DataRow row = dsCust.CustomerDetails.Select().First();
                txtId.Text = row.ItemArray[0].ToString();
                txtFirstName.Text = row.ItemArray[1].ToString();
                txtLastName.Text = row.ItemArray[2].ToString();
                txtPhoneNumber.Text = row.ItemArray[3].ToString();
                txtAddress.Text = row.ItemArray[4].ToString();
                txtCity.Text = row.ItemArray[5].ToString();
                txtPostalCode.Text = row.ItemArray[6].ToString();
                txtEmailAddress.Text = row.ItemArray[7].ToString();

                //Populate Tables
                MakeTables();
            }
            catch { }
        }

        //Make the tables
        private void MakeTables()
        {
            CustomerSalesTableAdapter daSales = new CustomerSalesTableAdapter();
            CustomerRepairsTableAdapter daRepairs = new CustomerRepairsTableAdapter();
            daSales.Fill(dsCust.CustomerSales, Convert.ToInt32(Request.QueryString["id"]));
            daRepairs.Fill(dsCust.CustomerRepairs, Convert.ToInt32(Request.QueryString["id"]));

            if(dsCust.CustomerSales.Count > 0)
            {
                foreach (DataRow s in dsCust.CustomerSales.Rows)
                {
                    MakeTableOrder(s);
                }
                lblNoSale.Visible = false;
                tableOrder.Visible = true;
            }
            if (dsCust.CustomerRepairs.Count > 0)
            {
                foreach (DataRow r in dsCust.CustomerRepairs.Rows)
                {
                    MakeTableService(r);
                }
                lblNoService.Visible = false;
                tableService.Visible = true;
            }
        }


        //Build the table rows and add them to the table
        private void MakeTableOrder(DataRow r)
        {
            TableRow row = new TableRow();

            TableCell number = new TableCell();
            TableCell note = new TableCell();
            TableCell date = new TableCell();
            TableCell total = new TableCell();
            TableCell details = new TableCell();

            //assigning text values for table cells
            number.Text = r.ItemArray[5].ToString();
            note.Text = r.ItemArray[1].ToString();
            date.Text = Convert.ToDateTime(r.ItemArray[2]).ToShortDateString();
            total.Text = String.Format("{0:C2}", r.ItemArray[3]);

            //adding the buttons for Details/Edit/Delete
            details.Text =
            "<a href='../..//Sales/SaleDetails.aspx/?id=" + r.ItemArray[0] + "' title='Details' class='btn btn-sm'>" +
                "<svg style='width: 24px; height: 24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M7.5,15C8.63,15 9.82,15.26 11.09,15.77C12.35,16.29 13,16.95 13,17.77V20H2V17.77C2,16.95 2.65,16.29 3.91,15.77C5.18,15.26 6.38,15 7.5,15M13,13H22V15H13V13M13,9H22V11H13V9M13,5H22V7H13V5M7.5,8A2.5,2.5 0 0,1 10,10.5A2.5,2.5 0 0,1 7.5,13A2.5,2.5 0 0,1 5,10.5A2.5,2.5 0 0,1 7.5,8Z' />" +
                "</svg>" +
            "</a>";
            details.Style.Value = "width:20px";

            //Commit Cells to row
            row.Cells.Add(number);
            row.Cells.Add(note);
            row.Cells.Add(date);
            row.Cells.Add(total);
            row.Cells.Add(details);


            //Commit row to table
            tableOrder.Rows.Add(row);
        }

        private void MakeTableService(DataRow r)
        {
            TableRow row = new TableRow();

            TableCell number = new TableCell();
            TableCell equip = new TableCell();
            TableCell service = new TableCell();
            TableCell issue = new TableCell();
            TableCell date = new TableCell();
            TableCell warranty = new TableCell();
            TableCell price = new TableCell();
            TableCell details = new TableCell();

            //assigning text values for table cells
            number.Text = r.ItemArray[0].ToString();
            equip.Text = r.ItemArray[1].ToString();
            service.Text = r.ItemArray[2].ToString();
            issue.Text = r.ItemArray[3].ToString();
            date.Text = Convert.ToDateTime(r.ItemArray[4]).ToShortDateString();
            warranty.Text = r.ItemArray[5].ToString();
            price.Text = String.Format("{0:C2}", r.ItemArray[6]);


            //adding the buttons for Details/Edit/Delete
            details.Text =
            "<a href='../../Sales/SaleDetails.aspx/?id=" + r.ItemArray[7] + "' title='Details' class='btn btn-sm'>" +
                "<svg style='width: 24px; height: 24px' viewBox='0 0 24 24'>" +
                    "<path fill='#000000' d='M7.5,15C8.63,15 9.82,15.26 11.09,15.77C12.35,16.29 13,16.95 13,17.77V20H2V17.77C2,16.95 2.65,16.29 3.91,15.77C5.18,15.26 6.38,15 7.5,15M13,13H22V15H13V13M13,9H22V11H13V9M13,5H22V7H13V5M7.5,8A2.5,2.5 0 0,1 10,10.5A2.5,2.5 0 0,1 7.5,13A2.5,2.5 0 0,1 5,10.5A2.5,2.5 0 0,1 7.5,8Z' />" +
                "</svg>" +
            "</a>";
            details.Style.Value = "width:20px";


            //Commit Cells to row
            row.Cells.Add(number);
            row.Cells.Add(equip);
            row.Cells.Add(service);
            row.Cells.Add(issue);
            row.Cells.Add(warranty);
            row.Cells.Add(date);
            row.Cells.Add(price);
            row.Cells.Add(details);


            //Commit row to table
            tableService.Rows.Add(row);
        }
    }
}