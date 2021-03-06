﻿/*

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Paul Vandyk
    Date:               2018-12-12
    Description:        Repair Details

*/

using EmmaLibrary;
using EmmaLibrary.RepairDataSetTableAdapters;
using System;
using System.Data;
using System.Linq;

namespace Blue_Fish
{
    public partial class RepairDetails : System.Web.UI.Page
    {

        static RepairDataSet dsRepair = new RepairDataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.QueryString["id"]))
            {

            }
            try
            {
                detailServiceOrderTableAdapter daRepair = new detailServiceOrderTableAdapter();
                daRepair.Fill(dsRepair.detailServiceOrder, Convert.ToInt32(Request.QueryString["id"]));
                DataRow row = dsRepair.detailServiceOrder.Select().Single();
                txtDateIn.Text = row.ItemArray[1].ToString();
                txtDateOut.Text = row.ItemArray[2].ToString();
                if (txtDateOut.Text.StartsWith("0001"))
                {
                    txtDateOut.Text = "Job is incomplete";
                }
                txtEquipment.Text = row.ItemArray[12].ToString();
                txtIssue.Text = row.ItemArray[3].ToString();
                txtWarranty.Text = row.ItemArray[4].ToString();
                txtServiceID.Text = row.ItemArray[9].ToString();



            }
            catch { }
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            KENDELL.Visible = true;
        }
    }
}