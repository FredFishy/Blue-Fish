using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Owin.Security.Cookies;
using Microsoft.AspNet.Identity;
using Owin;
using Microsoft.Owin;



//namespace Blue_Fish
//{
//    public class Startup
//    {
//        public void Configuration(IAppBuilder app)
//        {
//            app.UseCookieAuthentication(new CookieAuthenticationOptions
//            {
//                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
//                CookieName = "MovieCookie",
//                LoginPath = new PathString("/LogIn"),
//                LogoutPath = new PathString("/LogIn"),
//                ExpireTimeSpan = System.TimeSpan.FromMinutes(5)
//            });

//        }
//    }
//}