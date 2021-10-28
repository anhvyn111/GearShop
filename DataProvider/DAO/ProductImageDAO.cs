using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataProvider.Framework;
using System.Web;
namespace DataProvider.DAO
{
    public class ProductImageDAO
    {

        GearShopDbContext context = null;
        public ProductImageDAO()
        {
            context = new GearShopDbContext();
        }
        public int Insert(ProductImage entity)
        {
            context.ProductImages.Add(entity);
            context.SaveChanges();
            return entity.ImageID;
        }
        public List<ProductImage> ListImages(int id)
        {
            return context.ProductImages.Where(x => x.ProductID == id).OrderByDescending(x => x.ImageID).ToList();
        }
        public ProductImage GetByID(int id)
        {
            context.Configuration.ProxyCreationEnabled = false;
            return context.ProductImages.Find(id);
        }
        public void DeleteImage(ProductImage image)
        {
            context.ProductImages.Remove(image);
            context.SaveChanges();
            
        }
        public int CountImages()
        {
            if (context.ProductImages.Count() == 0)
            {
                return 1;
            }
            else
            {
                return context.ProductImages.Max(x => x.ImageID);
            }
        }
    }
}
