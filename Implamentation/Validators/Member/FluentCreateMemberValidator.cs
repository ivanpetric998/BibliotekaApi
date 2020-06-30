using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Validators.Member
{
    public class FluentCreateMemberValidator : AbstractValidator<MemberDto>
    {
        private readonly ProjectContext _context;

        public FluentCreateMemberValidator(ProjectContext context)
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
                

            RuleFor(x => x.Phone)
                .NotEmpty()
                .WithMessage("Phone mustn't be empty");

            RuleFor(x => x.Email)
                .NotEmpty()
                .WithMessage("Email mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Email)
                    .EmailAddress()
                    .WithMessage("Invalid email addres");
                });

            RuleFor(x => x.MemberCardNumber)
                .NotEmpty()
                .WithMessage("Member card number mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.MemberCardNumber)
                        .GreaterThanOrEqualTo(1000)
                        .WithMessage("Member card number must have latest 4 number")
                        .Must(DoesNotMemberCardExists)
                        .WithMessage("Member card number with this value exist in database");
                });
                
        }

        private bool DoesNotMemberCardExists(MemberDto dto, int memberCard)
        {
            var names = _context.Members.IgnoreQueryFilters().Select(x => x.MemberCardNumber);
            return !names.Contains(memberCard);
        }
    }
}
