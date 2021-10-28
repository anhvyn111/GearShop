namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductImage")]
    public partial class ProductImage
    {
        [Key]
        public int ImageID { get; set; }

        [StringLength(200)]
        public string ImageName { get; set; }

        public string ImagePath { get; set; }

        public int? ProductID { get; set; }

        public virtual Product Product { get; set; }
    }
}
