using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataProvider.DAO
{
    public class OrderDAO
    {
        GearShopDbContext context = null;
        public OrderDAO()
        {
            context = new GearShopDbContext();
        }
        public bool Insert(ProductOrder order)
        {
            var listCart = new CartDAO().ListCart(order.CustomerID);
            foreach(var item in listCart)
            {
                long? price = item.Product.Price;
                if(item.Product.PromotionPrice > 0)
                {
                    price = item.Product.PromotionPrice;
                }
                order.OrderDetails.Add(new OrderDetail() {ProductID = item.ProductID, Quanlity = item.Quanlity, Price = price});
                new CartDAO().Delete(item.CartID);
            }
            context.ProductOrders.Add(order);
            int result = context.SaveChanges();
            if (result > 0)
            {
                return true;
            }
            return false;
        }
    }
}
