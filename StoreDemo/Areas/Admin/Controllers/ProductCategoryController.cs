using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataProvider.Framework;
using DataProvider.DAO;
using StoreDemo.Common;

namespace StoreDemo.Areas.Admin.Controllers
{
    public class ProductCategoryController : BaseController
    {
        // GET: Admin/ProductCategory
        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            var dao = new ProductCategoryDAO();
            var model = dao.ListAllPaging(page, pageSize);
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(ProductCategory productCategory)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductCategoryDAO();
                var user = (UserLogin)Session[CommonConstants.USER_SESSION];
                productCategory.ModifiedBy = user.username;
                productCategory.ModifiedDate = DateTime.Now;
                productCategory.Status = true;
                long id = dao.Insert(productCategory);
                if(id > 0)
                {
                    return RedirectToAction("Index", "ProductCategory");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thể loại thất bại");
                }
            }
            else
            {
                ModelState.AddModelError("", "Vui lòng nhập đầy đủ thông tin");
            }
            return View("Index");
        }
    }
}