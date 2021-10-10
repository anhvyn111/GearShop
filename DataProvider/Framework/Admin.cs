namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Admin")]
    public partial class Admin
    {
        [Key]
        [StringLength(100)]
        public string Username { get; set; }

        [StringLength(200)]
        public string FullName { get; set; }

        [StringLength(100)]
        public string Password { get; set; }
    }
}
