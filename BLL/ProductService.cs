using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Utils;
using DAL;
using Model.Entity;

namespace BLL
{
    public class ProductService
    {
        public bool Create(ProductEntity product)
        {

            ProductDataHelper helper = new ProductDataHelper();
            bool success = helper.Create(product);

            return success;
        }
        

        public Dictionary<String, Object> GetAllByPage(int pageIndex, int pageSIze, string Name, int? CategoryId, int? SubCategoryId, int? Id)
        {
            return new ProductDataHelper().GetAllByPage(pageIndex, pageSIze, Name, CategoryId, SubCategoryId, Id);
        }

        public bool Update(ProductEntity product)
        {
            return new ProductDataHelper().Update(product);
        }
        public bool Delete(ProductEntity product)
        {
            return new ProductDataHelper().Update(product);
        }
    }
}
