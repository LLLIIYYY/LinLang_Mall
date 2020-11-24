using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

namespace Mall_linlang.Pages.Cart
{
    public partial class List : System.Web.UI.Page
    {
        protected List<Model.Entity.CartEntity> CartList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            CartService service = new CartService();



        }
    }
}