using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataProvider.DAO;
using DataProvider.Framework;
using StoreDemo.Common;
namespace StoreDemo.Controllers
{
    public class CheckOutController : Controller
    {
        // GET: CheckOut
        public ActionResult Index()
        {
            var listCart = new List<Cart>();
            var customerSession = (CustomerLogin)Session[CommonConstants.CUSTOMER_SESSION];
            if(customerSession == null)
            {
                return Redirect("/dang-nhap");
            }
            else
            {
                listCart = new CartDAO().ListCart(customerSession.ID);
                if(listCart.Count() == 0)
                {
                    return Redirect("/");
                }
            }
            return View(listCart);
        }
        public ActionResult Submit() { }
    }
}