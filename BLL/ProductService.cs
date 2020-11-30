using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Utils;
using DAL;
using Model.BusinessModel;
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
        
        public ProductEntity getSingle(int id)
        {
            List<ProductEntity> list = (List<ProductEntity>) GetAllByPage(1, 10, "", null, null, id)["list"];
            if (list.Count > 0) return list[0];
            return null;
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
        public List<ProductEntity> Select(ProductEntity employee, Pageination pageentity)
        {
            ProductDataHelper helper = new ProductDataHelper();
            List<ProductEntity> list = helper.Allselect(employee, pageentity);
            return list;
        }
    }
}
