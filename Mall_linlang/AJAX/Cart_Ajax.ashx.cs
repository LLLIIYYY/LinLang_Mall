using Common.Extension;
using Mall_linlang.AJAX;
using Model.BusinessModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BLL;
using Model.Entity;

namespace Mall_linlang.AJAX
{
    /// <summary>
    /// Cart_Ajax 的摘要说明
    /// </summary>
    public class Cart_Ajax :Auth_Ajax
    {

        public override void ProcessRequest(HttpContext context)
        {

            string type = context.Request["type"];
            base.ProcessRequest(context);

            JsonResult json = null;
            if (IsAuthed)
            {
                switch (type)
                {
                    case "ADD":
                        json = AddToCart(context);
                        break;
                    case "getAllByPage":
                        json = GetAllByPage(context);
                        break;
                    default:
                        json = new JsonResult
                        {
                            Code = 10101010,
                            Message = "参数错误"
                        };
                        break;
                }
            }
            else
            {
                json = new JsonResult
                {
                    Code = 10001,
                    Message = "未登录"
                };
            }

            //序列话对象成为json字符串
            string jsonStr = Newtonsoft.Json.JsonConvert.SerializeObject(json);
            //响应请求
            context.Response.ContentType = "Application/json;charset=utf-8;";
            context.Response.Write(jsonStr);


        }
        //将产品加入到购物车
        private JsonResult AddToCart(HttpContext context)
        {
            int ProductId = context.Request["ProductId"].ToInt();
            int ProdeuctCount= context.Request["ProductCount"].ToInt();
            CartService service = new CartService();
            CartEntity ca = new CartEntity();
            ca.ProductId = ProductId;
            ca.ProductCount = ProdeuctCount;
            ca.UserId = AuthUser.Id;

            bool success = service.Create(ca);
          
            if (success)
            {
                return new JsonResult
                {
                    Code = 0,
                    Message = "加入购物车成功"
                };

            }
            else
            {
                return new JsonResult
                {
                    Code=101,
                   Message = "加入购物车失败"
                };
            }

        }

        private JsonResult GetAllByPage(HttpContext context)
        {


            CartService service = new CartService();
            var list = service.Select(new CartEntity
            {
                UserId = AuthUser.Id,

            }, new Pageination
            {
                PageIndex = 1,
                PageSize = 10
            });
            return new JsonResult
            {
                Code = 0,
                Message = "查询成功",
                Data = list
            };

        }



    }
}