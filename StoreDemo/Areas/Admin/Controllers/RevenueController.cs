using DataProvider.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreDemo.Areas.Admin.Controllers
{
    public class RevenueController : Controller
    {
        // GET: Admin/Revenue
        public ActionResult Index(string fromDate, string toDate, int page = 1, int pageSize = 10)
        {
            var list = new OrderDAO().ListRevenueByDate(fromDate, toDate, page, pageSize);
            return View(list);
        }
    }
}