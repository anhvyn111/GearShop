using DataProvider.DAO;
using StoreDemo.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreDemo.Areas.Admin.Controllers
{
    public class OrderController : BaseController
    {
        // GET: Admin/Order
        public ActionResult Index(int id = 0, int page = 1, int pageSize = 10)
        {
            var list = new OrderDAO().ListOrderByStatus(id, page, pageSize);
            ViewBag.OrderType = id;
            return View(list);
        }

   

        [HttpGet]
        public ActionResult Detail(int id)
        {
            if(id > 0)
            {
                ViewBag.OrderID = id;
                var order = new OrderDAO().ListOrderDetail(id);
                if(order != null)
                {
                    return View(order);
                }
            }
            return Redirect("/admin/don-hang");
        }
        [HttpPost]
        public ActionResult Approve(int id)
        {
            var order = new OrderDAO().ListOrderDetail(id);
            bool result = true;
            if(order.Status == 0)
            {
                foreach(var item in order.OrderDetails)
                {
                    if(item.Quanlity > item.Product.Quanlity)
                    {
                        result = false;
                    }
                }
            }
            else
            {
                result = false;
            }
            if (result)
            {
                var productDAO = new ProductDAO();
                foreach (var item in order.OrderDetails)
                {
                    productDAO.UpdateQuanlity(item.ProductID, item.Quanlity);
                }
                new OrderDAO().UpdateStatus(id, 1);
                
            }
            string path = "/admin/xem-don-hang/" + order.OrderID;
            return Redirect(path);
        }
        [HttpPost]
        public ActionResult Cancel(int id)
        {
            var orderDAO = new OrderDAO();
            var order = orderDAO.GetOrder(id);
            if (order.Status == 1 || order.Status == 0)
            {
                orderDAO.UpdateStatus(id, -1);
                return Redirect("/admin/don-hang");
            }
            string path = "/admin/xem-don-hang/" + order.OrderID;
            return Redirect(path);
        }

        [HttpPost]
        public ActionResult Delivered(int id)
        {
            var orderDAO = new OrderDAO();
            var order = orderDAO.GetOrder(id);
            if (order.Status == 1)
            {
                orderDAO.UpdateStatus(id, 2);
            }
            string path = "/admin/xem-don-hang/" + order.OrderID;
            return Redirect(path);
        }
    }
}