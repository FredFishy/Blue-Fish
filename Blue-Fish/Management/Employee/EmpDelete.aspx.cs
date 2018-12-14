/*

    Created by:         Will Ashcroft
    Date:               2018-12-08
    Last modified by:   Will Ashcroft
    Date:               2018-12-13
    Description:        Sale Page

*/
using EmmaLibrary;
using EmmaLibrary.EmployeeDatasetTableAdapters;
using System;
using System.Data;

namespace Blue_Fish
{
    public partial class EmpDelete : System.Web.UI.Page
    {
        static EmployeeDataset dsEmp = new EmployeeDataset();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                EmployeeDetailsTableAdapter daEmp = new EmployeeDetailsTableAdapter();
                //Grab data by id
                daEmp.Fill(dsEmp.EmployeeDetails, Convert.ToInt32(Request.QueryString["id"]));
                DataRow row = dsEmp.EmployeeDetails.Rows[0];
                //Fill in data
                txtId.Text = row.ItemArray[0].ToString();
                txtFirstName.Text = row.ItemArray[1].ToString();
                txtLastName.Text = row.ItemArray[2].ToString();
                txtPosition.Text = row.ItemArray[4].ToString();
            }
            catch { }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (Employee.DeleteEmployee(Convert.ToInt32(txtId.Text), out string status))
            {
                Response.Redirect("~/Management/Employee/EmpIndex.aspx");
            }
            else
            {
                error.Visible = true;
                lblStatus.Text = status;
            }
        }
    }
}