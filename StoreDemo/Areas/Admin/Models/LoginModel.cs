using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StoreDemo.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Vui lòng nhập tài khoản")]
        public string username { set; get; }
        [Required(ErrorMessage ="Vui lòng nhập mật khẩu")]
        public string password { set; get; }
    }
}