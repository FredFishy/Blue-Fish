/*

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Nigel Girouard
    Date:               2018-12-08
    Description:        Order Details

*/

using EmmaLibrary;
using EmmaLibrary.OrderDatasetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class OrderingDetails : System.Web.UI.Page
    {
        static OrderDataset dsOrd = new OrderDataset();

        protected void Page_Load(object sender, EventArgs e)
        {
            btnDelete.PostBackUrl = "OrderingDelete.aspx/?id=" + Request.QueryString["id"];
            btnEdit.PostBackUrl = "OrderingEdit.aspx/?id=" + Request.QueryString["id"];

            try
            {

                OrderDetailsTableAdapter daOrd = new OrderDetailsTableAdapter();
                daOrd.Fill(dsOrd.OrderDetails, Convert.ToInt32(Request.QueryString["id"]));
                DataRow row = dsOrd.OrderDetails.Rows[0];

                txtNum.Text = row.ItemArray[1].ToString();
                txtDate.Text = ((DateTime)row.ItemArray[2]).ToShortDateString();
                txtPaid.Text = (bool)row.ItemArray[3] ? "Yes" : "No";
                txtArrive.Text = ((DateTime)row.ItemArray[4]).ToShortDateString();
            }
            catch
            {

            }
        }

        protected void btnArrived_Click(object sender, EventArgs e)
        {
            try
            { 
                string status;
                bool result;
                result = On_Order.ArrivedOn_Order(Convert.ToInt32(Request.QueryString["id"]), out status);
            }
            catch
            {

            }
        }
    }
}