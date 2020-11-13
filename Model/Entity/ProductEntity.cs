using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class ProductEntity { 
        public ProductEntity()
        {
        }

        public ProductEntity(SqlDataReader sqlDataReader)
        {
            this.Id = Convert.ToInt32(sqlDataReader["Id"]);
            this.CategoryId = Convert.ToInt32(sqlDataReader["CategoryId"]);
            this.SubCategoryId = Convert.ToInt32(sqlDataReader["SubCategoryId"]);
            this.Name = Convert.ToString(sqlDataReader["Name"]);
            this.Picture = Convert.ToString(sqlDataReader["Picture"]);
            this.Price = Convert.ToInt32(sqlDataReader["Price"]);
            this.OnSale = Convert.ToBoolean(sqlDataReader["OnSale"]);
            this.Description = Convert.ToString(sqlDataReader["Description"]);
            this.ActualStock = Convert.ToInt32(sqlDataReader["ActualStock"]);
            this.AvailableStock = Convert.ToInt32(sqlDataReader["AvailableStock"]);
            this.HoldingStock = Convert.ToInt32(sqlDataReader["HoldingStock"]);
            this.Summary = Convert.ToString(sqlDataReader["Summary"]);
            this.IsRecommend = Convert.ToBoolean(sqlDataReader["IsRecommend"]);
            this.Deleted = Convert.ToBoolean(sqlDataReader["Deleted"]);
            this.CreatedTime = Convert.ToDateTime(sqlDataReader["CreatedTime"]);
            this.ModifiedTime = Convert.ToDateTime(sqlDataReader["ModifiedTime"]);
            this.ParentCategory = Convert.ToString(sqlDataReader["ParentCategory"]);
            this.SubCategory = Convert.ToString(sqlDataReader["SubCategory"]);
        }

        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 类别ID
        /// </summary>
        public int CategoryId { get; set; }
        /// <summary>
        /// 子类别ID
        /// </summary>
        public int SubCategoryId { get; set; }
        /// <summary>
        /// 商品名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 简介
        /// </summary>
        public string Summary { get; set; }
        /// <summary>
        /// 图片URL
        /// </summary>
        public string Picture { get; set; }
        /// <summary>
        /// 单价
        /// </summary>
        public int Price { get; set; }
        /// <summary>
        /// 0不在售1在售
        /// </summary>
        public bool OnSale { get; set; }
        /// <summary>
        /// 描述
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 实际库存
        /// </summary>
        public int ActualStock { get; set; }
        /// <summary>
        /// 可用库存
        /// </summary>
        public int AvailableStock { get; set; }
        /// <summary>
        /// 占用库存
        /// </summary>
        public int HoldingStock { get; set; }
        /// <summary>
        /// 是否已删除
        /// </summary>
        public bool Deleted { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreatedTime { get; set; }
        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime? ModifiedTime { get; set; }
        /// <summary>
        /// 是否推荐首页
        /// </summary>
        public bool? IsRecommend { get; set; }

        public string ParentCategory { get; set; }
        public string SubCategory { get; set; }
    }
}
