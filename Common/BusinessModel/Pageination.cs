using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.BusinessModel
{
 public   class Pageination
    {
        //当前是第几页
        public int PageIndex { get; set; }

        //每一页的数据行数
        public int PageSize { get; set; }

        //总数据行数
        public int Records { get; set; }

        //总页数
        public int PageCount {

            get {

                return Records / PageSize + (Records % PageSize > 0 ? 1 : 0);

            } }
        
    }
}
