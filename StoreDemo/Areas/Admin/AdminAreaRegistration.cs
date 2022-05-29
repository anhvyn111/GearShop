using System.Web.Mvc;

namespace StoreDemo.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Revenue",
                "admin/doanh-thu",
                new { controller = "Revenue", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Order Detail",
                "admin/xem-don-hang/{id}",
                new { controller = "Order", action = "Detail", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Orders",
                "admin/don-hang",
                new { controller = "Order", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Customer",
                "admin/khach-hang/{action}/{id}",
                new { controller = "Customer", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Product Categories",
                "admin/danh-muc-san-pham/{id}",
                new { controller = "ProductCategory", action = "Index", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Edit Product",
                "Admin/san-pham/chinh-sua/{id}",
                new { controller = "Product", action = "Edit", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Products",
                "Admin/san-pham/{action}/{id}",
                new { controller = "Product", action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                "Admin_Default",
                "Admin/{controller}/{action}/{id}",
                new {controller="Home",action="Index",id = UrlParameter.Optional }
            );
        }
    }
}