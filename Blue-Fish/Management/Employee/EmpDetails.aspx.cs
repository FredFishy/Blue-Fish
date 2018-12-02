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
    public partial class EmpDetails : System.Web.UI.Page
    {
        static EmployeeDataset dsEmp = new EmployeeDataset();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                EmployeeDetailsTableAdapter daEmp = new EmployeeDetailsTableAdapter();
                //Grab data by id
                daEmp.Fill(dsEmp.EmployeeDetails, Convert.ToInt32(Request.QueryString["id"]));
                DataRow row = dsEmp.EmployeeDetails.Rows[0];
                //Fill in data
                txtFirstName.Text = row.ItemArray[1].ToString();
                txtLastName.Text = row.ItemArray[2].ToString();
                txtPosition.Text = row.ItemArray[4].ToString();
            }
            catch { }
        }
    }
}