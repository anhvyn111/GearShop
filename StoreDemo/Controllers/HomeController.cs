
using DataProvider.DAO;
using DataProvider.Framework;
using StoreDemo.Common;
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
            ViewBag.ListLaptop = productDAO.ListLaptop(6);
            ViewBag.ListScreen = productDAO.ListScreen(6);
            ViewBag.ListGPU = productDAO.ListGPU(6);
            return View();
        }

        [ChildActionOnly]
        public ActionResult Menu()
        {
            var menus = new MenuDAO().LoadMenu();
            return PartialView(menus);
        }
        
        public ActionResult Header()
        {
            var customer = (CustomerLogin)Session[Common.CommonConstants.CUSTOMER_SESSION];
            var list = new List<Cart>();
            if (customer != null)
            {
                list = new CartDAO().ListCart(customer.ID);
            }
            else
            {
                list = (List<Cart>)Session[Common.CommonConstants.CART_SESSION];
            }
            if (list != null)
            {
                int? count = 0;
                foreach (var item in list)
                {
                    count += item.Quanlity;
                }
                ViewBag.CartItemAmount = count;
            }
            return PartialView();
        }
    }
}