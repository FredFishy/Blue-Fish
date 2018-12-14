/*

    Created by:         Will Ashcroft
    Date:               2018-12-08
    Last modified by:   Will Ashcroft
    Date:               2018-12-13
    Description:        Sale Page

*/
using EmmaLibrary;
using EmmaLibrary.EmployeeReportDatasetTableAdapters;
using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace Blue_Fish
{

    public partial class ReportAdmin : System.Web.UI.Page
    {
        static EmployeeReportDataset dsEmp = new EmployeeReportDataset();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack) return;
            {
                txtOrderDateLow.Text = DateTime.Now.Date.AddDays(-7).ToString("yyyy-MM-dd");
                txtOrderDateHigh.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                employeeTableAdapter daEmp = new employeeTableAdapter();
                daEmp.Fill(dsEmp.employee);

                foreach (DataRow r in dsEmp.employee)
                {
                    MakeTable(r);
                }
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string search = "empFull LIKE '%" + txtName.Text + "%' AND posName LIKE '%" + ((ddlPosition.SelectedIndex > 0) ? ddlPosition.SelectedItem.Text : "") + "%'";


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
        }

        //Build the table rows and add them to the table
        private void MakeTable(DataRow r)
        {

            int empSalesTotal = 0;
            int empRepTotal = 0;
            decimal salesTotal = 0;
            int empId = Convert.ToInt32(r.ItemArray[0]);
            string dateLow = txtOrderDateLow.Text;
            string dateHigh = txtOrderDateHigh.Text;
            employeeTotalSalesTableAdapter receipt = new employeeTotalSalesTableAdapter();
            employeeTotalRepairsTableAdapter repair = new employeeTotalRepairsTableAdapter();
            employeeSalesTotalTableAdapter total = new employeeSalesTotalTableAdapter();
            try
            {
                receipt.Fill(dsEmp.employeeTotalSales, dateLow, dateHigh, empId);
                empSalesTotal = Convert.ToInt32(dsEmp.employeeTotalSales.Single().ItemArray[0]);
            }
            catch { }

            try
            {
                repair.Fill(dsEmp.employeeTotalRepairs, dateLow, dateHigh, empId);
                empRepTotal = Convert.ToInt32(dsEmp.employeeTotalRepairs.Single().ItemArray[0]);
            }
            catch { }

            try
            {
                total.Fill(dsEmp.employeeSalesTotal, dateLow, dateHigh, empId);
                salesTotal = Convert.ToDecimal(dsEmp.employeeSalesTotal.Single().ItemArray[0]);
            }
            catch { }




            TableRow row = new TableRow();

            TableCell empFull = new TableCell();
            TableCell empPosition = new TableCell();
            TableCell repairCount = new TableCell();
            TableCell saleCount = new TableCell();
            TableCell orderTotal = new TableCell();


            //assigning text values for table cells
            empFull.Text = r.ItemArray[1].ToString();
            empPosition.Text = r.ItemArray[2].ToString();
            repairCount.Text = empRepTotal.ToString();
            saleCount.Text = empSalesTotal.ToString();
            orderTotal.Text = String.Format("{0:C}", salesTotal);

            //Commit Cells to row
            row.Cells.Add(empFull);
            row.Cells.Add(empPosition);
            row.Cells.Add(repairCount);
            row.Cells.Add(saleCount);
            row.Cells.Add(orderTotal);

            //Commit row to table
            table.Rows.Add(row);
        }
    }
}