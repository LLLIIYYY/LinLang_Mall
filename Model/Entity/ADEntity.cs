using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class ADEntity
    {
        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 广告位名字
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 点击广告跳转的链接
        /// </summary>
        public string RedirectUrl { get; set; }
        /// <summary>
        /// 广告是否过期
        /// </summary>
        public bool IsDeleted { get; set; }
        /// <summary>
        /// 创建的时间
        /// </summary>
        public DateTime CreatedTime { get; set; }
        /// <summary>
        /// 广告图片的地址
        /// </summary>
        public string AdImageUrl { get; set; }
    }
}
