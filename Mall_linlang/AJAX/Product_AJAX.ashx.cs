using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BLL;
using Model.BusinessModel;
using Model.Entity;
using System.Web.SessionState;
using Common.Extension;
using System.IO;

namespace Mall_linlang.AJAX
{
    /// <summary>
    /// Product_AJAX 的摘要说明
    /// </summary>
    public class Product_AJAX : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string type = context.Request["type"];
            //string result = string.Empty;
            JsonResult json = new JsonResult();
            switch (type)
            {

                //查询
                case "get":

                    json = GetList(context);
                    break;
                //下拉框获取值
                case "sel":

                    json = sel(context);
                    break;
                default:
                    json.Code = 1001;
                    json.Message = "错误的请求";
                    break;
            }



            //序列话对象成为json字符串
            string jsonStr = Newtonsoft.Json.JsonConvert.SerializeObject(json);
            //响应请求
            context.Response.ContentType = "Application/json;charset=utf-8;";
            context.Response.Write(jsonStr);
        }


        //查询与全查询

        private JsonResult GetList(HttpContext context)
        {
            int pageIndex = context.Request["pageIndex"].ToInt(1);
            int pageSize = context.Request["pageSize"].ToInt(10);

            string Name = context.Request["Name"];
            int?id = context.Request["id"].ToNullable<int>();
            int? categoryId = context.Request["categoryId"].ToNullable<int>();
            int? subcategoryId = context.Request["subcategoryId"].ToNullable<int>();

            ProductEntity employee = new ProductEntity
            {

                Name = Name,
                CategoryId= (int)categoryId,
                SubCategoryId= (int)subcategoryId,
                Id= (int)id
            };
            Pageination pageentity = new Pageination
            {
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            ProductService service = new ProductService();
            List<ProductEntity> list = service.Select(employee, pageentity);
            JsonResult json = new JsonResult
            {
                Code = 0,
                Message = "查询成功",
                Data = new
                {
                    list = list,
                    pageentity = pageentity
                    
                }
            };
            return json;


        }
        //下拉框分类获取值
        private JsonResult sel(HttpContext context)
        {

            int parentId = context.Request["parentId"].ToInt(0);
            ProductCategoryService pros = new ProductCategoryService();
            JsonResult json = new JsonResult();
            json.Code = 0;
            json.Message = "chengg";
            json.Data = new
            {
                List = pros.Get(parentId)
            };
            return json;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}