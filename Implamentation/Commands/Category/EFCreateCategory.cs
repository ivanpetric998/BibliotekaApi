using Application.Commands.Category;
using Application.DataTransfer;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Category;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Category
{
    public class EFCreateCategory : ICreateCategory
    {
        private readonly ProjectContext _context;
        private readonly FluentCreateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EFCreateCategory(ProjectContext context, FluentCreateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFCreateCategory;

        public string Name => UseCasesEnum.EFCreateCategory.ToString();

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);
            _context.Categories.Add(_mapper.Map<Domain.Category>(request));
            _context.SaveChanges();
        }
    }
}
