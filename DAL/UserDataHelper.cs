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
    public class UserDataHelper
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["mall"].ConnectionString;
        public bool Create(UserEntity user)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State!=ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_createUser";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@NickName", user.NickName));
            cmd.Parameters.Add(new SqlParameter("@Gender", user.Gender));
            cmd.Parameters.Add(new SqlParameter("@Email", user.Email));
            cmd.Parameters.Add(new SqlParameter("@Balance", user.Balance));
            cmd.Parameters.Add(new SqlParameter("@LoginId", user.LoginId));
            cmd.Parameters.Add(new SqlParameter("@LoginPWD", user.LoginPWD));

            SqlParameter success = new SqlParameter("@success",SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(success);
            
            //第三步：执行命令
            int effect = cmd.ExecuteNonQuery();
            //第四步：关闭连接
            conn.Close();
            conn.Dispose();


            return Convert.ToBoolean(success.Value);
        }
            
        public UserEntity Get(int id)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from User where id = @id";

            cmd.Parameters.Add(new SqlParameter("@id", id));

            //第三步：执行命令
            SqlDataReader reader = cmd.ExecuteReader();

            UserEntity user =null;
            if (reader.Read())//表示判读读取reader中的下一行数据是否成功
            {
                user = new UserEntity();
                user.Id = Convert.ToInt32(reader["id"]);
            }

            //第四步：关闭连接
            conn.Close();

            return user;
        }
        public UserEntity Get(string LoginId, string LoginPWD)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from [User] where LoginId = @LoginId and LoginPWD =@LoginPWD";

            cmd.Parameters.Add(new SqlParameter("@LoginId", LoginId));
            cmd.Parameters.Add(new SqlParameter("@LoginPWD", LoginPWD));

            //第三步：执行命令
            SqlDataReader reader = cmd.ExecuteReader();

            UserEntity user = null;
            if (reader.Read())//表示判读读取reader中的下一行数据是否成功
            {
                user = new UserEntity();
                user.Id = reader["id"].To<int>();
                user.Balance = reader["Balance"].To<decimal>();
                user.Email = reader["Email"].ToString();
                user.Birthday = reader["Birthday"].To<DateTime>();
            }

            //第四步：关闭连接
            conn.Close();

            return user;
        }
    }
}
