using EmmaLibrary;
using EmmaLibrary.EmployeeDatasetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Will Ashcroft
namespace Blue_Fish
{
    public partial class EmpEdit : System.Web.UI.Page
    {
        static EmployeeDataset dsEmp = new EmployeeDataset();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                EmployeeDetailsTableAdapter daEmp = new EmployeeDetailsTableAdapter();
                //Get data based on passed id in request
                daEmp.Fill(dsEmp.EmployeeDetails, Convert.ToInt32(Request.QueryString["id"]));
                DataRow row = dsEmp.EmployeeDetails.Rows[0];
                //Fill in Data
                txtId.Text = row.ItemArray[0].ToString();
                txtFirstName.Text = row.ItemArray[1].ToString();
                txtLastName.Text = row.ItemArray[2].ToString();
                ddlPosition.SelectedValue = row.ItemArray[3].ToString();
            }
            catch { }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Employee employee = new Employee(Convert.ToInt32(txtId.Text), txtFirstName.Text, txtLastName.Text, Convert.ToInt32(ddlPosition.SelectedValue));
                if (Employee.UpdateEmployee(employee, out string status))
                {
                    Response.Redirect("EmpDetails.aspx/?id=" + employee.id);
                }
                else
                {
                    error.Visible = true;
                    lblStatus.Text = status;
                }
            }
            catch
            {
                lblStatus.Text = "Not currently accessing a record to update";
            }
        }
    }
}