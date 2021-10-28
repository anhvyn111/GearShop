using DataProvider.Framework;
using StoreDemo.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataProvider.DAO
{
    public class TagDAO
    {
        GearShopDbContext context = null;
        public TagDAO()
        {
            context = new GearShopDbContext();
        }

        public List<Tag> ListCreateTagsByCategory(int? id)
        {
            return context.Tags.Where(x => x.CategoryID == id).ToList();
        }
        public List<ProductTagModel> ListEditTagsByCategory(int? categoryID, int productID)
        {
            List<ProductTagModel> list = new List<ProductTagModel>();
            var query = from Tag in context.Tags
                        join ProductTag in context.ProductTags on new { TagID = Tag.TagID, ProductID = productID } equals new { TagID = ProductTag.TagID, ProductID = ProductTag.ProductID } into gj
                        from subtag in gj.DefaultIfEmpty()
                    where Tag.CategoryID == categoryID
                    select new { TagID = Tag.TagID, TagName = Tag.TagName, ProductID = subtag == null ? 0 : subtag.ProductID };

            foreach(var item in query)
            {
                list.Add(new ProductTagModel { TagID = item.TagID, TagName = item.TagName, ProductID = item.ProductID});
            }
            return list;
        }

        public Tag GetByMetaTitle(string tagID)
        {
            return context.Tags.Where(x => x.TagID == tagID).FirstOrDefault();
        }
    }
}
