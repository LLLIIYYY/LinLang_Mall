using Common.Extension;
using Model.Enums;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class EmployeeEntity
    {
        public EmployeeEntity()
        {
        }

        public EmployeeEntity(SqlDataReader sqlDataReader)
        {
            this.Id = Convert.ToInt32(sqlDataReader["Id"]);
            this.Name = sqlDataReader["Name"].ToString();
            this.Gender = Convert.ToInt32(sqlDataReader["Gender"]);
            this.Email = sqlDataReader["Email"].ToString();
            this.IsSuper = Convert.ToBoolean(sqlDataReader["IsSuper"]);
            this.PhoneNumber = sqlDataReader["PhoneNumber"].ToString();
            this.LoginId = sqlDataReader["LoginId"].ToString();
            this.LoginPWD = sqlDataReader["LoginPWD"].ToString();
            this.Disabled = Convert.ToBoolean(sqlDataReader["Disabled"]);
            this.CreatedTime = Convert.ToDateTime(sqlDataReader["CreatedTime"]);
            this.ModifiedTime = Convert.ToDateTime(sqlDataReader["ModifiedTime"]);
        }

        /// <summary>
        /// Id
        /// </summary>
        public int? Id { get; set; }
        /// <summary>
        /// 员工姓名
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 性别
        /// </summary>
        public int? Gender { get; set; }
        /// <summary>
        /// Email
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// 是否为超级用户
        /// </summary>
        public bool? IsSuper { get; set; }
        /// <summary>
        /// 电话号码
        /// </summary>
        public string PhoneNumber { get; set; }
        /// <summary>
        ///登录ID
        /// </summary>
        public string LoginId { get; set; }
        /// <summary>
        ///登录密码
        /// </summary>
        public string LoginPWD { get; set; }
        /// <summary>
        /// 0有效（默认）；1失效
        /// </summary>
        public bool? Disabled { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? CreatedTime { get; set; }
        /// <summary>
        ///修改时间
        /// </summary>
        public DateTime? ModifiedTime { get; set; }

        #region 扩展属性
        public string GenderText { get { return GenderEmnuConvertor.toDescription((GenderEnum)Gender); } set { } }
        #endregion
    }
}
