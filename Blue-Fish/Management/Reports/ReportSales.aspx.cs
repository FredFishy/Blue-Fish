using EmmaLibrary;
using EmmaLibrary.AdminSalesReportTableAdapters;
using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class ReportSales : System.Web.UI.Page
    {
        static AdminSalesReport dsSales = new AdminSalesReport();

        decimal netTotal;
        int netServices;
        int netProcucts;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PartyTableAdapter daParty = new PartyTableAdapter();
                SalesTableAdapter daCust = new SalesTableAdapter();
                try
                {
                    daParty.Fill(dsSales.Party);
                    daCust.Fill(dsSales.Sales);
                }
                catch { }

                foreach (DataRow r in dsSales.Sales)
                {
                    MakeTable(r);
                }
                CalcNetTotal();


                lblParty.Text = String.Format("{0:C}", dsSales.Party.Select().First().ItemArray[0]);
            }
        }

        protected void dsSearch_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string search = "";
            DateTime begin = new DateTime(0001, 01, 01);
            DateTime end = new DateTime(9999, 01, 01);
            if (txtStartDate.Text.Length != 0)
            {
                begin = DateTime.Parse(txtStartDate.Text);
            }
            if (txtEndDate.Text.Length != 0)
            {
                end = DateTime.Parse(txtEndDate.Text);
            }
            search += "(ordDate >= '" + begin.Date + "' AND ordDate <='" + end.Date + "')";
            if (ddlPaid.SelectedValue != "Either")
            {
                search += " AND ordPaid = " + ddlPaid.SelectedValue + "";
            }

            //Execute where clause
            DataRow[] rows = dsSales.Sales.Select(search);


            //display results
            foreach (DataRow r in rows)
            {
                MakeTable(r);
            }
            CalcNetTotal();
        }

        //Build the table rows and add them to the table
        private void MakeTable(DataRow r)
        {
            int recID = Convert.ToInt32(r.ItemArray[0]);
            int prods = 0;
            int servs = 0;
            prodCountTableAdapter prodCount = new prodCountTableAdapter();
            servCountTableAdapter servCount = new servCountTableAdapter();
            try
            {
                prodCount.Fill(dsSales.prodCount, recID);
                prods = Convert.ToInt32(dsSales.prodCount.Single().ItemArray[0]);
            }
            catch { }

            try
            {
                servCount.Fill(dsSales.servCount, recID);
                servs = Convert.ToInt32(dsSales.servCount.Single().ItemArray[0]);
            }
            catch { }

            TableRow row = new TableRow();

            TableCell orderNumber = new TableCell();
            TableCell date = new TableCell();
            TableCell paid = new TableCell();
            TableCell services = new TableCell();
            TableCell quantity = new TableCell();
            TableCell total = new TableCell();


            //assigning text values for table cells
            orderNumber.Text = r.ItemArray[1].ToString();
            date.Text = DateTime.Parse(r.ItemArray[2].ToString()).ToString("yyyy-MM-dd");
            paid.Text = r.ItemArray[3].ToString();
            services.Text = servs.ToString();
            quantity.Text = prods.ToString();
            total.Text = String.Format("{0:C}", r.ItemArray[4]);

            //Commit Cells to row
            row.Cells.Add(orderNumber);
            row.Cells.Add(date);
            row.Cells.Add(paid);
            row.Cells.Add(services);
            row.Cells.Add(quantity);
            row.Cells.Add(total);

            //Commit row to table
            table.Rows.Add(row);



            //Sum the totals that have been selected
            netTotal += Decimal.Parse(r.ItemArray[4].ToString());
            netServices += servs;
            netProcucts += prods;
        }

        private void CalcNetTotal()
        {
            TableRow summary = new TableRow();
            summary.Font.Bold = true;
            TableCell totalService = new TableCell();
            TableCell totalProduct = new TableCell();
            TableCell total = new TableCell();
            TableCell label = new TableCell();

            label.Text = "Net Totals";
            totalService.Text = netServices.ToString();
            totalProduct.Text = netProcucts.ToString();
            total.Text = String.Format("{0:C}", netTotal);


            summary.Cells.AddRange(new TableCell[] { label, new TableCell(), new TableCell(), totalService, totalProduct, total });
            table.Rows.Add(summary);
        }
    }
}