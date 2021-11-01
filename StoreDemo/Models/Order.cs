using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StoreDemo.Models
{
    public class Order
    {
        [Required(ErrorMessage ="Bắt buộc")]
        public string FullName { get; set; }

        [Required(ErrorMessage = "Bắt buộc")]
        public string Address { get; set; }

        [Required(ErrorMessage = "Bắt buộc")]
        public string Ward { get; set; }


        [Required(ErrorMessage = "Bắt buộc")]
        public string City { get; set; }

        [Required(ErrorMessage = "Bắt buộc")]
        public string Province { get; set; }

        [Required(ErrorMessage = "Bắt buộc")]
        public string PhoneNumber { get; set; }
        [Required(ErrorMessage = "Bắt buộc")]
        public string PaymentMethod { get; set; }
    }
}