using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Model.Entity;
using System.Configuration;
using Model.BusinessModel;
using Common.Extension;

namespace DAL
{
    public class CartHelper
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["mall"].ConnectionString;
        JsonResult json = new JsonResult();
        //添加
        public bool Create(CartEntity productcate)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_addToCart";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@UserId", productcate.UserId));
            cmd.Parameters.Add(new SqlParameter("@ProductId", productcate.ProductId));
            cmd.Parameters.Add(new SqlParameter("@ProdeuctCount", productcate.ProductCount));
            SqlParameter success = new SqlParameter("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(success);

            //第三步：执行命令
            int i = cmd.ExecuteNonQuery();//受影响的行数
            //第四步：关闭连接
            conn.Close();
            conn.Dispose();

            return Convert.ToBoolean(success.Value);
        }


        //查询
        //查询
        public List<CartEntity> Allselect(CartEntity employee, Pageination pageentity, bool isPaging=true)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_readCart";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@userId", employee.UserId));
            cmd.Parameters.Add(new SqlParameter("@isPaging", isPaging));
            cmd.Parameters.Add(new SqlParameter("@pageIndex", pageentity.PageIndex));
            cmd.Parameters.Add(new SqlParameter("@pageSize", pageentity.PageSize));
            SqlParameter records = new SqlParameter("@records", SqlDbType.Int);
            records.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(records);

            //第三步：执行命令
            SqlDataReader reader = cmd.ExecuteReader();//受影响的行数
            List<CartEntity> list = new List<CartEntity>();
            while (reader.Read())//从reader中的逐条的读取下一行数据是否成功
            {
                list.Add(new CartEntity
                {
                    Id = reader["Id"].ToInt(),
                    ProName = reader["ProName"].ToString(),
                    Picture = reader["Picture"].ToString(),
                    ProductId = reader["ProductId"].ToInt(),
                    ProductCount = reader["ProductCount"].ToInt(),
                    Price = reader["Price"].To<decimal>(),
                });
            }
            //[重点]必须在reader读取数据完成以后。关闭reader；然后才能获取输出参数的值
            reader.Close();
            pageentity.Records = records.Value.ToInt();
            //第四步：关闭连接
            conn.Close();
            return list;
        }



    }
}
