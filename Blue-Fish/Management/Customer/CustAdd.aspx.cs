using EmmaLibrary;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class CustAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Customer customer = new Customer(txtFirstName.Text, txtLastName.Text, txtPhoneNumber.Text, txtAddress.Text, txtCity.Text, txtPostalCode.Text, txtEmailAddress.Text);
            string status;
            int id;
            if(Customer.CreateCustomer(customer, out status, out id))
            {
                Response.Redirect("CustDetails.aspx/?id="+id);
            }
            else
            {
                error.Visible = true;
                lblStatus.Text = status;
            }
        }
    }
}