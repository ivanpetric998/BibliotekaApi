using Application.DataTransfer;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Validators.Pricelist
{
    public class FluentCreatePriceValidator : AbstractValidator<PricelistDto>
    {
        public FluentCreatePriceValidator()
        {
            RuleFor(x => x.Value)
                .NotEmpty()
                .WithMessage("Price mustn't be empty")
                .GreaterThan(0)
                .WithMessage("Price must be greater than 0");
        }
    }
}
