using System;
using System.Data;
using System.Data.SqlClient;
using Model.Entity;
using System.Configuration;
using Model.BusinessModel;

namespace DAL
{
    public class OrderDataHelper
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["mall"].ConnectionString;
        JsonResult json = new JsonResult();

        //添加
        public bool Create(OrderEntity productcate)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_createOrderFormCart";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@code", productcate.Code));
            cmd.Parameters.Add(new SqlParameter("@userId", productcate.UserId));
            cmd.Parameters.Add(new SqlParameter("@cardIds", productcate.cartsId));
            cmd.Parameters.Add(new SqlParameter("@remark", productcate.Remark));
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


        //添加
        public bool Create2(OrderEntity productcate)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_createorder";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@code", productcate.Code));
            cmd.Parameters.Add(new SqlParameter("@userId", productcate.UserId));
            cmd.Parameters.Add(new SqlParameter("@productId", productcate.ProId));
            cmd.Parameters.Add(new SqlParameter("@productCount", productcate.Count));
            cmd.Parameters.Add(new SqlParameter("@msg", productcate.Remark));
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
    }
}
