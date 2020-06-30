using Application.DataTransfer;
using Domain;
using EFDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Validators.Issuance
{
    public class FluentReturnBookValidator : AbstractValidator<ReturnBookDto>
    {
        private readonly ProjectContext _context;

        public FluentReturnBookValidator(ProjectContext context)
        {
            _context = context;

            RuleFor(x => x.ExistDamage)
                .NotNull()
                .WithMessage("You must send if damage exist");
        }
    }
}
