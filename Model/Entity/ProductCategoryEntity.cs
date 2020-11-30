using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class ProductCategoryEntity
    {
        

        public ProductCategoryEntity() { }

        public ProductCategoryEntity(SqlDataReader sqlDataReader)
        {
            this.Id = Convert.ToInt32(sqlDataReader["Id"]);
            this.Category = sqlDataReader["Category"].ToString();
            this.ParentId = Convert.ToInt32(sqlDataReader["ParentId"]);
            this.Summary = sqlDataReader["Summary"].ToString();
            this.Remark = sqlDataReader["Remark"].ToString();
            this.IsRecommend= Convert.ToBoolean(sqlDataReader["IsRecommend"]);
            this.Deleted = Convert.ToBoolean(sqlDataReader["Deleted"]);
            this.CreatedTime = Convert.ToDateTime(sqlDataReader["CreatedTime"]);
            this.ModifiedTime = Convert.ToDateTime(sqlDataReader["ModifiedTime"]);
            string pc = Convert.ToString(sqlDataReader["ParentCategory"]);
            this.ParentCategory = pc.Length>0?pc:"无";
        }

        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 父Id,没有为0
        /// </summary>
        public int ParentId { get; set; }
        /// <summary>
        /// 类别名
        /// </summary>
        public string Category { get; set; }
        public string ParentCategory { get; set; }
        /// <summary>
        /// 简介
        /// </summary>
        public string Summary { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreatedTime { get; set; }
        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime? ModifiedTime { get; set; }
        /// <summary>
        /// 是否推荐该分类
        /// </summary>
        public bool IsRecommend { get; set; }
        /// <summary>
        /// 是否已删除
        /// </summary>
        public bool? Deleted { get; set; }

    }
}
