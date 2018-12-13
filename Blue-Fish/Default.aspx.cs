/*

    Created by:         Paul Vandyk
    Date:               2018-11-19
    Last modified by:   Nigel Girouard
    Date:               2018-12-13
    Description:        Home codebehind page

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Fish
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
                loggedIn.Visible = true;


            //if (!HttpContext.Current.User.Identity.IsAuthenticated)
            //{
            //    divCust.Visible = false;
            //    divSale.Visible = false;
            //    divInv.Visible = false;
            //    divOrder.Visible = false;
            //    divAdmin.Visible = false;
            //    divEmp.Visible = false;
            //}
            //else
            //{
            //    if (HttpContext.Current.User.Identity.Name == "emma@ese.com")
            //    {
            //        divCust.Visible = true;
            //        divSale.Visible = true;
            //        divInv.Visible = true;
            //        divOrder.Visible = true;
            //        divAdmin.Visible = true;
            //        divEmp.Visible = true;
            //    }
            //    else if (HttpContext.Current.User.Identity.Name == "ordering@ese.com")
            //    {
            //        divCust.Visible = true;
            //        divSale.Visible = true;
            //        divInv.Visible = true;
            //        divOrder.Visible = true;
            //        divAdmin.Visible = false;
            //        divEmp.Visible = false;
            //    }
            //    else if (HttpContext.Current.User.Identity.Name == "tech@ese.com")
            //    {
            //        divCust.Visible = true;
            //        divSale.Visible = true;
            //        divInv.Visible = true;
            //        divOrder.Visible = false;
            //        divAdmin.Visible = false;
            //        divEmp.Visible = false;
            //    }
            //    else if (HttpContext.Current.User.Identity.Name == "sales@ese.com")
            //    {
            //        divCust.Visible = true;
            //        divSale.Visible = true;
            //        divInv.Visible = true;
            //        divOrder.Visible = true;
            //        divAdmin.Visible = false;
            //        divEmp.Visible = false;
            //    }
            //    else
            //    {
            //        divCust.Visible = false;
            //        divSale.Visible = false;
            //        divInv.Visible = false;
            //        divOrder.Visible = false;
            //        divAdmin.Visible = false;
            //        divEmp.Visible = false;
            //    }
            //}
        }
    }
}