using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Common.Utils;
using System.Web.SessionState;

namespace Mall_linlang.AJAX
{
    /// <summary>
    /// verification_code 的摘要说明
    /// </summary>
    public class verification_code : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            
            CaptchaGenerator generator = new CaptchaGenerator();
            //创建验证码
            string captcha = generator.CreateValidateCode(6);
            //将验证码及记录在服务器的session中
            context.Session["captcha"] = captcha;
            //将验证码绘制成为图片
            generator.CreateValidateGraphic(captcha, context);
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