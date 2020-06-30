using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Validators.User
{
    public class FluentUpdateUserValidator : AbstractValidator<UserDto>
    {
        private readonly ProjectContext _context;
        public FluentUpdateUserValidator(ProjectContext context)
        {
            _context = context;
            RuleFor(x => x.UserName)
                .NotEmpty()
                .WithMessage("Username mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.UserName)
                        .Matches(@"^[\w\d]{6,}$")
                        .WithMessage("Username is invalid")
                        .Must(DoesNotExistUsername)
                        .WithMessage("This username already exist in dadatabse");
                });

            RuleFor(x => x.Password)
                .Matches(@"^[\w\d]{6,}$")
                .When(x => !string.IsNullOrEmpty(x.Password) || !string.IsNullOrWhiteSpace(x.Password))
                .WithMessage("Password is invalid");

            RuleFor(x => x.RoleId)
                .Must(DoesExistRole)
                .WithMessage("This role not exist in database");

            RuleFor(x => x.UseCases)
                .Must(DoesNotExistDuplicate)
                .WithMessage("Mustn't exist duplicate of usecases")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.UseCases)
                        .Must(DoesExistUseCase)
                        .WithMessage("{PropertyValue} usecase not exist in system");
                });
        }

        private bool DoesExistUseCase(int id)
        {
            return Enum.IsDefined(typeof(UseCasesEnum), id);
        }

        private bool DoesNotExistDuplicate(ICollection<int> useCases)
        {
            return useCases.Select(x => x).Distinct().Count() == useCases.Count();
        }

        private bool DoesNotExistUsername(UserDto dto, string username)
        {
            return !_context.Users.IgnoreQueryFilters().Any(x => x.UserName == username && x.Id != dto.Id);
        }

        private bool DoesExistRole(int roleId)
        {
            return _context.Roles.Any(x => x.Id == roleId && x.IsActive);
        }
    }
}
