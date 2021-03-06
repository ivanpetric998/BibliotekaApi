﻿using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Validators.Category
{
    public class FluentUpdateCategoryValidator : AbstractValidator<CategoryDto>
    {
        private readonly ProjectContext _context;

        public FluentUpdateCategoryValidator(ProjectContext context)
        {
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Category mustn't be empty")
                .Must(DoesNotCategoryExists)
                .WithMessage("Category with this name exist in database");
        }

        private bool DoesNotCategoryExists(CategoryDto dto, string name)
        {
            var names = _context.Categories.Where(x => x.Id != dto.Id).Select(x => x.Name);
            return !names.Contains(name);
        }
    }
}
