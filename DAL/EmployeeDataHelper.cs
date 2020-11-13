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
    public class EmployeeDataHelper
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["mall"].ConnectionString;
        public bool Create(EmployeeEntity employee)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State!=ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_createEmployee";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@Name", employee.Name));
            cmd.Parameters.Add(new SqlParameter("@Gender", employee.Gender));
            cmd.Parameters.Add(new SqlParameter("@Email", employee.Email));
            //cmd.Parameters.Add(new SqlParameter("@IsSuper", employee.IsSuper));
            cmd.Parameters.Add(new SqlParameter("@IsSuper", false));
            cmd.Parameters.Add(new SqlParameter("@PhoneNumber", employee.PhoneNumber));
            cmd.Parameters.Add(new SqlParameter("@LoginId", employee.LoginId));
            cmd.Parameters.Add(new SqlParameter("@LoginPWD", employee.LoginPWD));
            //cmd.Parameters.Add(new SqlParameter("@Disabled", employee.Disabled));
            cmd.Parameters.Add(new SqlParameter("@Disabled", false));

            SqlParameter success = new SqlParameter("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(success);

            //第三步：执行命令
            int effect = cmd.ExecuteNonQuery();

            //第四步：关闭连接
            conn.Close();

            return Convert.ToBoolean(success.Value);
        }
        public EmployeeEntity Get(int id)
        {
            //第一步：连接对象
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State!=ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from Employee where Id = @id";

            cmd.Parameters.Add(new SqlParameter("@id", id));
            //第三步：执行命令
            SqlDataReader reader = cmd.ExecuteReader();

            EmployeeEntity employee = null;
            if (reader.Read())//表示判读读取reader中的下一行数据是否成功
            {
                employee = new EmployeeEntity();
                employee.Id = Convert.ToInt32(reader["id"]);
            }

            //第四步：关闭连接
            conn.Close();

            return employee;
        }

        public List<EmployeeEntity> getAll()
        {
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            List<EmployeeEntity> lists = new List<EmployeeEntity>();
            
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from employee";

            SqlDataReader sqlDataReader = cmd.ExecuteReader();
            while (sqlDataReader.Read())
            {
                lists.Add(new EmployeeEntity(sqlDataReader));
            }
            sqlDataReader.Close();
            cmd.Dispose();
            conn.Close();
            return lists;
        }

        public Dictionary<String, Object> GetAllByPage(int pageIndex, int pageSize, string Name, int Gender)
        {
            
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            List<EmployeeEntity> lists = new List<EmployeeEntity>();

            SqlCommand cmd = conn.CreateCommand();
            int pageCount = 0;
            SqlParameter pageCount_Param = new SqlParameter("@PageCount", pageCount);
            pageCount_Param.Direction = ParameterDirection.Output;
            cmd.CommandText = "pc_Employee";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(pageCount_Param);
            cmd.Parameters.Add(new SqlParameter("@PageIndex", pageIndex));
            cmd.Parameters.Add(new SqlParameter("@PageSize", Convert.ToDecimal(pageSize)));
            cmd.Parameters.Add(new SqlParameter("@Name", Name));
            cmd.Parameters.Add(new SqlParameter("@Gender", Gender));
            cmd.ExecuteNonQuery();
            SqlDataReader sqlDataReader = cmd.ExecuteReader();
            while (sqlDataReader.Read())
            {
                lists.Add(new EmployeeEntity(sqlDataReader));
            }
            sqlDataReader.Close();
            cmd.Dispose();
            conn.Close();
            Dictionary<String, Object> dictionary = new Dictionary<String, Object>();
            dictionary["list"] = lists;
            dictionary["pageCount"] = pageCount_Param.Value;
            return dictionary;
        }

        public bool Update(EmployeeEntity employee)
        {
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_updateEmployee";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Id", employee.Id));
            cmd.Parameters.Add(new SqlParameter("@Name", employee.Name));
            cmd.Parameters.Add(new SqlParameter("@Gender", employee.Gender));
            cmd.Parameters.Add(new SqlParameter("@PhoneNumber", employee.PhoneNumber));
            cmd.Parameters.Add(new SqlParameter("@Disabled", employee.Disabled));
            cmd.Parameters.Add(new SqlParameter("@Email", employee.Email));
            cmd.Parameters.Add(new SqlParameter("@IsSuper", employee.IsSuper));
            cmd.Parameters.Add(new SqlParameter("@LoginId", employee.LoginId));
            cmd.Parameters.Add(new SqlParameter("@LoginPWD", employee.LoginPWD));
            bool res = cmd.ExecuteNonQuery() > 0;
            cmd.Dispose();
            conn.Close();
            return res;
        }
        public bool Delete(int Id)
        {
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //第二步：命令对象
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "p_deleteEmployee";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Id", Id));
            bool res = cmd.ExecuteNonQuery()>0;
            cmd.Dispose();
            conn.Close();
            return res;
        }
    }
}
