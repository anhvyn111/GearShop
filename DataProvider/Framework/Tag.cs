namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tag")]
    public partial class Tag
    {
        public int ID { get; set; }

        [StringLength(200)]
        public string TagID { get; set; }

        [StringLength(200)]
        public string TagName { get; set; }

        public int? CategoryID { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }
    }
}
