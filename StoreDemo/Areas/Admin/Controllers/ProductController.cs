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
        public ActionResult Create(Product product, ProductImage productImage, List<HttpPostedFileBase> images)
        {
            //Kiểm tra tất cả thông tin đã được nhập đầy đủ chưa
            if (!String.IsNullOrEmpty(product.ProductName) && product.CategoryID != null && product.Price != null && !String.IsNullOrEmpty(product.Description) && !String.IsNullOrEmpty(product.Detail) && images.Count > 0 && images[0] != null)
            {
                var productDAO = new ProductDAO();
                //Kiếm tra tên đã tồn tại hay chưa
                bool checkName = productDAO.CheckNameExist(product.ProductName, 0);
                
                if (!checkName)
                {
                    ModelState.AddModelError("", "Tên sản phẩm đã tồn tại.");
                }
                //Nếu chưa upload hình ảnh
                else if(images == null)
                {
                    ModelState.AddModelError("", "Vui lòng thêm ảnh sản phẩm.");
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
                            var supportedTypes = new[] { "jpg", "jpeg", "png" };
                            var fileExt = Path.GetExtension(file.FileName).Substring(1);
                            //Kiểm tra định dạng file có đúng jpg, jpeg hoặc png không
                            if (!supportedTypes.Contains(fileExt))
                            {
                                ModelState.AddModelError("", "Hình ảnh đăng tải không đúng định dạng jpg, jpeg hoặc png.");
                                SetViewBag();
                                return View();
                            }
                            string extensionName = Path.GetExtension(file.FileName);
                            string fileName = Guid.NewGuid().ToString() + "_" + extensionName;
                            var serverSavePath = Path.Combine(Server.MapPath(productFolder) + fileName);
                            file.SaveAs(serverSavePath);
                            product.ProductImages.Add(new ProductImage { ImageName = fileName, ImagePath = productFolder });
                        }
                    }
                  
                    long productID = productDAO.Insert(product);
                    return RedirectToAction("Index", "Product");
                }
            }
            //Báo lỗi khi chưa nhập đầy đủ thông tin
            else
            {
                ModelState.AddModelError("", "Vui lòng nhập đầy đủ thông tin");
            }
            SetViewBag();
            return View("Create");
        }

        [HttpGet]
        public ActionResult Detail(int id)
        {
            var productDAO = new ProductDAO();
            var product = productDAO.ViewDetailAdmin(id);
            var categoryDAO = new ProductCategoryDAO();
            var category = categoryDAO.GetByID(product.CategoryID);
            product.ProductCategory = category;
            return View(product);
        }

 

        public JsonResult DeleteImages(int id)
        {
            ProductImageDAO dao = new ProductImageDAO();
            var image = dao.GetByID(id);
            var product = new ProductDAO().GetByID(image.ProductID);
            if(product.ProductImages.Count > 1)
            {
                dao.DeleteImage(image);
                var fullPath = Server.MapPath("~/Images/Products/" + image.ImageName);
                if (System.IO.File.Exists(fullPath))
                {
                    System.IO.File.Delete(fullPath);
                }
                return Json(true, JsonRequestBehavior.AllowGet);
            }
           
            return Json(false, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Edit(int id) {
            var model = new ProductDAO().ViewDetailAdmin(id);
            SetViewBag(model.CategoryID);
            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Product product, List<HttpPostedFileBase> images)
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
                    if(images[0] != null && images.Count > 0)
                    {
                        var supportedTypes = new[] { "jpg", "jpeg", "png" };
                        string productFolder = "~/Images/Products/";
                        foreach (var file in images)
                        {
                            if (file.ContentLength > 0 && file.FileName != null)
                            {
                                var fileExt =Path.GetExtension(file.FileName).Substring(1);
                                if (!supportedTypes.Contains(fileExt)){
                                    ModelState.AddModelError("", "Hình ảnh đăng tải không đúng định dạng jpg, jpeg hoặc png.");
                                    product.ProductImages = new ProductImageDAO().ListImages(product.ProductID);
                                    SetViewBag();
                                    return View(product);
                                }
                                string extensionName = Path.GetExtension(file.FileName);
                                string fileName = Guid.NewGuid().ToString() + "_" + extensionName;
                                var serverSavePath = Path.Combine(Server.MapPath(productFolder) + fileName);
                                file.SaveAs(serverSavePath);
                                product.ProductImages.Add(new ProductImage { ImageName = fileName, ImagePath = productFolder });
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
            product.ProductImages = new ProductImageDAO().ListImages(product.ProductID);
            SetViewBag();
            return View(product);
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


        //Xóa sản phẩm
        [HttpPost]
        public ActionResult Delete(int id)
        {
            int status = 0;
            string message = "";
            try
            {
                var productDAO = new ProductDAO();
                Product model = new Product();
                var product = productDAO.GetByID(id);
     
                if (product != null)
                {
                    productDAO.Delete(product);
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
                    status = 1;
                    message = "Xóa sản phẩm thành công";
                }
                else
                {

                    status = -1;
                    message = "Sản phẩm không tồn tại";
                }
            }
            catch
            {
                status = 0;
                message = "Xóa sản phẩm thành công"; ;
            }

            return Json(status);
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