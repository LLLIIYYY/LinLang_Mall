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
    public class ProductCategoryService
    {
        public bool Create(ProductCategoryEntity productCategory)
        {
            ProductCategoryDataHelper helper = new ProductCategoryDataHelper();
            bool success = helper.Create(productCategory);
            return success;
        }

        public ProductCategoryEntity Get(int id)
        {
            List<ProductCategoryEntity> lists = (List<ProductCategoryEntity>)new ProductCategoryDataHelper().GetAllByPage(0, 10, id, "", -1)["lists"];
            if (lists.Count < 1) return null;
            return lists[0];
        }

        public Dictionary<String, Object> GetAllByPage(int pageIndex, int pageSize, int? id, string Category, int ParentId)
        {
            return new ProductCategoryDataHelper().GetAllByPage(pageIndex, pageSize, id, Category, ParentId);
        }

        public bool Update(ProductCategoryEntity productCategory)
        {
            return new ProductCategoryDataHelper().Update(productCategory);
        }
    }
}
