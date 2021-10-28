using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace StoreDemo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
               name: "Thanh toán",
               url: "thanh-toan",
               defaults: new { controller = "CheckOut", action = "Index" }, namespaces: new[] { "StoreDemo.Controllers" }
           );
            routes.MapRoute(
               name: "Đăng ký và đăng nhập",
               url: "dang-nhap",
               defaults: new { controller = "Login", action = "Index"}, namespaces: new[] { "StoreDemo.Controllers" }
           );
            routes.MapRoute(
               name: "Add to cart",
               url: "add-to-cart",
               defaults: new { controller = "Cart", action = "Add", id = UrlParameter.Optional }, namespaces: new[] { "StoreDemo.Controllers" }
           );
            routes.MapRoute(
               name: "Cart",
               url: "vo-hang",
               defaults: new { controller = "Cart", action = "Index" }, namespaces: new[] { "StoreDemo.Controllers" }
           );
            routes.MapRoute(
               name: "Product Collection",
               url: "collection/{id}",
               defaults: new { controller = "Product", action = "Collection", id = UrlParameter.Optional }, namespaces: new[] { "StoreDemo.Controllers" }
           );
            routes.MapRoute(
               name: "Product Detail",
               url: "san-pham/{id}",
               defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional }, namespaces: new[] { "StoreDemo.Controllers" }
           );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }, namespaces: new[] {"StoreDemo.Controllers"}
            );

           
        }
    }
}
