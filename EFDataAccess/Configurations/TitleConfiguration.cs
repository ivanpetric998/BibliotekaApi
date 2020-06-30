using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    public class TitleConfiguration : IEntityTypeConfiguration<Title>
    {
        public void Configure(EntityTypeBuilder<Title> builder)
        {
            builder.Property(x => x.Name).IsRequired().HasMaxLength(50);

            builder.HasMany(x => x.Prices)
                .WithOne(y => y.Title)
                .HasForeignKey(y => y.TitleId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Publisher)
                .WithMany(y => y.Titles)
                .HasForeignKey(x => x.PublisherId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Category)
                .WithMany(y => y.Titles)
                .HasForeignKey(x => x.CategoryId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Books)
                .WithOne(y => y.Title)
                .HasForeignKey(y => y.TitleId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
