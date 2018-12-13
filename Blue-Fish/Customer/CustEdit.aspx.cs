using EmmaLibrary;
using EmmaLibrary.CustomerDatasetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class CustEdit : System.Web.UI.Page
    {
        static CustomerDataset dsCust = new CustomerDataset();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    CustomerDetailsTableAdapter daCust = new CustomerDetailsTableAdapter();
                    daCust.Fill(dsCust.CustomerDetails, Convert.ToInt32(Request.QueryString["id"]));
                    DataRow row = dsCust.CustomerDetails.Rows[0];
                    txtId.Text = row.ItemArray[0].ToString();
                    txtFirstName.Text = row.ItemArray[1].ToString();
                    txtLastName.Text = row.ItemArray[2].ToString();
                    txtPhoneNumber.Text = row.ItemArray[3].ToString();
                    txtAddress.Text = row.ItemArray[4].ToString();
                    txtCity.Text = row.ItemArray[5].ToString();
                    txtPostalCode.Text = row.ItemArray[6].ToString();
                    txtEmailAddress.Text = row.ItemArray[7].ToString();
                }
            catch { }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Customer customer = new Customer(Convert.ToInt32(txtId.Text), txtFirstName.Text, txtLastName.Text, txtPhoneNumber.Text, txtAddress.Text, txtCity.Text, txtPostalCode.Text, txtEmailAddress.Text);
                if (Customer.UpdateCustomer(customer, out string status))
                {
                    Response.Redirect("~/Customer/CustDetails.aspx/?id=" + customer.id);
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