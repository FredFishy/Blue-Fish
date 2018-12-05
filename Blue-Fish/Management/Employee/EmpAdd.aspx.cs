using EmmaLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                lblStatus.Text = status;
            }
        }
    }
}