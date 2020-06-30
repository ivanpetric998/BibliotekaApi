using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Book;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Book
{
    public class EFGetBooks : IGetBooks
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetBooks(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetBooks;

        public string Name => UseCasesEnum.EFGetBooks.ToString();

        public PagedResponse<BookDto> Execute(BookSearch search)
        {
            var query = _context.Books
                .Include(x => x.Title)
                    .ThenInclude(x => x.TitleAuthors)
                    .ThenInclude(x => x.Author)
                .Include(x => x.Title)
                    .ThenInclude(x => x.Publisher)
                .Include(x => x.Title)
                    .ThenInclude(x => x.Category)
                .Include(x => x.Title)
                    .ThenInclude(x => x.Prices)
                .DefaultFilter(search);

            if (search.TitleIds.Count() > 0)
            {
                query = query.Where(x => search.TitleIds.Contains(x.TitleId));
            }

            if (search.SerialNumber.HasValue)
            {
                query = query.Where(x => x.SerialNumber.ToString().ToLower().Contains(search.SerialNumber.ToString().ToLower()));
            }

            return query.Paged<BookDto, Domain.Book>(search, _mapper);
        }
    }
}
