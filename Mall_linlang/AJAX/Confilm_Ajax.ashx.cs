using BLL;
using Common.Extension;
using Model.BusinessModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mall_linlang.AJAX
{
    /// <summary>
    /// Confilm_Ajax 的摘要说明
    /// </summary>
    public class Confilm_Ajax : Auth_Ajax
    {

        public override void ProcessRequest(HttpContext context)
        {

            string type = context.Request["type"];
           
            JsonResult json = null;
            switch (type)
            {
                case "getConfilm":

                    json = getConfilm(context);
                    break;
                default:
                    new JsonResult
                    {
                        Code = 10101010,
                        Message = "参数错误"
                    };
                    break;
            }

            //序列话对象成为json字符串
            string jsonStr = Newtonsoft.Json.JsonConvert.SerializeObject(json);
            //响应请求
            context.Response.ContentType = "Application/json;charset=utf-8;";
            context.Response.Write(jsonStr);
        }

        private JsonResult getConfilm(HttpContext context)
        {
            string cartsId = context.Request["cartsId"];           
            
            CartService service = new CartService();
            var list = service.ConfilmRead(cartsId);
            return new JsonResult
            {
                Code=0,
                Data=list


            };
        

        }
    }

     
    }
