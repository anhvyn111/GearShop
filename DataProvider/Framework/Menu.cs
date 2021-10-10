namespace DataProvider.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Menu")]
    public partial class Menu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Menu()
        {
            ProductCategories = new HashSet<ProductCategory>();
        }

        public int MenuID { get; set; }

        [StringLength(200)]
        public string MenuName { get; set; }

        [StringLength(200)]
        public string MetaTitle { get; set; }

        public bool? Display { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductCategory> ProductCategories { get; set; }
    }
}
