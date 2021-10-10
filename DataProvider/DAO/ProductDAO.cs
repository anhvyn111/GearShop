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

namespace DataProvider.DAO
{
    public class ProductDAO
    {
        GearShopDbContext context = null;
        public ProductDAO()
        {
            context = new GearShopDbContext();
        }
        public int Insert(Product model)
        {
            model.MetaTitle = StringHelper.ToUnsignString(model.ProductName);
            context.Products.Add(model);
            context.SaveChanges();

            if (!string.IsNullOrEmpty(model.ProductTag))
            {
                string[] tags = model.ProductTag.Split(',');
                foreach(var tag in tags)
                {
                    var tagID = StringHelper.ToUnsignString(tag);
                    var existedTag = CheckTag(tagID);
                    if (!existedTag) 
                    {
                        InsertTag(tagID, tag);    
                    }
                    InsertProductTag(model.ProductID, tagID);
                }
            }
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
                product.MetaTitle = StringHelper.ToUnsignString(model.ProductName);
                product.Description = model.Description;
                product.ProductTag = model.ProductTag;
                product.Detail = model.Detail;
                product.ModifiedBy = model.ModifiedBy;
                product.ModifiedDate = model.ModifiedDate;
                context.SaveChanges();
                DeleteAllProductTag(product.ProductID);
                if (!string.IsNullOrEmpty(model.ProductTag))
                {
                    string[] tags = model.ProductTag.Split(',');
                    foreach (var tag in tags)
                    {
                        var tagID = StringHelper.ToUnsignString(tag);
                        var existedTag = CheckTag(tagID);
                        if (!existedTag)
                        {
                            InsertTag(tagID, tag);
                        }
                        InsertProductTag(model.ProductID, tagID);
                    }
                }

                return true;
            }
            return false;
        }

        public bool Delete(int productID)
        {
            try
            {
                var product = context.Products.Find(productID);
                if (product != null)
                {
                    context.Products.Remove(product);
                    context.SaveChanges();
                    if (!string.IsNullOrEmpty(product.ProductTag))
                    {
                        DeleteAllProductTag(productID);
                    }
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
            
        }
        public bool CheckTag(string tagID)
        {
            return context.Tags.Count(x => x.TagID == tagID) > 0;
        }

        public void InsertTag(string tagID, string tagName)
        {
            Tag tag = new Tag();
            tag.TagID = tagID;
            tag.TagName = tagName;
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

        public void DeleteAllProductTag(int productID)
        {
            context.ProductTags.RemoveRange(context.ProductTags.Where(x => x.ProductID == productID));
        }
        public Product ViewDetail(int productID)
        {
            return context.Products.Find(productID);
        }
        public IEnumerable<Product> ListAllPaging(string search, int page, int pageSize)
        {
            IQueryable<Product> model = context.Products;
            if (!string.IsNullOrEmpty(search))
            {
                return model.Where(x => x.ProductName.Contains(search)).OrderByDescending(x => x.ProductID).ToPagedList(page, pageSize);
            }
            else
            {
                return model.OrderByDescending(x => x.ProductID).ToPagedList(page, pageSize);
            }
        }
    }
}
