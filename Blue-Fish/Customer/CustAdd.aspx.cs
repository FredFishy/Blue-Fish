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
            if (Customer.CreateCustomer(customer, out status, out id))
            {
                Response.Redirect("CustDetails.aspx/?id=" + id);
            }
            else
            {
                error.Visible = true;
                lblStatus.Text = status;
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustIndex.aspx");
        }
    }
}