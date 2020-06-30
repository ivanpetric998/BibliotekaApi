using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.Category;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Queries.Category
{
    public class EFGetOneCategory : IGetOneCategory
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetOneCategory(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetOneCategory;

        public string Name => UseCasesEnum.EFGetOneCategory.ToString();

        public CategoryDto Execute(int id)
        {
            var category = _context.Categories.Find(id);

            if(category == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Category));
            }

            return _mapper.Map<CategoryDto>(category);
        }
    }
}
