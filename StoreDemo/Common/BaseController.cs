using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace StoreDemo.Common
{
    public class BaseController : Controller
    {
        // GET: Base
        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var session = (AdminLogin)Session[CommonConstants.ADMIN_SESSION];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", action = "Index", Area = "Admin" }));
            }
            base.OnActionExecuted(filterContext);
        }
    }
}