using Domain;
using EFDataAccess.Configurations;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess
{
    public class ProjectContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS;Initial Catalog=ProjectASPApi;Integrated Security=True");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Book>().HasIndex(x => x.SerialNumber).IsUnique();

            modelBuilder.ApplyConfiguration(new IssuanceConfigurations());
            modelBuilder.ApplyConfiguration(new TitleAuthorConfiguration());
            modelBuilder.ApplyConfiguration(new TitleConfiguration());
            modelBuilder.ApplyConfiguration(new UserConfiguration());

            modelBuilder.Entity<Author>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Book>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Category>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Issuance>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Member>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<NumberAllowdDays>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Pricelist>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Publisher>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Recompense>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Role>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Title>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<User>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<UserUseCase>().HasQueryFilter(p => !p.IsDeleted);
        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if(entry.Entity is BaseEntity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added :
                            e.Id = 0;
                            e.CreatedAt = DateTime.Now;
                            e.DeletedAt = null;
                            e.IsDeleted = false;
                            e.ModifiedAt = null;
                            break;
                        case EntityState.Modified :
                            e.ModifiedAt = DateTime.Now;
                            break;
                    }
                }
            }
            return base.SaveChanges();
        }

        public virtual DbSet<Author> Authors { get; set; }
        public virtual DbSet<Book> Books { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Issuance> Issuances { get; set; }
        public virtual DbSet<Member> Members { get; set; }
        public virtual DbSet<NumberAllowdDays> NumberAllowdDays { get; set; }
        public virtual DbSet<Pricelist> Pricelists { get; set; }
        public virtual DbSet<Publisher> Publishers { get; set; }
        public virtual DbSet<Recompense> Recompenses { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Title> Titles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserUseCase> UserUseCases { get; set; }
        public virtual DbSet<UseCaseLog> UseCaseLogs { get; set; }

    }
}
