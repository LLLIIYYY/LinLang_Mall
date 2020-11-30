using Common.Extension;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model.Entity;
using BLL;

namespace Mall_linlang.Pages.Product
{
    public partial class Detail : System.Web.UI.Page
    {

        protected ProductEntity entity { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var Id = Request["id"].ToInt();

            ProductService serivce = new ProductService();
            entity = serivce.getSingle(Id);
        }
    }
}