using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StoreDemo.Common;
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
        public Customer GetByEmail(string email)
        {
            return context.Customers.Where(x => x.Email == email).FirstOrDefault();
        }
        public int Login(string email, string password)
        {
            var result = context.Customers.SingleOrDefault(x => x.Email == email);
            if (result != null)
            {
                if (result.Password == password)
                {
                    if(result.Status == 1)
                    {
                        return 1;
                    }
                    else
                    {
                        return -1;
                    }
                }
            }
            return 0;
        }

        public bool Update(Customer customer)
        {
            var editCustomer = context.Customers.Find(customer.CustomerID);
            editCustomer.FullName = customer.FullName;
            editCustomer.Gender = customer.Gender;
            editCustomer.Birth = customer.Birth;
            editCustomer.PhoneNumber = customer.PhoneNumber;
            int i = context.SaveChanges();
            if(i > 0)
            {
                return true;
            }
            return false;
        }

        public bool Insert(Customer customer)
        {
            context.Customers.Add(customer);
            int i = context.SaveChanges();
            if(i > 0)
            {
                return true;
            }
            return false;
        }

        public Customer GetByID(int id)
        {
            return context.Customers.Where(x => x.CustomerID == id).FirstOrDefault();
        }
    }
}
