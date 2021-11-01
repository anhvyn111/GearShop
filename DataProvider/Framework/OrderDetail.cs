namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrderDetail")]
    public partial class OrderDetail
    {
        public int ID { get; set; }

        public int? ProductID { get; set; }

        public int? Quanlity { get; set; }

        public long? Price { get; set; }

        public int? OrderID { get; set; }

        public virtual ProductOrder ProductOrder { get; set; }

        public virtual Product Product { get; set; }
    }
}
