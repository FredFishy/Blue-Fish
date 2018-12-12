using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmmaLibrary;
using EmmaLibrary.EmployeeReportDatasetTableAdapters;

namespace Blue_Fish
{
    
    public partial class ReportAdmin : System.Web.UI.Page
        {
            static EmployeeReportDataset dsEmp  = new EmployeeReportDataset();

        decimal netTotal;

        protected void Page_Load(object sender, EventArgs e)
            {
            
                if (IsPostBack) return;
                {
                    //txtStartDate.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                    //txtEndDate.Text = DateTime.Now.Date.AddDays(-7).ToString("yyyy-MM-dd");

                    employeeTableAdapter daEmp = new employeeTableAdapter();
                    try
                    {
                        daEmp.Fill(dsEmp.employee);
                    }
                    catch { }

                    foreach (DataRow r in dsEmp.employee)
                    {
                        MakeTable(r);
                    }
                    CalcNetTotal();
            }
            }


            protected void btnSubmit_Click(object sender, EventArgs e)
            {
                string search = "";

                if (txtName.Text.Length > 0)
                {
                    search += " AND empFull LIKE '%" + txtName.Text + "%'";
                }

                if (txtTotal.Text.Length > 0)
                {
                    search += " AND orderTotal >= '" + txtTotal.Text + "'";
                }

                employeeTableAdapter daEmp = new employeeTableAdapter();
                try
                {
                    daEmp.Fill(dsEmp.employee);
                }
                catch { }

            //Execute where clause
            DataRow[] rows = dsEmp.employee.Select(search);


            
                //display results
                foreach (DataRow r in rows)
                {
                    MakeTable(r);        
                }

                CalcNetTotal();
            }

            //Build the table rows and add them to the table
            private void MakeTable(DataRow r)
            {

                empReceiptTableAdapter receipt = new empReceiptTableAdapter();
                receipt.Fill(dsEmp.empReceipt);
                int empID = Convert.ToInt32(r.ItemArray[3].ToString());
                DataRow emp = dsEmp.empReceipt.Select("empID = "+empID).First();

                TableRow row = new TableRow();

                TableCell ordNumber = new TableCell();
                TableCell empFull = new TableCell();
                TableCell saleCount = new TableCell();
                TableCell orderTotal = new TableCell();


                //assigning text values for table cells
                empFull.Text = r.ItemArray[1].ToString();
                saleCount.Text = r.ItemArray[2].ToString();
                orderTotal.Text = String.Format("{0:C}", emp.ItemArray[1]);

                //Commit Cells to row
                row.Cells.Add(empFull);
                row.Cells.Add(saleCount);
                row.Cells.Add(orderTotal);
                        
                //Commit row to table
                table.Rows.Add(row);

                //Sum the totals that have been selected
                netTotal += Decimal.Parse(r.ItemArray[2].ToString());
            }

            private void CalcNetTotal()
            {
                TableRow summary = new TableRow();
                TableCell total = new TableCell();
                TableCell label = new TableCell();
                label.Text = "<b>Net Total</b>";

                total.Text = String.Format("{0:C}", netTotal);
                summary.Cells.AddRange(new TableCell[] { label, new TableCell(), total });
                table.Rows.Add(summary);
            }
    }
 }