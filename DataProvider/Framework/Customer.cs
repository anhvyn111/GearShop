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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            Carts = new HashSet<Cart>();
            ProductOrders = new HashSet<ProductOrder>();
        }

        public int CustomerID { get; set; }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart> Carts { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductOrder> ProductOrders { get; set; }
    }
}
