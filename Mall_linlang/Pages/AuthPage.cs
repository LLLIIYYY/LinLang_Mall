using Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mall_linlang
{
    public class AuthPage:System.Web.UI.Page
    {
   
        protected User AuthUser { get; set; }

        protected override void OnPreLoad(EventArgs e)
        {
            base.OnPreLoad(e);

            if (Session["loginInfo"] != null &&
            !string.IsNullOrEmpty(Session["loginInfo"].ToString()))
            {
            
                AuthUser = Session["loginInfo"] as User;
            }
            else
            {
                Response.Redirect("/Pages/Login");

            }
        }
    }
}