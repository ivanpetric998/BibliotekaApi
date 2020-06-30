using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Category;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Category
{
    public class EFGetCategories : IGetCategories
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetCategories(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetCategories;

        public string Name => UseCasesEnum.EFGetCategories.ToString();

        public PagedResponse<CategoryDto> Execute(CategorySearch search)
        {
            var query = _context.Categories.AsQueryable().DefaultFilter(search);

            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return query.Paged<CategoryDto,Domain.Category>(search,_mapper);
        }
    }
}
