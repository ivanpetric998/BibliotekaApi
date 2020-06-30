using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Author;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;

namespace Implamentation.Queries.Author
{
    public class EFGetAuthors : IGetAuthors
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetAuthors(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetAuthors;

        public string Name => UseCasesEnum.EFGetAuthors.ToString();

        public PagedResponse<AuthorDto> Execute(AuthorSearch search)
        {
            var query = _context.Authors.AsQueryable().DefaultFilter(search);

            if(!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.LastName) || !string.IsNullOrWhiteSpace(search.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }

            return query.Paged<AuthorDto, Domain.Author>(search, _mapper);
        }
    }
}
