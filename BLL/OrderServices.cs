using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Entity;
using DAL;
using Model.Enums;
using Common.Utils;
using System.Data;
using Model.BusinessModel;
using Common.Extension;

namespace BLL
{
  public  class OrderServices
    {
        OrderDataHelper helper = new OrderDataHelper();
        public bool Create(OrderEntity productcate)
        {

            productcate.Code = OrderCodeGenerator();
            return helper.Create(productcate);
        }

        public bool Create2(OrderEntity productcate)
        {

            productcate.Code = OrderCodeGenerator();
            return helper.Create2(productcate);
        }

        private string OrderCodeGenerator()
        {
            DateTime now = DateTime.Now;
            string time = now.ToString("yyyyMMddHHmmssfff");

            Random random = new Random();
            int num = random.Next(100, 999);
            return time + num;
        }



    }

    
}
