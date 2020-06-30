using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Validators.Author
{
    public class FluentUpdateAuthorValidator : AbstractValidator<AuthorDto>
    {
        private readonly ProjectContext _context;

        public FluentUpdateAuthorValidator(ProjectContext context)
        {
            _context = context;

            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("First name mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.FirstName)
                    .Matches(@"^[A-Z][a-z]{2,}$")
                    .WithMessage("First name is in invalid format");
                });


            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Last name mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.LastName)
                    .Matches(@"^[A-Z][a-z]{2,}(\s[A-Z][a-z]{2,})*$")
                    .WithMessage("Last name is in invalid format");
                });
        }
    }
}
