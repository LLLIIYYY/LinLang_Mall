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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string userName = Request["userName"];
                string Password = Request["Password"];
                string Password_cfr = Request["Password_cfm"];

                if (Password == Password_cfr)
                {
                    UserService service = new UserService();
                    UserEntity user = new UserEntity();
                    user.LoginId = userName;
                    user.LoginPWD = Password;

                    service.Create(user);
                }
            }
        }
    }
}