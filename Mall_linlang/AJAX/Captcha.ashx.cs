using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using Common.Utils;

namespace Mall_linlang.AJAX
{
    /// <summary>
    /// Captcha 的摘要说明
    /// </summary>
    public class Captcha : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            CaptchaGenerator generator = new CaptchaGenerator();

            //创建二维码
            string captcha = generator.CreateValidateCode(6);
            //把验证码记录在服务器的session中
            context.Session["captcha"] = captcha;
            //将二维码绘制成图片
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