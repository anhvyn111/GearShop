namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ImportProduct")]
    public partial class ImportProduct
    {
        [Key]
        public int ImportID { get; set; }

        public int? ProductID { get; set; }

        public int? Quality { get; set; }

        public int? CostPrice { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(100)]
        public string ModifiedBy { get; set; }
    }
}
