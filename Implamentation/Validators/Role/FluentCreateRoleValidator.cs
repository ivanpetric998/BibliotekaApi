using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Validators.Role
{
    public class FluentCreateRoleValidator : AbstractValidator<RoleDto>
    {
        private readonly ProjectContext _context;

        public FluentCreateRoleValidator(ProjectContext context)
        {
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Role mustn't be empty")
                .Must(DoesNotRoleExists)
                .WithMessage("Role with this name exist in database");
        }

        private bool DoesNotRoleExists(string name)
        {
            var names = _context.Roles.Select(x => x.Name);
            return !names.Contains(name);
        }
    }
}
