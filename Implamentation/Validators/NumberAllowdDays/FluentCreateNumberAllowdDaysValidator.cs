using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using Application.DataTransfer;

namespace Implamentation.Validators.NumberAllowdDays
{
    public class FluentCreateNumberAllowdDaysValidator : AbstractValidator<NumberAllowdDaysDto>
    {
        public FluentCreateNumberAllowdDaysValidator()
        {
            RuleFor(x => x.Value)
                .NotEmpty()
                .WithMessage("NumberAllowdDay mustn't be empty")
                .GreaterThan(0)
                .WithMessage("NumberAllowdDay must be greater than 0");
        }
    }
}
