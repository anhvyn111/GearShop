using DataProvider;
using StoreDemo.Areas.Admin.Models;
using StoreDemo.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace StoreDemo.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        [HttpGet]
        public ActionResult Index()
        {
            if(Session[CommonConstants.ADMIN_SESSION] == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new AdminDAO();
                var result = dao.Login(model.username, Encryptor.MD5Hash(model.password));
                if (result == 1)
                {
                    var userSession = new AdminLogin();
                    var user = dao.GetByUsername(model.username);
                    userSession.username = user.Username;
                    Session.Add(CommonConstants.ADMIN_SESSION, userSession);
                    return Redirect("/admin/don-hang");
                }    
                else if(result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không chính xác");

                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không chính xác");
                }
            }
            else
            {
                ModelState.AddModelError("", "Vui lòng nhập tài khoản và mật khẩu");
            }
            return View("Index");
        }
        public ActionResult Logout()
        {
            Session[CommonConstants.ADMIN_SESSION] = null;
            if(Session[CommonConstants.ADMIN_SESSION] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            return View();
        }
    }
}