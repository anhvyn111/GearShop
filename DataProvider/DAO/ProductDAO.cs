using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataProvider.Framework;
using PagedList;
using PagedList.Mvc;
using StoreDemo.Common;
using System.IO;
using System.Data.Entity;
using System.Data.Linq.SqlClient;

namespace DataProvider.DAO
{
    public class ProductDAO
    {
        GearShopDbContext context = null;
        public ProductDAO()
        {
            context = new GearShopDbContext();
        }

        public List<Product> ListLaptop(int top)
        {
            var listLaptop = (from p in context.Products
                                    join cate in context.ProductCategories on p.CategoryID equals cate.CategoryID
                                    join menu in context.Menus on cate.MenuID equals menu.MenuID
                                    where menu.MenuID == 2 && p.Quanlity > 0 && p.Status == true
                                    select p).Take(top).ToList();
            return listLaptop;
        }

        public List<Product> ListGPU(int top)
        {
            return (from p in context.Products
                    join cate in context.ProductCategories on p.CategoryID equals cate.CategoryID    
                    where cate.CategoryID == 18 && p.Quanlity > 0 && p.Status == true
                    select p).Take(top).ToList();
        }

        public List<Product> ListScreen(int top)
        {
           return (from p in context.Products
                   join cate in context.ProductCategories on p.CategoryID equals cate.CategoryID
                   join menu in context.Menus on cate.MenuID equals menu.MenuID
                   where menu.MenuID == 5 && p.Quanlity > 0 && p.Status == true
                   select p).Take(top).ToList();
        }



        // Admin
        public int Insert(Product model)
        {
            model.MetaTitle = StringHelper.ToUnsignMeta(model.ProductName);         
            model.ModifiedDate = DateTime.Now;
            model.Status = true;
            if (!string.IsNullOrEmpty(model.ProductTag))
            {
                string[] tags = model.ProductTag.Split(',');
                foreach(var tag in tags)
                {
                    var tagID = StringHelper.ToUnsignMeta(tag);
                    var existedTag = CheckTag(tagID, model.CategoryID);
                    if (!existedTag) 
                    {
                        InsertTag(tagID, tag, model.CategoryID);    
                    }
                    if(model.ProductTags.Where(x=>x.TagID == tagID).Count() == 0)
                    {
                        model.ProductTags.Add(new ProductTag { TagID = tag, ProductID = model.ProductID });
                    }
                }
            }
            context.Products.Add(model);
            context.SaveChanges();
            return model.ProductID;
        }

        public bool Update(Product model)
        {
            var product = context.Products.Find(model.ProductID);
            if(product != null)
            {
                product.ProductName = model.ProductName;
                product.PromotionPrice = model.PromotionPrice;
                product.Price = model.Price;
                product.MetaTitle = StringHelper.ToUnsignMeta(model.ProductName);
                product.Description = model.Description;
                product.CategoryID = model.CategoryID;
                product.Detail = model.Detail;
               
                if(model.ProductImages.Count > 0)
                {

                    foreach(var item in model.ProductImages)
                    {
                        item.ProductID = product.ProductID;
                        new ProductImageDAO().Insert(item);
                    }
                }
                context.SaveChanges();
                return true;
            }
            return false;
        }

        public bool ChangeStatus(Product product)
        {
            var model = product;
            int id = context.SaveChanges();
            if (id > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public int Delete(Product product)
        {
            if (!string.IsNullOrEmpty(product.ProductTag))
            {
                DeleteAllProductTag(product.ProductID);
            }

            context.Products.Remove(product);
            context.SaveChanges();
            return 1;
        }
        public bool CheckTag(string tagID, int? categoryID)
        {
            return context.Tags.Count(x => x.TagID == tagID && x.CategoryID == categoryID) > 0;
        }

        public void InsertTag(string tagID, string tagName, int? categoryID)
        {
            Tag tag = new Tag();
            tag.TagID = tagID;
            tag.TagName = tagName;
            tag.CategoryID = categoryID;
            context.Tags.Add(tag);
            context.SaveChanges();
        }
        public void InsertProductTag(int productID, string tagID)
        {
            ProductTag productTag = new ProductTag();
            productTag.ProductID = productID;
            productTag.TagID = tagID;
            context.ProductTags.Add(productTag);
            context.SaveChanges();
        }

        public Product ViewDetailAdmin(int id)
        {
            return context.Products.Find(id);

        }
        public void DeleteAllProductTag(int productID)
        {
            context.ProductTags.RemoveRange(context.ProductTags.Where(x => x.ProductID == productID));
        }
        
        public IEnumerable<Product> ListAllPaging(string search, int page, int pageSize)
        {
            IQueryable<Product> model = context.Products;
            if (!string.IsNullOrEmpty(search))
            {
                search = StoreDemo.Common.StringHelper.ToUnSignString(search);
                search = search.Replace(' ', '%');          
                return context.Products.Where(x=>x.MetaTitle.Contains(search)).OrderByDescending(x=>x.ProductID).ToPagedList(page, pageSize);
            }
            else
            {
                return model.OrderByDescending(x => x.ProductID).ToPagedList(page, pageSize);
            }
        }

        public Product GetByID(int? id)
        {
            return context.Products.Where(x=>x.ProductID == id).Include(x => x.ProductImages).FirstOrDefault();
        }

        // Client


        // Xem chi tiết sản phẩm
        public Product ViewDetail(string productMeta)
        {
            var product = context.Products.Where(x => x.MetaTitle == productMeta).Include(x => x.ProductImages).FirstOrDefault();
            var cate = context.ProductCategories.Where(x => x.CategoryID == product.CategoryID).FirstOrDefault();
            product.ProductCategory = cate;
            return product;
        }

        //Danh sách sản phẩm mới nhất
        public List<Product> ListNewProduct(int top)
        {
            var listNewProduct = context.Products.Where(p=>p.Status == true && p.Quanlity > 0).OrderByDescending(x => x.ModifiedDate).Take(top).Include(i => i.ProductImages).ToList();
            return listNewProduct;
        }

        //Kiểm tra tên sản phẩm đã tồn tại hay chưa
        public bool CheckNameExist(string name, int id)
        {
            name = StoreDemo.Common.StringHelper.ToUnsignMeta(name);
            Product product = context.Products.Where(x => x.MetaTitle == name && x.ProductID != id).FirstOrDefault();
            if(product != null)
            {
                return false;

            }
            else
            {
                return true;
            }
        }

        // Danh sách sản phẩm tương tự
        public List<Product> ListRelatedProduct(int? categoryID, int productID)
        {
            return context.Products.Where(x => x.CategoryID == categoryID && x.ProductID != productID && x.Quanlity > 0 && x.Status == true).Include(x => x.ProductImages).ToList();
        }

        // Danh sách sản phẩm theo thể loại Menu
        public IEnumerable<Product> CollectionByMenu(string metaTitle, int page, int pageSize)
        {
            IEnumerable<Product> collection = (from p in context.Products
                                        join pc in context.ProductCategories on p.CategoryID equals pc.CategoryID
                                        join m in context.Menus on pc.MenuID equals m.MenuID
                                        where m.MetaTitle == metaTitle && p.Quanlity > 0 && p.Status == true
                                        select p).ToList();
            foreach (var item in collection)
            {
                ProductImage img = context.ProductImages.Where(x => x.ProductID == item.ProductID).FirstOrDefault();
                item.ProductImages.Add(img);
            }
            return collection.ToPagedList(page, pageSize);
        }
        // Danh sách sản phẩm theo danh mục
        public IEnumerable<Product> CollectionByCategory(string metaTitle, int page, int pageSize)
        {
            IEnumerable<Product> collection = (from p in context.Products
                                        join pc in context.ProductCategories on p.CategoryID equals pc.CategoryID
                                        where pc.MetaTitle == metaTitle && p.Quanlity > 0 && p.Status == true
                                        select p).ToList();
            foreach (var item in collection)
            {
                ProductImage img = context.ProductImages.Where(x => x.ProductID == item.ProductID).FirstOrDefault();
                item.ProductImages.Add(img);
            }
            return collection.ToPagedList(page, pageSize);
        }
        // Danh sách sản phẩm theo thẻ(Tag)
        public List<Product> CollectionByTag(string metaTitle)
        {
            List<Product> collection = (from p in context.Products
                                        join pt in context.ProductTags on p.ProductID equals pt.ProductID
                                        join t in context.Tags on pt.TagID equals t.TagID
                                        where t.TagID == metaTitle && p.Quanlity > 0 && p.Status == true
                                        select p).ToList();
            foreach (var item in collection)
            {
                ProductImage img = context.ProductImages.Where(x => x.ProductID == item.ProductID).FirstOrDefault();
                item.ProductImages.Add(img);
            }
            return collection;
        }

        //Cập nhật số lượng sản phẩm
        public bool UpdateQuanlity(int? productID, int? quanlity)
        {
            var product = context.Products.Find(productID);
            product.Quanlity -= quanlity;
            context.SaveChanges();
            return true;
        }
        public bool CheckQuanlity(int productID, int? quanlity)
        {
            var product = context.Products.Find(productID);
            if(product != null)
            {
                if(product.Quanlity >= quanlity)
                {
                    return true;
                }
            }
            return false;
        }
    }
} 