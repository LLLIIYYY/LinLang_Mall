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
    public class ProductDataHelper
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["mall"].ConnectionString;
        public bool Create(ProductEntity product)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State!=ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_createProduct";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@Name", product.Name));
            cmd.Parameters.Add(new SqlParameter("@CategoryId", product.CategoryId));
            cmd.Parameters.Add(new SqlParameter("@SubCategoryId", product.SubCategoryId));
            cmd.Parameters.Add(new SqlParameter("@Summary", product.Summary));
            cmd.Parameters.Add(new SqlParameter("@Picture", product.Picture));
            cmd.Parameters.Add(new SqlParameter("@Price", product.Price));
            cmd.Parameters.Add(new SqlParameter("@OnSale", product.OnSale));
            cmd.Parameters.Add(new SqlParameter("@Description", product.Description));
            cmd.Parameters.Add(new SqlParameter("@ActualStock", product.ActualStock));
            cmd.Parameters.Add(new SqlParameter("@AvailableStock", product.AvailableStock));
            cmd.Parameters.Add(new SqlParameter("@HoldingStock", product.HoldingStock));
            cmd.Parameters.Add(new SqlParameter("@IsRecommend", product.IsRecommend));

            SqlParameter success = new SqlParameter("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(success);

            //第三步：执行命令
            cmd.ExecuteNonQuery();

            //第四步：关闭连接
            conn.Close();

            return Convert.ToBoolean(success.Value);
        }
        public ProductEntity Get(int id)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State!=ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from Product where Id = @id";

            cmd.Parameters.Add(new SqlParameter("@id", id));
            //第三步：执行命令
            SqlDataReader reader = cmd.ExecuteReader();

            ProductEntity product = null;
            if (reader.Read())//表示判读读取reader中的下一行数据是否成功
            {
                product = new ProductEntity();
                product.Id = Convert.ToInt32(reader["id"]);
            }

            //第四步：关闭连接
            conn.Close();

            return product;
        }

        public List<ProductEntity> getAll()
        {
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            List<ProductEntity> lists = new List<ProductEntity>();
            
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from product";

            SqlDataReader sqlDataReader = cmd.ExecuteReader();
            while (sqlDataReader.Read())
            {
                lists.Add(new ProductEntity(sqlDataReader));
            }
            sqlDataReader.Close();
            cmd.Dispose();
            conn.Close();
            return lists;
        }

        public Dictionary<String, Object> GetAllByPage(int pageIndex, int pageSize, string Name, int? CategoryId, int? SubCategoryId, int? Id)
        {
            
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            List<ProductEntity> lists = new List<ProductEntity>();

            SqlCommand cmd = conn.CreateCommand();
            int pageCount = 0;
            SqlParameter pageCount_Param = new SqlParameter("@PageCount", pageCount);
            pageCount_Param.Direction = ParameterDirection.Output;
            cmd.CommandText = "pc_Product";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(pageCount_Param);
            cmd.Parameters.Add(new SqlParameter("@PageIndex", pageIndex));
            cmd.Parameters.Add(new SqlParameter("@PageSize", Convert.ToDecimal(pageSize)));
            cmd.Parameters.Add(new SqlParameter("@Name", Name));
            if(SubCategoryId!=-1) cmd.Parameters.Add(new SqlParameter("@SubCategoryId", SubCategoryId));
            if (CategoryId != -1) cmd.Parameters.Add(new SqlParameter("@CategoryId", CategoryId));
            if(Id != null) cmd.Parameters.Add(new SqlParameter("@Id", Id));
            cmd.ExecuteNonQuery();
            SqlDataReader sqlDataReader = cmd.ExecuteReader();
            while (sqlDataReader.Read())
            {
                lists.Add(new ProductEntity(sqlDataReader));
            }
            sqlDataReader.Close();
            cmd.Dispose();
            conn.Close();
            Dictionary<String, Object> dictionary = new Dictionary<String, Object>();
            dictionary["list"] = lists;
            dictionary["pageCount"] = pageCount_Param.Value;
            return dictionary;
        }

        public bool Update(ProductEntity product)
        {
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_updateProduct";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Id", product.Id));
            cmd.Parameters.Add(new SqlParameter("@Name", product.Name));
            cmd.Parameters.Add(new SqlParameter("@CategoryId", product.CategoryId));
            cmd.Parameters.Add(new SqlParameter("@SubCategoryId", product.SubCategoryId));
            cmd.Parameters.Add(new SqlParameter("@Summary", product.Summary));
            cmd.Parameters.Add(new SqlParameter("@Picture", product.Picture));
            cmd.Parameters.Add(new SqlParameter("@Price", product.Price));
            cmd.Parameters.Add(new SqlParameter("@OnSale", product.OnSale));
            cmd.Parameters.Add(new SqlParameter("@Description", product.Description));
            cmd.Parameters.Add(new SqlParameter("@ActualStock", product.ActualStock));
            cmd.Parameters.Add(new SqlParameter("@AvailableStock", product.AvailableStock));
            cmd.Parameters.Add(new SqlParameter("@HoldingStock", product.HoldingStock));
            cmd.Parameters.Add(new SqlParameter("@IsRecommend", product.IsRecommend));
            cmd.Parameters.Add(new SqlParameter("@Deleted", product.Deleted));

            bool res = cmd.ExecuteNonQuery() > 0;
            cmd.Dispose();
            conn.Close();
            return res;
        }
    }
}
