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
            if(Session[CommonConstants.USER_SESSION] == null)
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
                var dao = new AccountDAO();
                var result = dao.Login(model.username, Encryptor.MD5Hash(model.password));
                if (result == 1)
                {
                    var userSession = new UserLogin();
                    var user = dao.GetByUsername(model.username);
                    userSession.username = user.Username;
                    userSession.userID = user.AdminID;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }    
                else if(result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");

                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Mật khẩu không chính xác");
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
            Session[CommonConstants.USER_SESSION] = null;
            return RedirectToAction("Index", "Login");
        }
    }
}