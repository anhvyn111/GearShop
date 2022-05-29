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
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }
        public ActionResult Information()
        {
            var customerSession = (CustomerLogin)Session[CommonConstants.CUSTOMER_SESSION];
            if(customerSession != null) 
            {
                var information = new CustomerDAO().GetByID(customerSession.ID);
                var customer = new Customer() { FullName = information.FullName, Birth = information.Birth, PhoneNumber = information.PhoneNumber, Gender = information.Gender};
                return View(customer);
            }
            return Redirect("/dang-nhap");
        }

        [HttpPost]
        public ActionResult Edit(Customer customer)
        {
            if(!String.IsNullOrEmpty(customer.FullName))
            {
                var customerSession = (CustomerLogin)Session[CommonConstants.CUSTOMER_SESSION];
                customer.CustomerID = customerSession.ID;
                var dao = new CustomerDAO();
                var result = dao.Update(customer);
                if (result)
                {
                    return Redirect("/");
                }
            }
            else
            {
                ModelState.AddModelError("", "Vui lòng nhập tên người dùng");
            }
            return Redirect("/tai-khoan");
        }

        public ActionResult Order()
        {
            string orderSuccess = TempData["orderSuccess"] as string;
            if (orderSuccess == "success")
            {
                ViewBag.OrderSuccess = orderSuccess;
            }
            var customerSession = (CustomerLogin)Session[CommonConstants.CUSTOMER_SESSION];
            var orderList = new List<ProductOrder>();
            if(customerSession != null)
            {
                orderList = new OrderDAO().ListOrder(customerSession.ID);
            }        
            return View(orderList);
        }

        public ActionResult OrderDetail(int id)
        {
            var customerSession = (CustomerLogin)Session[CommonConstants.CUSTOMER_SESSION];
            var dao = new OrderDAO();
            var order = dao.GetByID(id, customerSession.ID);
            if (order != null)
            {
                order = dao.ListOrderDetail(id);
            }
            return View(order);
        }
    }
}