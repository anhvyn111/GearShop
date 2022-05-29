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
            //Kiểm tra sản phẩm có tồn tại không
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
                    //Nếu vỏ hàng đã có sản phẩm
                    else
                    {
                        list = (List<Cart>)cart;
                        //Kiểm tra sản phẩm đã có trong vỏ hàng chưa
                        //Nếu có thì cộng thêm số lượng của sản phẩm lên thêm 1
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
                        //Nếu chưa có trong vỏ hảng thì thêm sản phẩm vào vỏ hàng
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
                //Nếu khách hàng đã đăng nhập
                else
                {
                    //Lấy những sản phẩm trong vỏ hảng ở session vào database vỏ hàng của khách hàng
                    var cart = new CartDAO().ListCart(customerSession.ID);
                    if (cart != null)
                    {
                        var cartDAO = new CartDAO();
                        bool resultCart = false;
                        var checkCart = cartDAO.CheckItem(product.ProductID, customerSession.ID);
                        //Nếu sản phẩm đã có trong vỏ hàng thì cộng thêm số lượng 1 cho sản phẩm
                        if (checkCart != null)
                        {
                            if(product.Quanlity > checkCart.Quanlity)
                            {
                                checkCart.Quanlity += 1;
                                resultCart = cartDAO.Update(checkCart);
                            }
                        }
                        //Nếu chưa thì thêm sản phẩm vào database vỏ hàng
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
            //Nếu số lượng sản phẩm không đủ thì chỉnh số lượng trong vỏ là 1
            if (!checkQuanlity || quanlity == null)
            {
                quanlity = 1;
            }
            //Nếu khách hàng đã đăng nhập thì update lại database vỏ hàng
            if (customerSession != null)
            {      
                dao.UpdateQuanlityByProductID(productID, customerSession.ID, quanlity);
                result = true;
            }
            //Nếu không thì update lại số lượng trong session vỏ hàng
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