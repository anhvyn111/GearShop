using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataProvider.DAO;
using DataProvider.Framework;
using StoreDemo.Areas.Admin.Models;
using StoreDemo.Common;
namespace StoreDemo.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index(string search, int page = 1, int pageSize = 10)
        {
            var dao = new ProductDAO();
            var model = dao.ListAllPaging(search, page, pageSize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Product product, ProductImage productImage, List<HttpPostedFileBase> images)
        {
            if (ModelState.IsValid)
            {
                var user = (UserLogin)Session[CommonConstants.USER_SESSION];
                var productDAO = new ProductDAO();
                product.ModifiedDate = DateTime.Now;
                product.Status = true;
                product.ModifiedBy = user.username;
                long productID = productDAO.Insert(product);
                if (productID > 0)
                {
                    var imageDAO = new ProductImageDAO();
                    string productFolder = "~/Images/Products/";
                    productImage.ProductID = (int)productID;
                    int i = imageDAO.CountImages();
                    foreach (var file in images)
                    {
                        string extensionName = Path.GetExtension(file.FileName);
                        string fileName = productID + "_" + i + extensionName;
                        var serverSavePath = Path.Combine(Server.MapPath(productFolder) + fileName);
                        file.SaveAs(serverSavePath);
                        productImage.ImageName = fileName;
                        imageDAO.Insert(productImage);
                        i += 1;
                    }
                    return RedirectToAction("Index", "Product");    
                }
                else
                {
                    ModelState.AddModelError("", "Vui lòng nhập đày đủ thông tin");
                }
            }
            else
            {
                ModelState.AddModelError("", "Thêm sản phẩm thất bại");
            }
            SetViewBag();
            return View("Index");
        }

        public JsonResult LoadDetail(int id)
        {
            ProductDAO productDAO = new ProductDAO();
            var product = productDAO.ViewDetail(id);
            var categoryDAO = new ProductCategoryDAO();
            var category = categoryDAO.GetByID(product.Category);
            var result = new { product = product, category = category};
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult LoadImages(int id)
        {
            ProductImageDAO dao = new ProductImageDAO();
            List<ProductImage> imageList = dao.ListImages(id);
            return Json(imageList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult UploadImages()
        {
            int sql = 0;
            for (int i = 0; i < Request.Files.Count; i++)
            {
                HttpPostedFileBase file = Request.Files[i];
                int id = 29;
                string path = Server.MapPath("~/Images/Product/");
                ProductImageDAO dao = new ProductImageDAO();

                int count = dao.CountImages();
                ProductImage model = new ProductImage();
                string extensionName = Path.GetExtension(file.FileName);
                string fileName = id + "_" + count + extensionName;
                var serverSavePath = Path.Combine(path + fileName);
                file.SaveAs(serverSavePath);
                model.ImageName = file.FileName;
                model.ProductID = id;
                sql = dao.Insert(model);
                //foreach (var file in files)
                //{
                //}
            }

            return Json("Upload " + sql);
        }
        public JsonResult DeleteImages(int id)
        {
            ProductImageDAO dao = new ProductImageDAO();
            var image = dao.GetByID(id);
            dao.DeleteImage(image);
            var fullPath = Server.MapPath("~/Images/Products/" + image.ImageName);
            string filePath = Server.MapPath("~/Images/Products/");
            if (System.IO.File.Exists(fullPath))
            {
                System.IO.File.Delete(fullPath);
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Edit(int id) {
            var model = new ProductDAO().ViewDetail(id);
            SetViewBag(model.Category);
            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                var user = (UserLogin)Session[CommonConstants.USER_SESSION];
                var productDAO = new ProductDAO();
                product.ModifiedDate = DateTime.Now;
                product.ModifiedBy = user.username;
                var updateProduct = productDAO.Update(product);
                if (updateProduct == true)
                {
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật sản phẩm thất bại");
                }
            }
            else
            {
                ModelState.AddModelError("", "Vui lòng điền đầy đủ thông tin");
            }
            SetViewBag();
            return View();
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            var productDAO = new ProductDAO();
            var status = productDAO.Delete(id);
            if (status)
            {
                var imageDAO = new ProductImageDAO();
                List<ProductImage> imageList = imageDAO.ListImages(id);
                if (imageList.Count > 0)
                {
           
                    string filePath = Server.MapPath("~/Images/Products/");
                    foreach (var image in imageList)
                    {
                        System.IO.File.Delete(filePath + image.ImageName);
                        imageDAO.DeleteImage(image);
                    }

                }
                return RedirectToAction("Index", "Product");
            }
            else
            {
                ModelState.AddModelError("", "Đã có lỗi xảy ra");
            }
            return View();
        }
        public void SetViewBag(long? selectID = null)
        {
            var dao = new ProductCategoryDAO();
            ViewBag.Category = new SelectList(dao.ListAll(), "ID", "CategoryName", selectID);
        }
    } 
}   