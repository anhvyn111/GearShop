namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductOrder")]
    public partial class ProductOrder
    {
        [Key]
        public int OrderID { get; set; }

        public int? OrderedBy { get; set; }

        public DateTime? OrderdDate { get; set; }

        [StringLength(11)]
        public string PhoneNumer { get; set; }

        public string Address { get; set; }
    }
}
