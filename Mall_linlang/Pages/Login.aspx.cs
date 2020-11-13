using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model.Entity;

namespace Mall_linlang.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginInfo"] != null && string.IsNullOrEmpty(Session["LoginInfo"].ToString()))
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}