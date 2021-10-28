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
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult DataTable(string search, int page = 1, int pageSize = 10)
        {
            var dao = new ProductDAO();
            var model = dao.ListAllPaging(search, page, pageSize);
            ViewBag.Search = search;
            return PartialView(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Product product, ProductImage productImage, List<HttpPostedFileBase> images, List<string> CheckBoxTags)
        {
            if (!String.IsNullOrEmpty(product.ProductName) && product.CategoryID != null && product.Price != null && !String.IsNullOrEmpty(product.Description) && !String.IsNullOrEmpty(product.Detail) && images.Count > 0)
            {
                var productDAO = new ProductDAO();
                bool checkName = productDAO.CheckNameExist(product.ProductName, 0);
                if (!checkName)
                {
                    ModelState.AddModelError("", "Tên sản phẩm đã tồn tại.");
                }
                else
                {
                    var user = (AdminLogin)Session[CommonConstants.ADMIN_SESSION];
                    product.ModifiedBy = user.username;
                    string productFolder = "~/Images/Products/";
                    foreach (var file in images)
                    {
                        if (file.ContentLength > 0 && file.FileName != null)
                        {
                            string extensionName = Path.GetExtension(file.FileName);
                            string fileName = Guid.NewGuid().ToString() + "_" + extensionName;
                            var serverSavePath = Path.Combine(Server.MapPath(productFolder) + fileName);
                            file.SaveAs(serverSavePath);
                            product.ProductImages.Add(new ProductImage { ImageName = fileName, ImagePath = productFolder });
                        }
                    }
                    if (CheckBoxTags.Count > 0)
                    {
                        foreach (var tag in CheckBoxTags)
                        {
                            if(tag != "")
                            {
                                product.ProductTags.Add(new DataProvider.Framework.ProductTag { TagID = tag, ProductID = product.ProductID });
                            }
                        }
                    }
                    long productID = productDAO.Insert(product);
                    return RedirectToAction("Index", "Product");
                }
            }
            else
            {
                ModelState.AddModelError("", "Vui lòng nhập đầy đủ thông tin");
            }
            SetViewBag();
            return View("Create");
        }

        [HttpGet]
        public JsonResult LoadDetail(int id)
        {
            var productDAO = new ProductDAO();
            var product = productDAO.ViewDetailAdmin(id);
            var categoryDAO = new ProductCategoryDAO();
            var category = categoryDAO.GetByID(product.CategoryID);
            var response = new { product = product, category = category};
            return Json(response, JsonRequestBehavior.AllowGet);
        }

        public JsonResult LoadImages(int id)
        {
            ProductImageDAO dao = new ProductImageDAO();
            List<ProductImage> imageList = dao.ListImages(id);
            return Json(imageList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult UploadImages()
        {     
            bool result = false;
            if (Request.Files.Count > 0)
            {
                int id = 1016;
                var files = Request.Files;
                ProductImageDAO dao = new ProductImageDAO();
                int count = dao.CountImages();
                //iterating through multiple file collection   
                foreach (string str in files)
                {
                    HttpPostedFileBase file = Request.Files[str] as HttpPostedFileBase;
                    //Checking file is available to save.  
                    string path = Server.MapPath("~/Images/Products/");
                    ProductImage model = new ProductImage();
                    string extensionName = Path.GetExtension(file.FileName);
                    string fileName = Guid.NewGuid() + "_" + count + extensionName;
                    var serverSavePath = Path.Combine(path + fileName);
                    file.SaveAs(serverSavePath);
                    model.ImageName = file.FileName;
                    model.ProductID = id;
                    int status = dao.Insert(model);        
                    count += 1;
                }
                result = true;
            }    
            else
            {
                result = false;
            }
            return Json(result);
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
            var model = new ProductDAO().ViewDetailAdmin(id);
            SetViewBag(model.CategoryID);
            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Product product, List<string> CheckBoxTags = null)
        {
            if (!String.IsNullOrEmpty(product.ProductName) && product.Price != null && !String.IsNullOrEmpty(product.Description) && !String.IsNullOrEmpty(product.Detail))
            {
                var productDAO = new ProductDAO();
                bool checkName = productDAO.CheckNameExist(product.ProductName, product.ProductID);
                if (!checkName)
                {
                    ModelState.AddModelError("", "Tên sản phẩm đã tồn tại.");
                }
                else
                {
                    var user = (AdminLogin)Session[CommonConstants.ADMIN_SESSION];
                    productDAO.DeleteAllProductTag(product.ProductID);
                    if (CheckBoxTags.Count > 0)
                    {
                        foreach (var tag in CheckBoxTags)
                        {
                            if (tag != null)
                            {
                                product.ProductTags.Add(new DataProvider.Framework.ProductTag { TagID = tag, ProductID = product.ProductID });
                            }
                        }
                    }
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
            }
            else
            {
                ModelState.AddModelError("", "Vui lòng điền đầy đủ thông tin");
            }
            SetViewBag();
            return View();
        }

        [HttpPost]
        public ActionResult ChangeStatus(int id)
        {
            bool result = false;
            var dao = new ProductDAO();
            var product = dao.GetByID(id);
            if(product != null)
            {
                if (product.Status == true)
                {
                    product.Status = false;
                }
                else
                {
                    product.Status = true;
                }
                result = dao.ChangeStatus(product);
            }
            return Json(result);
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            var productDAO = new ProductDAO();
            Product model = new Product();
            var status = productDAO.Delete(model);
            if (status == 1)
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
            ViewBag.Category = new SelectList(dao.ListAll(), "CategoryID", "CategoryName", selectID);
        }

        public JsonResult ListEditTagsByCategory(int? id, int productID) {
            var listAllTag = new TagDAO().ListEditTagsByCategory(id, productID);
            return Json(listAllTag, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ListCreateTagsByCategory(int? id)
        {
            var listAllTag = new TagDAO().ListCreateTagsByCategory(id);
            return Json(listAllTag, JsonRequestBehavior.AllowGet);
        }
        public JsonResult CheckNameExist(string name, int id)
        {
            bool status = new ProductDAO().CheckNameExist(name, id);
            return Json(status, JsonRequestBehavior.AllowGet);
        }
    } 
}   