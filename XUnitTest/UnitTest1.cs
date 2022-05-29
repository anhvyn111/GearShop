using DataProvider.Framework;
using StoreDemo.Common;
using Xunit;

namespace XUnitTest
{
    public class UnitTest1
    {
        [Fact]   
        public void Test1()
        {
            var username = "admin";
            var password = Encryptor.MD5Hash("123456");
            var adminDAO = new DataProvider.AdminDAO();
            var result = adminDAO.Login(username, password);
            Assert.Equal(1, result);
        }
    }
}