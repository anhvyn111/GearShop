using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreDemo.Common;
using DataProvider;
using DataProvider.DAO;

namespace StoreDemo.Areas.Admin.Controllers
{
    public class CustomerController : BaseController
    {
        // GET: Admin/Customer
        public ActionResult Index(string searchString, int page = 1, int pageSize = 2)
        {
            var dao = new CustomerDAO();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            @ViewBag.Search = searchString;
            return View(model);
        }
    }
}