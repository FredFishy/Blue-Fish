/*

    Created by:         Paul Vandyk
    Date:               2018-11-19
    Last modified by:   Paul Vandyk
    Date:               2018-11-19
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

        }
    }
}