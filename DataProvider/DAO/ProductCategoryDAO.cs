using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;

namespace DataProvider.DAO
{
    public class ProductCategoryDAO
    {
        GearShopDbContext context = null;
        public ProductCategoryDAO()
        {
            context = new GearShopDbContext();
        }
        public IEnumerable<ProductCategory> ListAllPaging(int page, int pageSize)
        {
            return context.ProductCategories.OrderBy(x => x.CategoryID).ToPagedList(page, pageSize);
        }
        public int Insert(ProductCategory entity)
        {
            context.ProductCategories.Add(entity);
            int count = context.SaveChanges();
            return count;
        }

        public ProductCategory GetByID(int? id)
        {
            return context.ProductCategories.SingleOrDefault(x => x.CategoryID == id);
        }
        public List<ProductCategory> ListAll()
        {
            return context.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.CategoryID).ToList();
        }
    }
   
}
