namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductCategory")]
    public partial class ProductCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductCategory()
        {
            Products = new HashSet<Product>();
            Tags = new HashSet<Tag>();
        }

        [Key]
        public int CategoryID { get; set; }

        [StringLength(200)]
        public string CategoryName { get; set; }

        [StringLength(200)]
        public string MetaTitle { get; set; }

        public int? MenuID { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(100)]
        public string ModifiedBy { get; set; }

        public bool? Status { get; set; }

        public virtual Menu Menu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Products { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tag> Tags { get; set; }
    }
}
