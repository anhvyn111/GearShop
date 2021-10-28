namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductTag")]
    public partial class ProductTag
    {
        public int ID { get; set; }

        [StringLength(200)]
        public string TagID { get; set; }

        public int? ProductID { get; set; }

        public virtual Product Product { get; set; }
    }
}
