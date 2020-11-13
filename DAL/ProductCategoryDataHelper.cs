using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Entity;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Common;
using Common.Extension;

namespace DAL
{
    public class ProductCategoryDataHelper
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["mall"].ConnectionString;
        public bool Create(ProductCategoryEntity productCategory)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State!=ConnectionState.Open)
            {
                conn.Open();
            }

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_createProductCategory";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@ParentId", productCategory.ParentId));
            cmd.Parameters.Add(new SqlParameter("@Category", productCategory.Category));
            cmd.Parameters.Add(new SqlParameter("@Remark", productCategory.Remark));
            cmd.Parameters.Add(new SqlParameter("@Summary", productCategory.Summary));
            cmd.Parameters.Add(new SqlParameter("@IsRecommend", productCategory.IsRecommend));

            SqlParameter success = new SqlParameter("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(success);

            //第三步：执行命令
            int effect = cmd.ExecuteNonQuery();

            //第四步：关闭连接
            conn.Close();

            return Convert.ToBoolean(success.Value);
        }

        public Dictionary<String, Object> GetAllByPage(int pageIndex, int pageSize, int? id, string Category, int ParentId)
        {
            
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            List<ProductCategoryEntity> lists = new List<ProductCategoryEntity>();

            SqlCommand cmd = conn.CreateCommand();
            int pageCount = 0;
            SqlParameter pageCount_Param = new SqlParameter("@PageCount", pageCount);
            pageCount_Param.Direction = ParameterDirection.Output;
            cmd.CommandText = "pc_ProductCategory";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(pageCount_Param);
            cmd.Parameters.Add(new SqlParameter("@PageIndex", pageIndex));
            cmd.Parameters.Add(new SqlParameter("@PageSize", Convert.ToDecimal(pageSize)));
            cmd.Parameters.Add(new SqlParameter("@Category", Category));
            if(ParentId!=-1)
                cmd.Parameters.Add(new SqlParameter("@ParentId", ParentId));
            if(id!=null) cmd.Parameters.Add(new SqlParameter("@Id", id));
            cmd.ExecuteNonQuery();
            SqlDataReader sqlDataReader = cmd.ExecuteReader();
            while (sqlDataReader.Read())
            {
                lists.Add(new ProductCategoryEntity(sqlDataReader));
            }
            sqlDataReader.Close();
            cmd.Dispose();
            conn.Close();
            Dictionary<String, Object> dictionary = new Dictionary<String, Object>();
            dictionary["list"] = lists;
            dictionary["pageCount"] = pageCount_Param.Value;
            return dictionary;
        }

        public bool Update(ProductCategoryEntity productCategoryEntity)
        {
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_updateProductCategory";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Id", productCategoryEntity.Id));
            cmd.Parameters.Add(new SqlParameter("@ParentId", productCategoryEntity.ParentId));
            cmd.Parameters.Add(new SqlParameter("@Category", productCategoryEntity.Category));
            cmd.Parameters.Add(new SqlParameter("@Summary", productCategoryEntity.Summary));
            cmd.Parameters.Add(new SqlParameter("@Remark", productCategoryEntity.Remark));
            cmd.Parameters.Add(new SqlParameter("@IsRecommend", productCategoryEntity.IsRecommend));
            cmd.Parameters.Add(new SqlParameter("@Deleted", productCategoryEntity.Deleted));

            SqlParameter success = new SqlParameter("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(success);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            return Convert.ToBoolean(success.Value);
            
        }
    }
}
