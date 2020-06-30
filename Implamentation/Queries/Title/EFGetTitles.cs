using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Title;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Title
{
    public class EFGetTitles : IGetTitles
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetTitles(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetTitles;

        public string Name => UseCasesEnum.EFGetTitles.ToString();

        public PagedResponse<TitleDto> Execute(TitleSearch search)
        {
            var query = _context.Titles.Include(x => x.Prices)
                .Include(x => x.Publisher).Include(x => x.Category)
                .Include(x => x.TitleAuthors).ThenInclude(x => x.Author)
                .DefaultFilter(search);

            if(search.PublisherIds.Count() > 0)
            {
                   query = query.Where(x => search.PublisherIds.Contains(x.PublisherId));
            }

            if (search.CategoryIds.Count() > 0)
            {
                query = query.Where(x => search.CategoryIds.Contains(x.CategoryId));
            }

            if (search.AuthorIds.Count() > 0)
            {
                query = query.Where(x => x.TitleAuthors.Any(i => search.AuthorIds.Contains(i.AuthorId)));
            }

            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            if (search.IssueYearFrom.HasValue)
            {
                query = query.Where(x => x.IssueYear >= search.IssueYearFrom.Value);
            }

            if (search.IssueYearTo.HasValue)
            {
                query = query.Where(x => x.IssueYear <= search.IssueYearTo.Value);
            }

            return query.Paged<TitleDto, Domain.Title>(search, _mapper);
        }
    }
}
