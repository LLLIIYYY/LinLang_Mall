using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class InventoryEntity
    {
        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 商品ID
        /// </summary>
        public int ProductId { get; set; }
        /// <summary>
        /// 库存变更动作；枚举：入库，占用，出库等
        /// </summary>
        public int InventoryAction { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreatedTime { get; set; }
        /// <summary>
        /// 订单Id（如果库存变更和订单有关则记录）
        /// </summary>
        public int? OrderId { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
    }
}
