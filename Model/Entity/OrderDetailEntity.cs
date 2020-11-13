using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class OrderDetailEntity
    {
        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 订单Id
        /// </summary>
        public int OrderId { get; set; }
        /// <summary>
        /// 商品ID
        /// </summary>
        public int ProductId { get; set; }
        /// <summary>
        /// 单价
        /// </summary>
        public SqlMoney Price { get; set; }
        /// <summary>
        /// 数量
        /// </summary>
        public int ProductCount { get; set; }
        /// <summary>
        /// 金额
        /// </summary>
        public SqlMoney Amount { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreatedTime { get; set; }
        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime? ModifiedTime { get; set; }
    }
}
