using EmmaLibrary;
using EmmaLibrary.SaleDatasetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Fish.Sales
{
    public partial class Sale2 : System.Web.UI.Page
    {
        static SaleDataset dsSale = new SaleDataset();
        protected void Page_Load(object sender, EventArgs e)
        {
            customerTableAdapter cust = new customerTableAdapter();
            cust.Fill(dsSale.customer);
            DataRow[] custRows = dsSale.customer.Select();
            foreach (DataRow r in custRows)
            {
                lbCustomer.Items.Add(r.ItemArray[1].ToString() + " - " + r.ItemArray[2].ToString());
            }
        }
    }
}