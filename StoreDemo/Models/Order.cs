using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreDemo.Models
{
    public class Order
    {
        public string FullName { get; set; }
        public string Address { get; set; }
        public string Ward { get; set; }
        public string District { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string PhoneNumber { get; set; }
        public string PaymentMethod { get; set; }
    }
}