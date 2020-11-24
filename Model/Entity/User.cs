using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Entity
{
   public class User
    {
        public int? Id { get; set; }
        public string NickName { get; set; }
        public int? Gender { get; set; }
        public string Email { get; set; }
        public DateTime Birthday { get; set; }
        public string LoginId { get; set; }
        public string LoginPWD { get; set; }
        public decimal? Balance { get; set; }
        public DateTime? CreateTime { get; set; }
    }
}
