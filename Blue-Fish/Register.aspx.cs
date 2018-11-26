using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Blue_Fish
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);
            IdentityUser user = new IdentityUser(username.Text);
            if(password1.Text == password2.Text)
            {
                IdentityResult idResult = manager.Create(user, password1.Text);

                if (idResult.Succeeded)
                {
                    lblMessage.Text = "User " + user.UserName + " was created successfully!";
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                    var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                    authenticationManager.SignIn(userIdentity);
                    toLanding.Visible = true;
                }
                else
                {
                    lblMessage.Text = idResult.Errors.FirstOrDefault();
                }
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Your Passwords do not match";
            }


            
        }
    }
}