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
            return View(list);
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
                                    item.Quanlity += 1;
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
                            checkCart.Quanlity += 1;
                            resultCart = cartDAO.Update(checkCart);
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
    }
}