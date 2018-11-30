using EmmaLibrary;
using EmmaLibrary.dsCustIndexTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class CustIndex : System.Web.UI.Page
    {
        static dsCustIndex dsCust = new dsCustIndex();

        static CustIndex()
        {
            customerTableAdapter daCust = new customerTableAdapter();
            try
            {
                daCust.Fill(dsCust.customer);
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack) return;
            {
                foreach (DataRow r in dsCust.customer)
                {
                    TableRow row = new TableRow();

                    TableCell name = new TableCell();
                    TableCell button1 = new TableCell();
                    TableCell button2 = new TableCell();
                    TableCell button3 = new TableCell();
                    TableCell number = new TableCell();

                    name.Text = r.ItemArray[6].ToString();
                    number.Text = r.ItemArray[1].ToString();
                    button1.Text =
                    "<a href='CustDetails.aspx' title='Details' class='btn btn-sm'>" +
                        "<svg style='width: 24px; height: 24px' viewBox='0 0 24 24'>" +
                            "<path fill='#000000' d='M7.5,15C8.63,15 9.82,15.26 11.09,15.77C12.35,16.29 13,16.95 13,17.77V20H2V17.77C2,16.95 2.65,16.29 3.91,15.77C5.18,15.26 6.38,15 7.5,15M13,13H22V15H13V13M13,9H22V11H13V9M13,5H22V7H13V5M7.5,8A2.5,2.5 0 0,1 10,10.5A2.5,2.5 0 0,1 7.5,13A2.5,2.5 0 0,1 5,10.5A2.5,2.5 0 0,1 7.5,8Z' />" +
                        "</svg>" +
                    "</a>";
                    button1.Style.Value = "width:20px";

                    button2.Text =
                    "<a href='CustEdit.aspx' title='Edit' class='btn btn-sm'>" +
                        "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                            "<path fill='#000000' d='M20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18,2.9 17.35,2.9 16.96,3.29L15.12,5.12L18.87,8.87M3,17.25V21H6.75L17.81,9.93L14.06,6.18L3,17.25Z' />" +
                        "</svg" +
                    "</a>";
                    button2.Style.Value = "width:20px";

                    button3.Text =
                    "<a href='CustDelete.aspx' title='Delete' class='btn btn-sm'>" +
                        "<svg style='width:24px;height:24px' viewBox='0 0 24 24'>" +
                            "<path fill='#000000' d='M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z' />" +
                        "</svg>" +
                    "</a>";
                    button3.Style.Value = "width:20px";

                    row.Cells.Add(name);
                    row.Cells.Add(number);
                    row.Cells.Add(button1);
                    row.Cells.Add(button2);
                    row.Cells.Add(button3);

                    tblCustomer.Rows.Add(row);
                }
            }
        }
    }
}