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
   public class CartService
    {
        CartHelper helper = new CartHelper();
        public bool Create(CartEntity productcate)
        {

            return helper.Create(productcate);
        }


        public List<CartEntity> Select(CartEntity employee, Pageination pageentity)
        {
            CartHelper helper = new CartHelper();
            List<CartEntity> list = helper.Allselect(employee, pageentity);
            return list;
        }
    }
}
