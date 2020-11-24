using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.BusinessModel;
using BLL;
using Model.Entity;
using System.Web.SessionState;
using System.IO;

namespace Mall_linlang.Ajax
{
    /// <summary>
    /// Product 的摘要说明
    /// </summary>
    public class Product : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string type = context.Request["type"];
            JsonResult json = null;
            context.Response.ContentType = "application/json;charset=utf-8";
            try
            {
                switch (type)
                {
                    case "Add":
                        json = Add(context);
                        break;
                    case "GetById":
                        json = GetById(context);
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
                        json.Code = 1002;
                        json.Message = "错误的请求";
                        break;
                }
                //序列化对象成为JSON字符串
                string jsonStr = Newtonsoft.Json.JsonConvert.SerializeObject(json);

                //响应请求
                context.Response.Write(jsonStr);
            }
            catch (Exception e)
            {
                context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(new JsonResult
                {
                    Code = 406,
                    Message = "错误的请求, 错误信息:" + e.Message
                }));
            }
        }

        public JsonResult GetById(HttpContext context)
        {

            List<Product> lists = ((List<Product>)new ProductService().GetAllByPage(1, 1, "", null, null, Convert.ToInt32(context.Request["Id"]))["lists"]);
            return new JsonResult() {
                Code = 200,
                Data = lists.Count>0?lists[0]:null,
                Message = "获取成功"
            };
        }
        private string save_img(HttpContext context)
        {
            try
            {
                string upLoadDir = context.Server.MapPath("/upload");
                string fileName = context.Request.Files[0].FileName;
                string ext = fileName.Substring(fileName.LastIndexOf('.'));
                if (File.Exists(context.Server.MapPath("\\upload\\"+fileName+ fileName))) return null;
                string uploadName = "";
                if (!Directory.Exists(upLoadDir)) Directory.CreateDirectory(upLoadDir);
                if (context.Request.Files.Count > 0)
                {

                    uploadName = Guid.NewGuid().ToString() + ext;
                    HttpFileCollection files = context.Request.Files;
                    context.Request.Files[0].SaveAs(Path.Combine(upLoadDir, uploadName));
                }
                return uploadName;
            }
            catch (Exception ee)
            {
                return null;

            }
        }
        public JsonResult Add(HttpContext context)
        {
            string uploadName = save_img(context);
            if (uploadName!=null)
                return new JsonResult
                {
                        Code = 406,
                    Message = "错误的文件上传",
                    Data = null
                };
            bool success = new ProductService().Create(new ProductEntity() {
                CategoryId = Convert.ToInt32(context.Request["CategoryId"]),
                SubCategoryId  = Convert.ToInt32(context.Request["SubCategoryId"]),
                Name = Convert.ToString(context.Request["Name"]),
                Summary = Convert.ToString(context.Request["Summary"]),
                Picture = uploadName,
                Price = Convert.ToInt32(context.Request["Price"]),
                OnSale = Convert.ToBoolean(context.Request["OnSale"]),
                Description = Convert.ToString(context.Request["Description"]),
                ActualStock = Convert.ToInt32(context.Request["ActualStock"]),
                AvailableStock = Convert.ToInt32(context.Request["AvailableStock"]),
                HoldingStock = Convert.ToInt32(context.Request["HoldingStock"]),
                IsRecommend = Convert.ToBoolean(context.Request["IsRecommend"]),
            });
            return new JsonResult
            {
                Code = success ? 0 : 10002,
                Message = success ? "添加成功" : "添加失败"
            };
        }
        public JsonResult GetAllByPage(HttpContext context)
        {
            int pageIndex = 1;
            int pageSize = 10;
            int CategoryId = -1;
            int SubCategoryId = -1;
            if (context.Request["pageIndex"]!=null)
                pageIndex = Convert.ToInt32(context.Request["pageIndex"]);
            if (context.Request["pageSize"] !=null)
                pageSize = Convert.ToInt32(context.Request["pageSize"]);
            if (context.Request["SubCategoryId"] !=null)
                SubCategoryId = Convert.ToInt32(context.Request["SubCategoryId"]);
            if (context.Request["CategoryId"] !=null)
                CategoryId = Convert.ToInt32(context.Request["CategoryId"]);
            return new JsonResult()
            {
                Code = 200,
                Data = new ProductService().GetAllByPage(pageIndex, pageSize, context.Request["Name"], CategoryId, SubCategoryId, null),
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
            string uploadName = null;
            if (context.Request.Files.Count > 0)
                uploadName = save_img(context);
            
            bool res = new ProductService().Update(new ProductEntity() {
                Id=Id,
                CategoryId = Convert.ToInt32(context.Request["CategoryId"]),
                SubCategoryId = Convert.ToInt32(context.Request["SubCategoryId"]),
                Name = Convert.ToString(context.Request["Name"]),
                Summary = Convert.ToString(context.Request["Summary"]),
                Picture = uploadName,
                Price = Convert.ToInt32(context.Request["Price"]),
                OnSale = Convert.ToBoolean(context.Request["OnSale"]),
                Description = Convert.ToString(context.Request["Description"]),
                ActualStock = Convert.ToInt32(context.Request["ActualStock"]),
                AvailableStock = Convert.ToInt32(context.Request["AvailableStock"]),
                HoldingStock = Convert.ToInt32(context.Request["HoldingStock"]),
                IsRecommend = Convert.ToBoolean(context.Request["IsRecommend"]),
                Deleted = Convert.ToBoolean(context.Request["Deleted"]),
            });
            return new JsonResult()
            {
                Code = res?200: 400,
                Message = res ? "修改成功" : "修改失败"
            };
        }

        public JsonResult Delete(HttpContext context)
        {
            int Id = -1;
            if (context.Request["Id"] != null)
                Id = Convert.ToInt32(context.Request["Id"]);
            if(Id<1)
                return new JsonResult()
                {
                    Code = 400,
                    Message = "删除失败, ID无效!"
                };
            bool res = new ProductService().Update(new ProductEntity()
            {
                Id = Id,
                Deleted = true
            }) ;
            return new JsonResult()
            {
                Code = res ? 200: 400,
                Message = res?"删除成功":"删除失败"
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