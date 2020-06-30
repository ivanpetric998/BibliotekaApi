using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implamentation.Validators.Book
{
    public class FluentCreateBookValidator : AbstractValidator<CreateModifyBookDto>
    {
        private readonly ProjectContext _context;

        public FluentCreateBookValidator(ProjectContext context)
        {
            _context = context;

            RuleFor(x => x.SerialNumber)
                .NotEmpty()
                .WithMessage("Serial number mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.SerialNumber)
                        .GreaterThanOrEqualTo(1000)
                        .WithMessage("Serial number must have latest 4 number")
                        .Must(num => !_context.Books.IgnoreQueryFilters().Any(x => x.SerialNumber == num))
                        .WithMessage("Serial number with this value exist in database");
                });

            RuleFor(x => x.TitleId)
                .Must(x => _context.Titles.Any(title => title.Id == x && title.IsActive))
                .WithMessage("Selected title does not exist in database");
        }
    }
}