using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreDemo.Common;
using DataProvider.DAO;

namespace StoreDemo.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            
            ViewBag.ErrorMessage = TempData["errorMess"] as string;
            return View();
        }
        
        public ActionResult DataTable()
        {
            var list = new List<Cart>();
            if (Session[CommonConstants.CUSTOMER_SESSION] != null)
            {
                var customer = (CustomerLogin)Session[CommonConstants.CUSTOMER_SESSION];
                list = new CartDAO().ListCart(customer.ID);
            }
            else
            {
                var cart = Session[CommonConstants.CART_SESSION];

                if (cart != null)
                {
                    list = (List<Cart>)cart;
                }
            }
            return PartialView(list);
        }
        public ActionResult Add(int id)
        {
            var customerSession = (CustomerLogin)Session[Common.CommonConstants.CUSTOMER_SESSION];
            var product = new ProductDAO().GetByID(id);
            if(product != null)
            {
                // Nếu khách hàng chưa đăng nhập
                if (customerSession == null)
                {
                    var cart = Session[CommonConstants.CART_SESSION];
                    // Nếu vỏ hàng rỗng
                    var list = new List<Cart>();
                    if (cart == null)
                    {
                        var item = new Cart();
                        item.ProductID = product.ProductID;
                        item.Product = product;
                        item.Quanlity = 1;
                        list.Add(item);
                    }
                    else
                    {
                        list = (List<Cart>)cart;
                        if(list.Exists(x=>x.Product.ProductID == id))
                        {
                            foreach(var item in list)
                            {
                                if(item.Product.ProductID == id)
                                {
                                    if(item.Product.Quanlity > item.Quanlity)
                                    {
                                        item.Quanlity += 1;
                                    }
                                }
                            }
                        }
                        else
                        {
                            var item = new Cart();
                            item.ProductID = product.ProductID;
                            item.Product = product;
                            item.Quanlity = 1;
                            list.Add(item);
                        }
                    }
                    Session[CommonConstants.CART_SESSION] = list;
                    return RedirectToAction("Index");
                }
                else
                {
                    var cart = new CartDAO().ListCart(customerSession.ID);
                    if (cart != null)
                    {
                        var cartDAO = new CartDAO();
                        bool resultCart = false;
                        var checkCart = cartDAO.CheckItem(product.ProductID, customerSession.ID);
                        if (checkCart != null)
                        {
                            if(product.Quanlity > checkCart.Quanlity)
                            {
                                checkCart.Quanlity += 1;
                                resultCart = cartDAO.Update(checkCart);
                            }
                        }
                        else
                        {
                            var cartItem = new Cart() { ProductID = product.ProductID, Quanlity = 1, CustomerID = customerSession.ID};
                            resultCart = cartDAO.Insert(cartItem);                    
                        }
                        if (resultCart)
                        {
                            return Redirect("/vo-hang");
                        }
                    }
                }
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            var customerSession = (CustomerLogin)Session[Common.CommonConstants.CUSTOMER_SESSION];
            bool result = false;
            if(customerSession != null)
            {
                result = new CartDAO().DeleteByProductID(id, customerSession.ID);
            }
            else
            {
                var list = (List<Cart>)Session[CommonConstants.CART_SESSION];
                foreach(var item in list)
                {
                    if(item.ProductID == id)
                    {
                        list.Remove(item);
                        result = true;
                        break;
                    }               
                }
                Session[CommonConstants.CART_SESSION] = list;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult UpdateQuanlity(int productID, int? quanlity)
        {
            bool result = false;
            var dao = new CartDAO();
            var customerSession = (CustomerLogin)Session[Common.CommonConstants.CUSTOMER_SESSION];
            var checkQuanlity = new ProductDAO().CheckQuanlity(productID, quanlity);
            if (!checkQuanlity || quanlity == null)
            {
                quanlity = 1;
            }
            if (customerSession != null)
            {      
                dao.UpdateQuanlityByProductID(productID, customerSession.ID, quanlity);
                result = true;
            }
            else
            {
                var list = (List<Cart>)Session[CommonConstants.CART_SESSION];            
                foreach (var item in list)
                {
                    if (item.ProductID == productID)
                    {
                        item.Quanlity = quanlity;
                        result = true;
                        break;
                    }
                }
                Session[CommonConstants.CART_SESSION] = list;
            }
            return Json(result);
        }
    }
}