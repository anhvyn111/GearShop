using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreDemo.Areas.Admin.Models
{
    public class ProductTagModel
    {
        public string TagID { get; set; }

        public string TagName { get; set; }
        public int ProductID { get; set; }
    }
}