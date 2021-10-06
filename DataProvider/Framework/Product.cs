namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public int ProductID { get; set; }

        [StringLength(300)]
        public string ProductName { get; set; }

        [StringLength(300)]
        public string MetaTitle { get; set; }

        [StringLength(100)]
        public string Brand { get; set; }

        public int? Price { get; set; }

        public int? PromotionPrice { get; set; }

        public int? Category { get; set; }

        [Column(TypeName = "ntext")]
        public string Decription { get; set; }

        [Column(TypeName = "ntext")]
        public string Detail { get; set; }

        public int? Quality { get; set; }

        [StringLength(100)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string Tags { get; set; }

        public bool? Status { get; set; }
    }
}
