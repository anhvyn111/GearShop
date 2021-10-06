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
        StoreDemoDbContext context = null;
        public ProductCategoryDAO()
        {
            context = new StoreDemoDbContext();
        }
        public IEnumerable<ProductCategory> ListAllPaging(int page, int pageSize)
        {
            return context.ProductCategories.OrderBy(x => x.ID).ToPagedList(page, pageSize);
        }
        public int Insert(ProductCategory entity)
        {
            context.ProductCategories.Add(entity);
            context.SaveChanges();
            return entity.ID;
        }

        public ProductCategory GetByID(int? id)
        {
            return context.ProductCategories.SingleOrDefault(x => x.ID == id);
        }
        public List<ProductCategory> ListAll()
        {
            return context.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.ID).ToList();
        }
    }
   
}
