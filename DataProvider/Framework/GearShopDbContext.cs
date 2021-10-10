namespace DataProvider.Framework
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class GearShopDbContext : DbContext
    {
        public GearShopDbContext()
            : base("name=GearShopDbContext")
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<ProductOrder> ProductOrders { get; set; }
        public virtual DbSet<ProductTag> ProductTags { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<Admin>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.PhoneNumber)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Menu>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.ProductTags)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProductCategory>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<ProductCategory>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

            modelBuilder.Entity<ProductOrder>()
                .Property(e => e.PhoneNumer)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ProductTag>()
                .Property(e => e.TagID)
                .IsUnicode(false);
        }
    }
}
