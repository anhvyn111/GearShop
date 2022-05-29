using StoreDemo.Common;
using System;
using Xunit;
namespace XUnitTesting
{
    public class AdminLogin
    {
        [Fact]
        public void Test1()
        {
            //Arrange
            var username = "admin";
            var password = Encryptor.MD5Hash("123456");
            var adminDAO = new DataProvider.AdminDAO();

            //Act
            var result = adminDAO.Login(username, password);

            //Assert
            Assert.Equal(1, result);
        }

        [Fact]
        public void Test2()
        {
            //Arrange
            var username = "";
            var password = Encryptor.MD5Hash("123456");
            var adminDAO = new DataProvider.AdminDAO();

            //Act
            var result = adminDAO.Login(username, password);

            //Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void Test3()
        {
            //Arrange
            var username = "admin";
            var password = Encryptor.MD5Hash("");
            var adminDAO = new DataProvider.AdminDAO();

            //Act
            var result = adminDAO.Login(username, password);

            //Assert
            Assert.Equal(-1, result);
        }

        [Fact]
        public void Test4()
        {
            //Arrange
            var username = "";
            var password = Encryptor.MD5Hash("");
            var adminDAO = new DataProvider.AdminDAO();

            //Act
            var result = adminDAO.Login(username, password);

            //Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void Test5()
        {
            //Arrange
            var username = "admi";
            var password = Encryptor.MD5Hash("123456");
            var adminDAO = new DataProvider.AdminDAO();

            //Act
            var result = adminDAO.Login(username, password);

            //Assert
            Assert.Equal(0, result);
        }

        [Fact]
        public void Test6()
        {
            //Arrange
            var username = "admin";
            var password = Encryptor.MD5Hash("1234567");
            var adminDAO = new DataProvider.AdminDAO();

            //Act
            var result = adminDAO.Login(username, password);

            //Assert
            Assert.Equal(-1, result);
        }

        [Fact]
        public void Test7()
        {
            //Arrange
            var username = "thu";
            var password = Encryptor.MD5Hash("thu123");
            var adminDAO = new DataProvider.AdminDAO();

            //Act
            var result = adminDAO.Login(username, password);

            //Assert
            Assert.Equal(0, result);
        }
    }
}
