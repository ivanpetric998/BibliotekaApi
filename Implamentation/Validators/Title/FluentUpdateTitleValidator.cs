using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Implamentation.Validators.Title
{
    public class FluentUpdateTitleValidator : AbstractValidator<CreateModifyTitle>
    {
        private readonly ProjectContext _context;

        public FluentUpdateTitleValidator(ProjectContext context)
        {
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Name mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Name)
                        .Matches(@"^[\w\d]{3,}$")
                        .WithMessage("Name is invalid");
                });

            RuleFor(x => x.IssueYear)
                .NotEmpty()
                .WithMessage("Issue year mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.IssueYear)
                        .GreaterThan(1900)
                        .WithMessage("Issue year is invalid");
                });

            RuleFor(x => x.PriceForDamage)
                .NotEmpty()
                .WithMessage("Price for damage mustn't be empty")
                .DependentRules(() =>
                {
                    RuleFor(x => x.PriceForDamage)
                        .GreaterThan(0)
                        .WithMessage("Price for damage is invalid");
                });

            RuleFor(x => x.PublisherId)
                .Must(id => _context.Publishers.Any(x => x.Id == id && x.IsActive))
                .WithMessage("Publisher does not exist in database");

            RuleFor(x => x.CategoryId)
                .Must(id => _context.Categories.Any(x => x.Id == id && x.IsActive))
                .WithMessage("Category does not exist in database");

            RuleFor(x => x.Authors)
                .Must(x => x.Count() >= 1)
                .WithMessage("There must be at least one author")
                .Must(x => x.Select(i => i).Distinct().Count() == x.Count())
                .WithMessage("there must not be two identical authors")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.Authors)
                        .Must(x => _context.Authors.Any(i => i.Id == x && i.IsActive))
                        .WithMessage("{PropertyValue} author not exist in database");
                });

            RuleFor(x => x.Image)
                 .Must(img =>
                     {
                         var allowedFormats = new List<string>() { ".jpg", ".jpeg", ".png", ".gif" };

                         if(img != null)
                         {
                             allowedFormats.Any(ext => ext.ToLower() == Path.GetExtension(img.FileName).ToLower());
                         }

                         return true;
                     })
                 .WithMessage("File is in invalid format");
        }
    }
}
