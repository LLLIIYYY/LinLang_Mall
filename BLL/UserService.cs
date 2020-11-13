using DAL;
using Model.Entity;
using Model.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Utils;

namespace BLL
{
    public class UserService
    {
        public bool Create(UserEntity user) 
        {
            user.LoginPWD = MD5Generator.GenerateMD5(user.LoginPWD);

            UserDataHelper helper = new UserDataHelper();
            bool success = helper.Create(user);

            return success;
        }
        public UserEntity Login(string LoginId, string LoginPWD)
        {
            UserDataHelper helper = new UserDataHelper();
            return helper.Get(LoginId, MD5Generator.GenerateMD5(LoginPWD));
        }
    }
}
