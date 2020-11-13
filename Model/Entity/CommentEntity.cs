using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class CommentEntity
    {
        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 回复的评论Id
        /// </summary>
        public int? ReplyToId { get; set; }
        /// <summary>
        /// 商品Id
        /// </summary>
        public int ProductId { get; set; }
        /// <summary>
        /// 订单Id
        /// </summary>
        public int OrderId { get; set; }
        /// <summary>
        /// 分数
        /// </summary>
        public int Point { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 用户Id
        /// </summary>
        public int? UserId { get; set; }
        /// <summary>
        /// 员工Id
        /// </summary>
        public int? EmployeeId { get; set; }
        /// <summary>
        /// 评论时间
        /// </summary>
        public DateTime CreatedTime { get; set; }
    }
}
