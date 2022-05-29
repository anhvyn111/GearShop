using DataProvider.DAO;
using DataProvider.Framework;
using StoreDemo.Common;
using StoreDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreDemo.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            if(Session[CommonConstants.CUSTOMER_SESSION] != null)
            {
                return Redirect("/");
            }
            return View();
        }
        [ChildActionOnly]
        public ActionResult Login()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public ActionResult Register()
        {
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Login model)
        {
            var dao = new CustomerDAO();
            var result = dao.Login(model.Email, Encryptor.MD5Hash(model.Password));
            if (result == 1)
            {
                var customer = dao.GetByEmail(model.Email);
                CustomerLogin customerSession = new CustomerLogin() { ID = customer.CustomerID, Email = customer.Email, FullName = customer.FullName };
                Session.Add(CommonConstants.CUSTOMER_SESSION, customerSession);
                if(Session[CommonConstants.CART_SESSION] != null)
                {
                    var list = (List<Cart>)Session[CommonConstants.CART_SESSION];
                    var resultCart = InsertCart(list, customer.CustomerID);
                    if (resultCart)
                    {
                        Session[CommonConstants.CART_SESSION] = null;
                    }
                }
                return Redirect("/");
            }
            else if(result == 0)
            {
                ViewBag.LoginError = 1;
                ModelState.AddModelError("", "Email hoặc mật khẩu không chính xác");
            }
            else if(result == -1)
            {
                ViewBag.LoginError = 1;
                ModelState.AddModelError("", "Tài khoản đã bị khóa");
            }
            return View("Index");
        }
        [HttpPost]
        public ActionResult Register(Register register)
        {
            var dao = new CustomerDAO();
            var customer = dao.GetByEmail(register.Email);
            if(customer == null)
            {
                if (register.Password == register.ConfirmPassword)
                {
                    var newCustomer = new Customer() { FullName = register.FullName, Email = register.Email, Password = Common.Encryptor.MD5Hash(register.Password), Status = 1 };
                    var result = dao.Insert(newCustomer);
                    if (result)
                    {
                        customer = dao.GetByEmail(register.Email);
                        CustomerLogin customerSession = new CustomerLogin() { ID = customer.CustomerID, Email = customer.Email, FullName = customer.FullName };
                        Session.Add(CommonConstants.CUSTOMER_SESSION, customerSession);
                        if(Session[CommonConstants.CART_SESSION] != null)
                        {
                            var list = (List<Cart>)Session[CommonConstants.CART_SESSION];
                            var resultCart = InsertCart(list, customer.CustomerID);
                            if (resultCart)
                            {
                                Session[CommonConstants.CART_SESSION] = null;
                            }
                        }
                        return Redirect("/");
                    }
                    else
                    {
                        ViewBag.RegisterError = 1;
                        ModelState.AddModelError("", "Đã có lỗi xảy ra, vui lòng thử lại");
                    }
                }
                else
                {
                    ViewBag.RegisterError = 1;
                    ModelState.AddModelError("", "Mật khẩu không trùng nhau");
                }
            }
            else
            {
                ViewBag.RegisterError = 1;
                ModelState.AddModelError("", "Email đã tồn tại");
            }
            return View("Index");
        }
        public bool InsertCart(List<Cart> list, int customerID)
        {
            var cartDAO = new CartDAO();
            bool resultCart = false;
            foreach (var item in list)
            {
                var cartItem = cartDAO.CheckItem(item.ProductID, customerID);
                if (cartItem != null)
                {
                    cartItem.Quanlity += item.Quanlity;
                }
                else
                {
                    var newCart = new Cart();
                    newCart.ProductID = item.ProductID;
                    newCart.Quanlity = item.Quanlity;
                    newCart.CustomerID = customerID;
                    resultCart = cartDAO.Insert(newCart);
                }
            }
            return resultCart;
        }
        public ActionResult Logout()
        {
            Session[CommonConstants.CUSTOMER_SESSION] = null;
            return Redirect("/dang-nhap");
        }
    }
}