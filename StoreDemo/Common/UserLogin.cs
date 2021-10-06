using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreDemo.Common
{
    [Serializable]
    public class UserLogin
    {
        public int userID { get; set; }
        public string username { get; set; }
    }
}