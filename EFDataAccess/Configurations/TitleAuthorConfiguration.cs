using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    public class TitleAuthorConfiguration : IEntityTypeConfiguration<TitleAuthor>
    {
        public void Configure(EntityTypeBuilder<TitleAuthor> builder)
        {
            builder.HasKey(x => new { x.TitleId, x.AuthorId });

            builder.HasOne(x => x.Title)
                .WithMany(y => y.TitleAuthors)
                .HasForeignKey(x => x.TitleId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Author)
                .WithMany(y => y.TitleAuthors)
                .HasForeignKey(x => x.AuthorId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
