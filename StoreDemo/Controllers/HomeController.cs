using DataProvider.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreDemo.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var productDAO = new ProductDAO();
            ViewBag.ListNewProduct = productDAO.ListNewProduct(6);
            return View();
        }

        [ChildActionOnly]
        public ActionResult Menu()
        {
            var menus = new MenuDAO().LoadMenu();
            return PartialView(menus);
        }
    }
}