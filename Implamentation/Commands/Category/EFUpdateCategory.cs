using Application.Commands.Category;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Category;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Category
{
    public class EFUpdateCategory : IUpdateCategory
    {
        private readonly ProjectContext _context;
        private readonly FluentUpdateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdateCategory(ProjectContext context, FluentUpdateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFUpdateCategory;

        public string Name => UseCasesEnum.EFUpdateCategory.ToString();

        public void Execute(CategoryDto request)
        {
            var category = _context.Categories.Find(request.Id);

            if (category == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Category));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, category);
            _context.SaveChanges();
        }
    }
}
