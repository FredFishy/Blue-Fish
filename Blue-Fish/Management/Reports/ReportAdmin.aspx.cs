using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmmaLibrary;
using EmmaLibrary.AdminSalesReportTableAdapters;

namespace Blue_Fish
{
    public partial class ReportAdmin : System.Web.UI.Page
    {
        static AdminSalesReport dsSales = new AdminSalesReport();

        static ReportAdmin()
        {
            SalesTableAdapter daSales = new SalesTableAdapter();
            try
            {
                DateTime begin = new DateTime(0001, 01, 01);
                DateTime end = new DateTime(9999, 01, 01);
                bool paid = new bool();
                int id = new int();
                daSales.Fill(dsSales.Sales, begin.ToString(), end.ToString(), paid, id.ToString());
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}