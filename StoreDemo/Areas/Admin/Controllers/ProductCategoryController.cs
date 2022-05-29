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
        public ActionResult Index()
        {
            SetViewBag();
            return View();
        }
        public ActionResult DataTable(int page = 1, int pageSize = 5)
        {
            var dao = new ProductCategoryDAO();
            var model = dao.ListAllPaging(page, pageSize);
            return View(model);
        }

        [HttpPost]
        public JsonResult Create(string name, int? menuID)
        {
            int res = 2;
            if (name != "" && menuID != null)
            {
                var dao = new ProductCategoryDAO();
                string metaTitle = Common.StringHelper.ToUnsignMeta(name);
                bool checkNameExist = dao.CheckNameExist(metaTitle, 0);
                if (checkNameExist == true)
                {
                    ProductCategory productCategory = new ProductCategory();
                    var user = (AdminLogin)Session[CommonConstants.ADMIN_SESSION];
                    productCategory.CategoryName = name;
                    productCategory.ModifiedBy = user.username;
                    productCategory.ModifiedDate = DateTime.Now;
                    productCategory.Status = true;
                    productCategory.MetaTitle = metaTitle;
                    long id = dao.Insert(productCategory);
                    if (id > 0)
                    {
                        res = 1;
                    }
                    else
                    {
                        res = -1;
                    }
                }
                else
                {
                    res = 0;    
                }     
            }
            else
            {
                res = -2;
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if(id == null)
            {
                return View();
            }
            else
            {
                var cate = new ProductCategoryDAO().GetByID(id);
                if(cate != null)
                {
                    SetViewBag(id);
                    return View(cate);
                }
            }
            return View();
        }

        [HttpPost]
        public JsonResult Edit(int id, string name, int menuId) 
        {
            int res = 2;
            if(id > 0 && name != "" && menuId > 0)
            {
                var dao = new ProductCategoryDAO();
                string metaTitle = Common.StringHelper.ToUnsignMeta(name);
                bool checkNameExist = dao.CheckNameExist(metaTitle, id);
                if (checkNameExist == true)
                {
                    ProductCategory productCategory = new ProductCategory();
                    var user = (AdminLogin)Session[CommonConstants.ADMIN_SESSION];
                    var productCate = dao.GetByID(id);
                    if (productCate != null)
                    {
                        productCate.CategoryName = name;
                        productCate.MenuID = menuId;
                        productCate.MetaTitle = metaTitle;
                        var result = dao.Update(productCate);
                        if (result) { res = 1; }
                        else { res = -1; }
                    }
                }
                else
                {
                    res = 0;
                }
                
            }
            else
            {
                res = -2;
            }
            return Json(res);
        }
        public void SetViewBag(long? selectID = null)
        {
            var dao = new MenuDAO();
            ViewBag.Menu = new SelectList(dao.ListAll(), "MenuID", "MenuName", selectID);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            var result = new ProductCategoryDAO().Delete(id);
            return Json(result);
        }

        [HttpGet]
        public JsonResult GetCategory(int? id)
        {
            var dao = new ProductCategoryDAO();
            var cate = dao.GetByID(id);
            var list = dao.ListMenuEditCatogry(cate.MenuID);
            var result = new { cate = cate, list = list };
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}