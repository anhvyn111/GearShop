using DataProvider.DAO;
using DataProvider.Framework;
using StoreDemo.Areas.Admin.Controllers;
using StoreDemo.Common;
using System;
using Xunit;
using FakeHttpContext;
using System.Web;
using System.Web.Mvc;

namespace XUnitTesting
{
    public class ProductCategory
    {
        [Fact]
        public void Test_CheckNameExist1()
        {
            //Arrange
            var dao = new ProductCategoryDAO();
            var name = "Màn hình 24 Inch";
            var metaTitle = StoreDemo.Common.StringHelper.ToUnsignMeta(name);

            //Act
            var checkNameExist = dao.CheckNameExist(metaTitle, 0);

            //Assert
            Assert.False(checkNameExist);
        }

        [Fact]
        public void Test_CheckNameExist2()
        {
            //Arrange
            var dao = new ProductCategoryDAO();
            var name = "Màn hình 32 Inch";
            var metaTitle = StoreDemo.Common.StringHelper.ToUnsignMeta(name);

            //Act
            var checkNameExist = dao.CheckNameExist(metaTitle, 0);

            //Assert
            Assert.True(checkNameExist);
        }

        [Fact]
        public void Test_Add1()
        {
            //Arrange
            var dao = new ProductCategoryDAO();
            var name = "Màn hình 32 Inch";
            var productCategory = new DataProvider.Framework.ProductCategory() { CategoryName = name  };

            //Act
            var result = dao.Insert(productCategory);

            //Assert
            Assert.Equal(1, result);
        }

        [Fact]
        public void Test_Add2()
        {
            using (var http = new FakeHttpContext.FakeHttpContext())
            {
                //Arrange
                var dao = new ProductCategoryDAO();
                var name = "Màn hình 32 Inch";
                var _controller = new ProductCategoryController();

     
                Session[CommonConstants.ADMIN_SESSION] = "admin";
      
                //Act
                var result = _controller.Create(name, 5);
                var resultObject = Assert.IsType<JsonResult>(result);

                //Assert
                Assert.Equal(1, resultObject.Data);
            }
        }
    }
}
