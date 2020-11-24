using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.BusinessModel;
using BLL;
using Model.Entity;
using System.Web.SessionState;

namespace Mall_linlang.Ajax
{
    /// <summary>
    /// ProductCategory 的摘要说明
    /// </summary>
    public class ProductCategory : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string type = context.Request["type"];

            JsonResult json = new JsonResult();
            switch (type)
            {
                case "Add":
                    //注册操作
                    json = Add(context);
                    break;
                case "GetAllByPage":
                    json = GetAllByPage(context);
                    break;
                case "Update":
                    json = Update(context);
                    break;
                case "Delete":
                    json = Delete(context);
                    break;
                default:
                    //错误请求
                    json.Code = 406;
                    json.Message = "错误的请求";
                    break;
            }
            //序列化对象成为JSON字符串
            string jsonStr = Newtonsoft.Json.JsonConvert.SerializeObject(json);

            //响应请求
            context.Response.ContentType = "application/json;charset=utf-8";
            context.Response.Write(jsonStr);
        }
        public JsonResult Add(HttpContext context)
        {
            ProductCategoryEntity productCategoryEntity = new ProductCategoryEntity()
            {
                Category = context.Request["Category"],
                Remark = context.Request["Remark"],
                Summary = context.Request["Summary"],
                ParentId = Convert.ToInt32(context.Request["ParentId"]),
                IsRecommend = false,
            };

            JsonResult json = null;
            ProductCategoryService service = new ProductCategoryService();
            bool success = service.Create(productCategoryEntity);
            json = new JsonResult
            {
                Code = success ? 0 : 10002,
                Message = success ? "注册成功" : "注册失败:用户名已被注册"
            };
            return json;
        }

        public JsonResult GetAllByPage(HttpContext context)
        {
            int pageIndex = 0;
            int pageSize = 10;
            if (context.Request["pageIndex"] != null)
                pageIndex = Convert.ToInt32(context.Request["pageIndex"]);
            if (context.Request["pageSize"] != null)
                pageSize = Convert.ToInt32(context.Request["pageSize"]);
            return new JsonResult()
            {
                Code = 200,
                Data = new ProductCategoryService().GetAllByPage(pageIndex, pageSize, null, context.Request["Category"], Convert.ToInt32(context.Request["ParentId"])),
                Message = "获取成功"
            };
        }

        public JsonResult Update(HttpContext context)
        {
            int Id = -1;
            if (context.Request["Id"] != null)
                Id = Convert.ToInt32(context.Request["Id"]);
            if (Id < 1)
                return new JsonResult()
                {
                    Code = 400,
                    Message = "修改失败, ID无效!"
                };

            ProductCategoryEntity productCategoryEntity = new ProductCategoryEntity()
            {
                Id = Convert.ToInt32(context.Request["Id"]),
                Category = context.Request["Category"],
                Remark = context.Request["Remark"],
                Summary = context.Request["Summary"],
                ParentId = Convert.ToInt32(context.Request["ParentId"]),
                IsRecommend = Convert.ToBoolean(context.Request["IsRecommend"]),
            };
            bool res = new ProductCategoryService().Update(productCategoryEntity);
            return new JsonResult()
            {
                Code = res ? 200 : 400,
                Message = res ? "修改成功" : "修改失败"
            };
        }

        public JsonResult Delete(HttpContext context)
        {
            int Id = -1;
            if (context.Request["Id"] != null)
                Id = Convert.ToInt32(context.Request["Id"]);
            if (Id < 1)
                return new JsonResult()
                {
                    Code = 400,
                    Message = "修改失败, ID无效!"
                };

            ProductCategoryEntity productCategoryEntity = new ProductCategoryEntity()
            {
                Id = Id,
                Deleted = true,
            };
            bool res = new ProductCategoryService().Update(productCategoryEntity);
            return new JsonResult()
            {
                Code = res ? 200 : 400,
                Message = res ? "修改成功" : "修改失败"
            };
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