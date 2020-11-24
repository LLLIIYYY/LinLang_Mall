using Common.Extension;
using Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Mall_linlang.AJAX
{
    /// <summary>
    /// Auth_Ajax 的摘要说明
    /// </summary>
    public class Auth_Ajax : IHttpHandler,IRequiresSessionState
    {

        //是否登陆
        protected bool IsAuthed { get; set; }

        //登录的用户信息
        protected UserEntity AuthUser { get; set; }
        public virtual void ProcessRequest(HttpContext context)
        {
            if (context.Session["LoginInfo"] != null && 
                !string.IsNullOrEmpty(context.Session["LoginInfo"].ToString()))
            {
                AuthUser = new UserEntity();
                IsAuthed = true;
                AuthUser.Id = Convert.ToInt32(context.Session["LoginInfo"]);
            }
            else
            {
                IsAuthed = false;

            }

          
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