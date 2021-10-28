using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataProvider
{
    public class AdminDAO
    {
        private GearShopDbContext context = null;
        public AdminDAO()
        {
            context = new GearShopDbContext();
        }
        public int Insert(Admin entity)
        {
            context.Admins.Add(entity);
            int count = context.SaveChanges();
            return count;
        }
        public Admin GetByUsername(string username)
        {
            return context.Admins.SingleOrDefault(x => x.Username == username);
        }
        public int Login(string username, string password)
        {
            var result = context.Admins.SingleOrDefault(x => x.Username == username);
            if(result == null)
            {
                return 0;
            }
            else
            {
                if(result.Password == password)
                {
                    return 1;
                }
                else
                {
                    return -1;
                }
            }
        }
    }
}
