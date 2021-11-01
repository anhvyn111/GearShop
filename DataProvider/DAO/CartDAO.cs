using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataProvider.DAO
{
    public class CartDAO
    {
        private GearShopDbContext context = null;
        public CartDAO()
        {
            context = new GearShopDbContext();
        }

        public bool Insert(Cart cart)
        {
            context.Carts.Add(cart);
            var i = context.SaveChanges();
            if(i > 0)
            {
                return true;
            }
            return false;
        }
        public Cart CheckItem(int? productID, int customerID)
        {
            return context.Carts.Where(x => x.ProductID == productID && x.CustomerID == customerID).SingleOrDefault();
        }
        public bool Update(Cart cart)
        {
            var result = cart;
            var i = context.SaveChanges();
            if(i > 0)
            {
                return true;
            }
            return false;
        }
        public List<Cart> ListCart(int customerID)
        {
            var list = context.Carts.Where(x => x.CustomerID == customerID).ToList();
            foreach(var item in list)
            {
                item.Product = new ProductDAO().GetByID(item.ProductID);
            }
            return list;
        }
        public bool CheckQuanlity(int? id, int? quanlity)
        {
            var product = context.Carts.Where(x => x.ProductID == id).FirstOrDefault();
            if(product.Quanlity >= quanlity)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public void UpdateQuanlity(int? id, int? quanlity)
        {
            
            
        } 
        public void UpdateQuanlityByProductID(int productID, int customerID, int? quanlity)
        {
            var cartItem = context.Carts.Where(x => x.ProductID == productID && x.CustomerID == quanlity).FirstOrDefault();
            cartItem.Quanlity = quanlity;
            context.SaveChanges();
        }
        public void Delete(int cartID)
        {
            var cart = context.Carts.Where(x=>x.CartID == cartID).FirstOrDefault();
            context.Carts.Remove(cart);
            context.SaveChanges();
        }

        public bool DeleteByProductID(int? productID, int customerID)
        {
            var cart = context.Carts.Where(x => x.ProductID == productID && x.CustomerID == customerID).FirstOrDefault();
            if(cart != null)
            {
                context.Carts.Remove(cart);
                int i = context.SaveChanges();
                if(i > 0)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
