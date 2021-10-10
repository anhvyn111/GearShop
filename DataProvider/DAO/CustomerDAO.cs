using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
namespace DataProvider.DAO
{
    public class CustomerDAO
    {
        private GearShopDbContext context = null;
        public CustomerDAO()
        {
            context = new GearShopDbContext();
        }
        public IEnumerable<Customer> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Customer> model = context.Customers;
            if (!string.IsNullOrEmpty(searchString))
            {
                return context.Customers.Where(x=>x.Email.Contains(searchString)|| x.FullName.Contains(searchString)).OrderByDescending(x => x.CustomerID).ToPagedList(page, pageSize);
            }
            else
            {
                return context.Customers.OrderByDescending(x => x.CustomerID).ToPagedList(page, pageSize);
            }
        }
    }
}
