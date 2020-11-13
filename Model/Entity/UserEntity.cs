using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
    public class UserEntity
    {
        /// <summary>
        /// Id
        /// </summary>
        public int? Id { get; set; }
        /// <summary>
        /// 昵称
        /// </summary>
        public string NickName { get; set; }
        /// <summary>
        ///性别 0保密1男2女
        /// </summary>
        public int? Gender { get; set; }
        /// <summary>
        /// Email
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// 生日
        /// </summary>
        public DateTime Birthday { get; set; }
        /// <summary>
        /// 钱包余额
        /// </summary>
        public decimal? Balance { get; set; }
        /// <summary>
        /// 登录Id
        /// </summary>
        public string LoginId { get; set; }
        /// <summary>
        /// 登录密码
        /// </summary>
        public string LoginPWD { get; set; }
        /// <summary>
        /// 创建日期
        /// </summary>
        public DateTime? CreateTime { get; set; }
    }
}
