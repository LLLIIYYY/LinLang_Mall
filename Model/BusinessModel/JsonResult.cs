using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.BusinessModel
{
    public class JsonResult
    {
        /// <summary>
        /// 返回的 结果代码
        /// </summary>
        public int Code { get; set; }
        /// <summary>
        /// 返回的消息
        /// </summary>
        public string Message { get; set; }
        /// <summary>
        /// 返回的数据
        /// </summary>
        public object Data { get; set; }
    }
}
