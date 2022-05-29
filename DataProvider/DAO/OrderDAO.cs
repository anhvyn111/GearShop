using DataProvider.Framework;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
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
            foreach (var item in listCart)
            {
                long? price = item.Product.Price;
                if (item.Product.PromotionPrice > 0)
                {
                    price = item.Product.PromotionPrice;
                }
                order.OrderDetails.Add(new OrderDetail() { ProductID = item.ProductID, Quanlity = item.Quanlity, Price = price });
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

        public IEnumerable<ProductOrder> ListOrderByStatus(int id, int page, int pageSize)
        {
            return context.ProductOrders.Where(x => x.Status == id).OrderByDescending(x => x.OrderDate).ToPagedList(page, pageSize);
        }
        public List<ProductOrder> ListOrder(int customerID)
        {
            return context.ProductOrders.Where(x => x.CustomerID == customerID).OrderByDescending(x => x.OrderDate).ToList();
        }
        public ProductOrder GetByID(int orderID, int customerID)
        {
            return context.ProductOrders.Where(x => x.OrderID == orderID && x.CustomerID == customerID).SingleOrDefault();
        }

        public void UpdateStatus(int id, int status)
        {
            var order = context.ProductOrders.Find(id);
            order.Status = status;
            context.SaveChanges();
        }

        public ProductOrder ListOrderDetail(int orderID)
        {
            return context.ProductOrders.Where(x => x.OrderID == orderID).Include(x => x.OrderDetails.Select(p => p.Product)).FirstOrDefault();
        }


        //Admin

        public ProductOrder GetOrder(int id)
        {
            var order = context.ProductOrders.Find(id);
            return order;
        }

        public List<ProductOrder> ListOrderAdmin()
        {
            return context.ProductOrders.Where(x => x.Status == 0).Include(x=>x.Customer).OrderBy(x => x.OrderDate).ToList();
        }

        public IEnumerable<ProductOrder> ListRevenueByDate(string fromDate, string toDate, int page, int pageSize)
        {
            DateTime toDateTime;
            var query = context.ProductOrders.Where(x => x.Status == 2);
            if (!string.IsNullOrEmpty(fromDate))
            {
                DateTime fromDateTime = DateTime.Parse(fromDate, new CultureInfo("en-US", true));
                fromDateTime = fromDateTime.Date;
                query = context.ProductOrders.Where(x => x.OrderDate >= fromDateTime && x.Status == 2);
            }
            if (!string.IsNullOrEmpty(toDate) && !DateTime.TryParse(toDate, out toDateTime))
            {
                toDateTime = toDateTime.Date.AddDays(1).AddTicks(-1);
                query = query.Where(x => x.OrderDate <= toDateTime);
            }
            return query.OrderByDescending(x => x.OrderDate).ToPagedList(page, pageSize);
        }
    }
}
