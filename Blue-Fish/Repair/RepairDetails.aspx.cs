/*

    Created by:         Nigel Girouard
    Date:               2018-12-08
    Last modified by:   Nigel Girouard
    Date:               2018-12-09
    Description:        Inventory Details

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class RepairDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnDelete.PostBackUrl = "InventoryDelete.aspx/?id=" + Request.QueryString["id"];
            btnEdit.PostBackUrl = "InventoryEdit.aspx/?id=" + Request.QueryString["id"];
        }
    }
}