using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Validators.Publisher
{
    public class FluentUpdatePublisherValidator : AbstractValidator<PublisherDto>
    {
        private readonly ProjectContext _context;

        public FluentUpdatePublisherValidator(ProjectContext context)
        {
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Publisher mustn't be empty")
                .Must(DoesNotPublisherExists)
                .WithMessage("Publisher with this name exist in database");
        }

        private bool DoesNotPublisherExists(PublisherDto dto, string name)
        {
            var names = _context.Publishers.Where(x => x.Id != dto.Id).Select(x => x.Name);
            return !names.Contains(name);
        }
    }
}
