using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class OrderEntity
    {
        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 订单编号
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 用户ID
        /// </summary>
        public int IUserIdd { get; set; }
        /// <summary>
        /// 订单金额
        /// </summary>
        public SqlMoney Amount { get; set; }
        /// <summary>
        /// 用户地址Id
        /// </summary>
        public int AddressId { get; set; }
        /// <summary>
        /// 订单状态;枚举：待付款、已付款、待收货、待评论、已完成、已关闭
        /// </summary>
        public int Status { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }
        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime? ModifiedTime { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
    }
}
