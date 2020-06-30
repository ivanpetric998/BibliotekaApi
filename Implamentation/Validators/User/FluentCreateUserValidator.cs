using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Implamentation.Validators.User
{
    public class FluentCreateUserValidator : AbstractValidator<CreateUserDto>
    {
        private readonly ProjectContext _context;

        public FluentCreateUserValidator(ProjectContext context)
        {
            _context = context;

            RuleFor(x => x.UserName)
                .NotEmpty()
                .WithMessage("Username mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.UserName)
                        .Matches(@"^[\w\d]{6,}$")
                        .WithMessage("Username must have minimum 6 character")
                        .Must(DoesNotExistUsername)
                        .WithMessage("This username already exist in dadatabse");
                });


            RuleFor(x => x.Password)
                .NotEmpty()
                .WithMessage("Password mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.UserName)
                        .Matches(@"^[\w\d]{6,}$")
                        .WithMessage("Password must have minimum 6 character");
                });

            RuleFor(x => x.RoleId)
                .Must(DoesExistRole)
                .WithMessage("This role not exist in database");
        }

        private bool DoesNotExistUsername(string username)
        {
            var usernames = _context.Users.IgnoreQueryFilters().Select(x => x.UserName);
            return !usernames.Contains(username);
        }

        private bool DoesExistRole(int roleId)
        {
            return _context.Roles.Any(x => x.Id == roleId && x.IsActive);
        }
    }
}
