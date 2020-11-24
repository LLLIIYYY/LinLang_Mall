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
    /// Employee 的摘要说明
    /// </summary>
    public class Employee : IHttpHandler, IRequiresSessionState
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
                case "GetAll":
                    json = GetAll();
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
            context.Response.ContentType = "application/json;charset=utf-8";
            context.Response.Write(jsonStr);
        }
        public JsonResult Add(HttpContext context)
        {
            string Name = context.Request["Name"];
            int Gender = Convert.ToInt32(context.Request["Gender"]);
            string Email = context.Request["Email"];
            string PhoneNumber = context.Request["PhoneNumber"];
            string LoginId = context.Request["LoginId"];
            string loginPWD = context.Request["loginPWD"];


            JsonResult json = null;
            if (Name.Length < 2 || Name.Length > 6)
            {
                json = new JsonResult
                {
                    Code = 10002,
                    Message = "注册失败：用户名的长度必须在二到六位之间",
                };
            }
            else if (LoginId.Length < 6 || LoginId.Length > 12)
            {
                json = new JsonResult
                {
                    Code = 10002,
                    Message = "注册失败:ID的长度必须在六到十二位之间",
                };
            }
            else if (loginPWD.Length < 6 || loginPWD.Length > 12)
            {
                json = new JsonResult
                {
                    Code = 10002,
                    Message = "注册失败:密码的长度必须在六到十二位之间",
                };
            }
            else//全部的验证都通过之后，执行插入数据的操作
            {
                EmployeeService service = new EmployeeService();
                EmployeeEntity Employee = new EmployeeEntity();
                Employee.Name = Name;
                Employee.Gender = Gender;
                Employee.Email = Email;
                Employee.PhoneNumber = PhoneNumber;
                Employee.LoginId = LoginId;
                Employee.LoginPWD = loginPWD;

                bool success = service.Create(Employee);
                json = new JsonResult
                {
                    Code = success ? 0 : 10002,
                    Message = success ? "注册成功" : "注册失败:用户名已被注册"
                };
            }

            return json;
        }

        public JsonResult GetAll()
        {
            return new JsonResult()
            {
                Code = 200,
                Data = new EmployeeService().GetAll(),
                Message = "获取成功"
            };
        }
        public JsonResult GetAllByPage(HttpContext context)
        {
            int pageIndex = 0;
            int pageSize = 10;
            int Gender = 0;
            if (context.Request["pageIndex"]!=null)
                pageIndex = Convert.ToInt32(context.Request["pageIndex"]);
            if (context.Request["pageSize"] !=null)
                pageSize = Convert.ToInt32(context.Request["pageSize"]);
            if (context.Request["Gender"] !=null)
                Gender = Convert.ToInt32(context.Request["Gender"]);
            return new JsonResult()
            {
                Code = 200,
                Data = new EmployeeService().GetAllByPage(pageIndex, pageSize, Convert.ToString(context.Request["Name"]), Gender),
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
            
            bool res = new EmployeeService().Update(new EmployeeEntity() {
                Id=Id,
                Name = Convert.ToString(context.Request["Name"]),
                Email = Convert.ToString(context.Request["Email"]),
                PhoneNumber = Convert.ToString(context.Request["PhoneNumber"]),
                Gender = Convert.ToInt32(context.Request["Gender"]),
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
            bool res = new EmployeeService().Delete(Id);
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