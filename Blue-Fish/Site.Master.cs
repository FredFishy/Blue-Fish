/*

    Last modified by:   Nigel Girouard
    Date:               2018-12-12
    Description:        Header 

*/
    
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace Blue_Fish
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!HttpContext.Current.User.Identity.IsAuthenticated)
            //{
            //    registerLink.Visible = true;
            //    linkCustomer.Visible = false;
            //    linkSales.Visible = false;
            //    linkInventory.Visible = false;
            //    linkOrdering.Visible = false;
            //    linkRepair.Visible = false;
            //    linkDDLManagment.Visible = false;
            //}
            //else
            //{
            //    registerLink.Visible = false;
            //    if (HttpContext.Current.User.Identity.Name == "emma@ese.com")
            //    {
            //        linkCustomer.Visible = true;
            //        linkSales.Visible = true;
            //        linkInventory.Visible = true;
            //        linkOrdering.Visible = true;
            //        linkRepair.Visible = true;
            //        linkDDLManagment.Visible = true;
            //    }
            //    else if (HttpContext.Current.User.Identity.Name == "ordering@ese.com")
            //    {
            //        linkCustomer.Visible = true;
            //        linkSales.Visible = true;
            //        linkInventory.Visible = true;
            //        linkOrdering.Visible = true;
            //        linkRepair.Visible = true;
            //        linkDDLManagment.Visible = false;
            //    }
            //    else if (HttpContext.Current.User.Identity.Name == "tech@ese.com")
            //    {
            //        linkCustomer.Visible = true;
            //        linkSales.Visible = true;
            //        linkInventory.Visible = true;
            //        linkOrdering.Visible = false;
            //        linkRepair.Visible = true;
            //        linkDDLManagment.Visible = false;
            //    }
            //    else if (HttpContext.Current.User.Identity.Name == "sales@ese.com")
            //    {
            //        linkCustomer.Visible = true;
            //        linkSales.Visible = true;
            //        linkInventory.Visible = true;
            //        linkOrdering.Visible = true;
            //        linkRepair.Visible = true;
            //        linkDDLManagment.Visible = false;
            //    }
            //    else
            //    {
            //        linkCustomer.Visible = false;
            //        linkSales.Visible = false;
            //        linkInventory.Visible = false;
            //        linkOrdering.Visible = false;
            //        linkRepair.Visible = false;
            //        linkDDLManagment.Visible = false;
            //    }
            //}
        }

        protected void loginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            authenticationManager.SignOut();

            Response.Redirect("~/Login.aspx");
        }
    }
}