using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmmaLibrary;
using EmmaLibrary.AdminSalesReportTableAdapters;

namespace Blue_Fish
{
    
    public partial class ReportAdmin : System.Web.UI.Page
        {
            static EmployeeReportDataset dsEmp  = new EmployeeReportDataset();


            protected void Page_Load(object sender, EventArgs e)
            {
                if (IsPostBack) return;
                {
                    SalesTableAdapter daCust = new SalesTableAdapter();
                    try
                    {
                        daCust.Fill(dsSales.Sales);
                    }
                    catch { }

                    foreach (DataRow r in dsSales.Sales)
                    {
                        MakeTable(r);
                    }
                }
            }

            protected void dsSearch_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
            {

            }

            protected void Unnamed1_Click(object sender, EventArgs e)
            {
                string search = "";
                DateTime begin = new DateTime(0001, 01, 01);
                DateTime end = new DateTime(9999, 01, 01);

                if (txtStartDate.Text.Length != 0)
                {
                    begin = DateTime.Parse(txtStartDate.Text);
                }
                if (txtEndDate.Text.Length != 0)
                {
                    end = DateTime.Parse(txtEndDate.Text);
                }

                search += "(ordDate >= '" + begin.Date + "' AND ordDate <='" + end.Date + "')";

                if (ddlPaid.SelectedValue != "Either")
                {
                    search += " AND ordPaid = " + ddlPaid.SelectedValue + "";
                }

                if (ddlBrand.SelectedValue != "0")
                {
                    search += " AND prodBrand = '" + ddlBrand.SelectedValue + "'";
                }

                //Execute where clause
                DataRow[] rows = dsSales.Sales.Select(search);



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

                TableCell orderNumber = new TableCell();
                TableCell date = new TableCell();
                TableCell quantity = new TableCell();
                TableCell total = new TableCell();


                //assigning text values for table cells
                orderNumber.Text = r.ItemArray[7].ToString();
                date.Text = r.ItemArray[4].ToString();
                quantity.Text = r.ItemArray[1].ToString();
                total.Text = String.Format("{0:C}", r.ItemArray[3].ToString());

                //Commit Cells to row
                row.Cells.Add(orderNumber);
                row.Cells.Add(date);
                row.Cells.Add(quantity);
                row.Cells.Add(total);



                //Commit row to table
                table.Rows.Add(row);
            }
        }
    }