using DataProvider.DAO;
using DataProvider.Framework;
using NUnit.Framework;

namespace NUnit
{

    [TestFixture]
    public class Produdct
    {
        private ProductDAO _productDAO;

        [SetUp]
        public void SetUp()
        {
            _productDAO = new ProductDAO();
        }

        [Test]
        public void CheckNameExist_MustExist()
        {
            var productName = "GIGABYTE GeForce GTX 1650 MINI ITX OC 4G";
            var result = _productDAO.CheckNameExist(productName, 18);

            Assert.IsFalse(result, "The product name is existed");
        }
        [Test]
        public void CheckNameExist_MustBeAvailable()
        {
            var productName = "GIGABYTE GeForce GTX 1900 MINI ITX OC 4G";
            var result = _productDAO.CheckNameExist(productName, 18);

            Assert.IsTrue(result, "The product name is available");
        }

        [Test]
        public void CheckNameExist_AddNewProduct()
        {
            var product = new Product()
            {
                ProductName = "GIGABYTE GeForce GTX 4000 MINI ITX OC 4G",
                Price = 900000,
                CategoryID = 18,
                Description = "Hello",
                Detail = "Detail",
                Quanlity = 100
            };
            var result = _productDAO.Insert(product);

            Assert.Greater(result, 0);
        }
    }
}