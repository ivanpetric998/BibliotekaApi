using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    public class IssuanceConfigurations : IEntityTypeConfiguration<Issuance>
    {
        public void Configure(EntityTypeBuilder<Issuance> builder)
        {
            builder.HasOne(x => x.Book)
                .WithMany(y => y.Issuances)
                .HasForeignKey(x => x.BookId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Member)
                .WithMany(y => y.Issuances)
                .HasForeignKey(x => x.MemberId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.LibrarianRented)
                .WithMany(y => y.IssueBooks)
                .HasForeignKey(x => x.LibrarianRentedId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.LibrarianReturned)
                .WithMany(y => y.ReturnedBooks)
                .HasForeignKey(x => x.LibrarianReturnedId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Recompense)
                .WithOne(y => y.Issuance)
                .HasForeignKey<Recompense>(y => y.IssuanceId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}