using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Model.Entity;

namespace Mall_linlang
{
    public partial class _Default : Page
    {
        protected string UserNickName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginInfo"] != null && string.IsNullOrEmpty(Session["LoginInfo"].ToString()))
            {
                UserEntity user = Session["LoginInfo"] as UserEntity;

                UserNickName = UserNickName;
            }
        }
    }
}