using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class WalletBillingEntity
    {
        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 用户Id
        /// </summary>
        public int UserId { get; set; }
        /// <summary>
        /// 账目类型，枚举：充值、消费
        /// </summary>
        public int BillingType { get; set; }
        /// <summary>
        /// 账目金额
        /// </summary>
        public SqlMoney Billing { get; set; }
        /// <summary>
        /// 订单ID，如果是订单消费则存储
        /// </summary>
        public int? OrderId { get; set; }
        /// <summary>
        /// 账目产生时间
        /// </summary>
        public DateTime CreateTime { get; set; }
    }
}
