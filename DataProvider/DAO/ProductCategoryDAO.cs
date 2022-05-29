using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using System.Data.Entity;

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
            return context.ProductCategories.OrderByDescending(x => x.CategoryID).ToPagedList(page, pageSize);
        }
        public int Insert(ProductCategory entity)
        {
            context.ProductCategories.Add(entity);
            int count = context.SaveChanges();
            return count;
        }

        public bool Update(ProductCategory entity)
        {
            try
            {
                var productCate = context.ProductCategories.Find(entity.CategoryID);
                productCate.CategoryName = entity.CategoryName;
                productCate.MenuID = entity.MenuID;
                productCate.MetaTitle = entity.MetaTitle;
                int result = context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }      
        }

        public bool Delete(int cateId)
        {
            try
            {
                var productCate = context.ProductCategories.Find(cateId);
                if(productCate != null)
                {
                    context.ProductCategories.Remove(productCate);
                    context.SaveChanges();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        public ProductCategory GetByID(int? id)
        {
            return context.ProductCategories.SingleOrDefault(x => x.CategoryID == id);
        }
        public List<ProductCategory> ListAll()
        {
            return context.ProductCategories.Where(x => x.Status == true).ToList();
        }

        public bool CheckNameExist(string name, int id)
        {
            var model = context.ProductCategories.Where(x => x.MetaTitle == name && x.CategoryID != id).FirstOrDefault();
            if(model != null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public List<Menu> ListMenuEditCatogry(int? id)
        {
            List<Menu> selected = context.Menus.ToList();
            List<Menu> newMenu = new List<Menu>();
            Menu selectedMenu = selected.Where(x => x.MenuID == id).First();
            newMenu.Add(selectedMenu);
            selected.Remove(selectedMenu);
            foreach (var item in selected)
            {
                newMenu.Add(item);
            }
            return newMenu;
        }

        public ProductCategory GetByMetaTitle(string metaTitle)
        {
            return context.ProductCategories.Where(x => x.MetaTitle == metaTitle).FirstOrDefault();
        }
    }
   
}
