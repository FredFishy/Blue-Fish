/*

    Created by:         Will Ashcroft
    Date:               2018-12-08
    Last modified by:   Will Ashcroft
    Date:               2018-12-13
    Description:        Sale Page

*/
using EmmaLibrary;
using System;

namespace Blue_Fish
{
    public partial class EmpAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Employee employee = new Employee(txtFirstName.Text, txtLastName.Text, Convert.ToInt32(ddlPosition.SelectedValue));
            string status;
            int id;
            if (Employee.CreateEmployee(employee, out status, out id))
            {
                Response.Redirect("EmpDetails.aspx/?id=" + id);
            }
            else
            {
                error.Visible = true;
                lblStatus.Text = status;
            }
        }
    }
}