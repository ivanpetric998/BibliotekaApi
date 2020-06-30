using Application.DataTransfer;
using Domain;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Implamentation.Validators.Issuance
{
    public class FluentRentBookValidator : AbstractValidator<RentBookDto>
    {
        private readonly ProjectContext _context;

        public FluentRentBookValidator(ProjectContext context)
        {
            _context = context;

            RuleFor(x => x.BookId)
                .Must(book => _context.Books.Any(x => x.Id == book && x.IsActive))
                .WithMessage("Selected book does not exist in database")
                .Must(book => !_context.Issuances.Any(x => x.Status == IssuanceStatus.Rented && x.BookId == book))
                .WithMessage("This book is already rented");
                

            RuleFor(x => x.MemberId)
                .Must(member => _context.Members.Any(x => x.Id == member && x.IsActive))
                .WithMessage("Selected member does not exist in database");
        }
    }
}
