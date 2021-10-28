using DataProvider.DAO;
using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreDemo.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        
        [HttpGet]
        public ActionResult Detail(string id)
        {
            var productDAO = new ProductDAO();
            var product = productDAO.ViewDetail(id);
            if(product == null)
            {
                return RedirectToAction("NotFound", "Error");
            }
            else
            {
                if (product.Price != null)
                {
                    var info = System.Globalization.CultureInfo.GetCultureInfo("vi-VN");
                    ViewBag.Price = String.Format(info, "{0:0,0}", product.Price);
                    ViewBag.RelatedProducts = productDAO.ListRelatedProduct(product.CategoryID, product.ProductID);
                }
                else
                {
                    ViewBag.Price = "Liên hệ";
                }
            }
            return View(product);
        }
        public ActionResult Collection(string id)
        {
            var productDAO = new ProductDAO();
            List<Product> collection = new List<Product>();
            var checkMenu = new MenuDAO().GetByMetaTitle(id);
            if (checkMenu != null)
            {
                ViewBag.CollectionTitle = checkMenu.MenuName; 
                collection = productDAO.CollectionByMenu(id);
            }
            else {
                var checkCategory = new ProductCategoryDAO().GetByMetaTitle(id);
                if (checkCategory != null)
                {
                    ViewBag.CollectionTitle = checkCategory.CategoryName;
                    collection = productDAO.CollectionByCategory(id);
                }
                else
                {
                    var checkTag = new TagDAO().GetByMetaTitle(id);
                    if(checkTag != null)
                    {
                        ViewBag.CollectionTitle = checkTag.TagName;
                        collection = productDAO.CollectionByTag(id);
                    }
                    else
                    {
                        ViewBag.Error404 = "Không tìm thấy trang";
                    }
                }
            } 
            return View(collection);
        }
    }
}