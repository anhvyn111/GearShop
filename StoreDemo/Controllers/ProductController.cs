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

        public ActionResult Search(string search, int page = 1, int pageSize = 12)
        {
            var dao = new ProductDAO();
            var model = dao.ListAllPaging(search, page, pageSize);
            ViewBag.Search = search;
            return View(model);
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
        public ActionResult Collection(string id, int page = 1, int pageSize = 12)
        {
            var productDAO = new ProductDAO();
            IEnumerable<Product> collection = new List<Product>();
            var checkMenu = new MenuDAO().GetByMetaTitle(id);
            if (checkMenu != null)
            {
                ViewBag.CollectionTitle = checkMenu.MenuName; 
                collection = productDAO.CollectionByMenu(id, page, pageSize);
            }
            else {
                var checkCategory = new ProductCategoryDAO().GetByMetaTitle(id);
                if (checkCategory != null)
                {
                    ViewBag.CollectionTitle = checkCategory.CategoryName;
                    collection = productDAO.CollectionByCategory(id, page, pageSize);
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