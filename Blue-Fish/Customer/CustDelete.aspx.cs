/*

    Created by:         Will Ashcroft
    Date:               2018-12-08
    Last modified by:   Will Ashcroft
    Date:               2018-12-13
    Description:        Sale Page

*/
using EmmaLibrary;
using EmmaLibrary.CustomerDatasetTableAdapters;
using System;
using System.Data;

namespace Blue_Fish
{
    public partial class CustDelete : System.Web.UI.Page
    {
        static CustomerDataset dsCust = new CustomerDataset();
        protected void Page_Load(object sender, EventArgs e)
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

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (Customer.DeleteCustomer(Convert.ToInt32(txtId.Text), out string status))
            {
                Response.Redirect("CustIndex.aspx");
            }
            else
            {
                error.Visible = true;
                lblStatus.Text = status;
            }
        }
    }
}