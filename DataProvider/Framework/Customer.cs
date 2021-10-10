namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Customer")]
    public partial class Customer
    {
        [Key]
        [Column(Order = 0)]
        public int CustomerID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(255)]
        public string FullName { get; set; }

        public DateTime? Birth { get; set; }

        public bool? Gender { get; set; }

        [StringLength(11)]
        public string PhoneNumber { get; set; }

        [StringLength(200)]
        public string Password { get; set; }

        public int? Status { get; set; }
    }
}
