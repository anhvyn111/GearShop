using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataProvider.DAO;
using DataProvider.Framework;
using StoreDemo.Common;
using StoreDemo.Models;

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
            return View();
        }

        [ChildActionOnly]
        // Hiển thị danh sách sản phẩm trong vỏ hàng
        public ActionResult ListCart()
        {
            var customerSession = (CustomerLogin)Session[CommonConstants.CUSTOMER_SESSION];
            var listCart = new CartDAO().ListCart(customerSession.ID);
            return PartialView(listCart);
        }

        [HttpPost]
        // Tiến hành tạo đơn hàng
        public ActionResult Payment(Order order) {
            if (ModelState.IsValid)
            {
                order.PaymentMethod = "Cod";
                var user = (CustomerLogin)Session[CommonConstants.CUSTOMER_SESSION];
                var cartDAO = new CartDAO();
                var listCart = cartDAO.ListCart(user.ID);
                int error = 0;
                string errorMessage = "";
                long? totalPrice = 0;
                foreach (var item in listCart)
                {
                    var result = cartDAO.CheckQuanlity(item.ProductID, item.Quanlity);
                    if (!result)
                    {
                        error += 1;
                        var product = new ProductDAO().GetByID(item.ProductID);
                        errorMessage += "Sản phẩm '" + product.ProductName + "' chỉ còn " + product.Quanlity + " sản phẩm. \n";
                    }
                    else
                    {
                        long? price = item.Product.Price;
                        if (item.Product.PromotionPrice > 0)
                        {
                            price = item.Product.PromotionPrice;
                        }
                        totalPrice += price * item.Quanlity;
                    }
                }
                if (error > 0)
                {
                    TempData["errorMess"] = errorMessage;
                    return Redirect("/vo-hang");

                }
                else
                {
                    var pOrder = new ProductOrder()
                    {
                        FullName = order.FullName,
                        Address = order.Address + ", " + order.Ward + ", " + order.City + ", " + order.Province,
                        PhoneNumber = order.PhoneNumber,
                        TotalPrice = (int)totalPrice,
                        OrderDate = DateTime.Now,
                        PaymentMethod = "cod",
                        CustomerID = user.ID,
                        Status = 0
                    };
                    var result = new OrderDAO().Insert(pOrder);
                    if (result)
                    {
                        TempData["orderSuccess"] = "success";
                        return Redirect("/don-hang");
                    }
                }
            }          
            else
            {
                ModelState.AddModelError("", "Vui lòng nhập đầy đủ thông tin");
            }
            return View("Index");
        }
        public ActionResult Success()
        {
            string orderSuccess = TempData["orderSuccess"] as string;
            if (orderSuccess == "success")
            {
                return View();
            }
            else
            {
                return Redirect("/");
            }
            return View();
        }
    }
}