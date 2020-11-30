using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model.Entity;
using Model.BusinessModel;

namespace Mall_linlang.Pages.Cart
{
    public partial class Confirm : AuthPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //用户想要购买的购物车条目信息
                HttpCookie cookie= Request.Cookies.Get("confilmInfo");

                string cookieInfo = HttpUtility.UrlDecode(cookie.Value);
                //反序列话json字符串
                OrderEntity confilmInfos = Newtonsoft.Json.JsonConvert.DeserializeObject<OrderEntity>(cookieInfo);

                //留言
                string mag = Request["message"];

                //当前登陆的用户
                int userId =(int) AuthUser.Id;
                if (confilmInfos.Source=="cart")
                {
                    //创建订单
                    OrderEntity entity = new OrderEntity
                    {
                        UserId = userId,
                        Remark = mag,
                        cartsId = confilmInfos.cartsId
                    };
                    OrderServices service = new OrderServices();
                    service.Create(entity);
                    


                }
                else
                {



                    //创建订单
                    OrderEntity entity = new OrderEntity
                    {
                        UserId = userId,
                        Remark = mag,
                        Count = confilmInfos.Count,
                        ProId = confilmInfos.ProId
                    };
                    OrderServices service = new OrderServices();
                    service.Create2(entity);
                    //直接生成订单
                    Response.Write("<script type='text/javascript'>alert('购买成功！');</script>");
                }
              
            

            }
        }
    }
}