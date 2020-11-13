using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.BusinessModel;
using BLL;
using Model.Entity;
using System.Web.SessionState;

namespace Mall_linlang.AJAX
{
    /// <summary>
    /// User 的摘要说明
    /// </summary>
    public class User : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string type = context.Request["type"];

            JsonResult json = new JsonResult();
            switch (type)
            {
                case "Login":
                    //登陆操作
                    json = Login(context);
                    break;
                case "Register":
                    //注册操作
                    json = Register(context);
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
            context.Response.ContentType = "Appliction/json:charset:utf-8";
            context.Response.Write(jsonStr);
        }
        private JsonResult Login(HttpContext context)
        {
            string LoginId = context.Request["loginId"];
            string LoginPWD = context.Request["loginPWD"];

            UserService service = new UserService();
            UserEntity user = service.Login(LoginId, LoginPWD);

            UserEntity user1 = service.Login(LoginId, LoginPWD);
            JsonResult json = null;
            if (user != null)
            {
                context.Session["LoginInfo"] = LoginId;
                json = new JsonResult
                {
                    Code = 0,
                    Message = "登陆成功",
                };
            }
            else
            {
                json = new JsonResult
                {
                    Code = 0,
                    Message = "登录失败",
                };
            }
            return json;
        }
        public JsonResult Register(HttpContext context)
        {
            string userName = context.Request["loginId"];
            string Password = context.Request["loginPWD"];
            string Password_cfr = context.Request["loginPWD_cfm"];
            string captcha = context.Request["captcha"];
            string captcha_server = context.Session["captcha"].ToString();


            JsonResult json = null;
            if (captcha != captcha_server)
            {
                json = new JsonResult
                {
                    Code = 10002,
                    Message = "注册失败：验证码错误",
                };
            }
            else if (userName.Length <6 || userName.Length > 12)
            {
                json = new JsonResult
                {
                    Code = 10002,
                    Message = "注册失败：用户名的长度必须在六到十二位之间",
                };
            }
            else if (Password.Length < 6 || Password.Length > 12)
            {
                json = new JsonResult
                {
                    Code = 10002,
                    Message = "注册失败:密码的长度必须在六到十二位之间",
                };
            }
            else if (Password != Password_cfr)
            {
                json = new JsonResult
                {
                    Code = 10002,
                    Message = "注册失败:两次密码不一致",
                };
            }
            else//全部的验证都通过之后，执行插入数据的操作
            {
                UserService service = new UserService();
                UserEntity user = new UserEntity();
                user.LoginId = userName;
                user.LoginPWD = Password;

                bool success = service.Create(user);
                json = new JsonResult
                {
                    Code = success ? 0 : 10002,
                    Message = success ? "注册成功" : "注册失败:用户名已被注册"
                };
            }

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