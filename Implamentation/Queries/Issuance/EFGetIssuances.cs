using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Issuance;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Issuance
{
    public class EFGetIssuances : IGetIssuances
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetIssuances(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetIssuances;

        public string Name => UseCasesEnum.EFGetIssuances.ToString();

        public PagedResponse<IssuanceDto> Execute(IssuanceSearch search)
        {
            var query = _context.Issuances
                .Include(x => x.Book)
                    .ThenInclude(x => x.Title)
                .Include(x => x.Member)
                .Include(x => x.LibrarianRented)
                .Include(x => x.LibrarianReturned)
                .AsQueryable();

            if (search.RentedDateFrom.HasValue)
            {
                query = query.Where(x => x.RentedDate.Date >= search.RentedDateFrom.Value.Date);
            }

            if (search.RentedDateTo.HasValue)
            {
                query = query.Where(x => x.RentedDate.Date <= search.RentedDateTo.Value.Date);
            }

            if (search.Status.HasValue)
            {
                query = query.Where(x => x.Status == search.Status.Value);
            }

            if (search.ExistRecompense.HasValue)
            {
                query = query.Where(x => x.ExistRecompense == search.ExistRecompense.Value);
            }

            if(search.TitleIds.Count > 0)
            {
                query = query.Where(x => search.TitleIds.Contains(x.Book.TitleId));
            }

            if (search.MemberIds.Count > 0)
            {
                query = query.Where(x => search.MemberIds.Contains(x.MemberId));
            }

            if (search.LibrarianRentedIds.Count > 0)
            {
                query = query.Where(x => search.LibrarianRentedIds.Contains(x.LibrarianRentedId));
            }

            if (search.LibrarianReturnedIds.Count > 0)
            {
                query = query.Where(x => search.LibrarianReturnedIds.Contains(x.LibrarianReturnedId.Value));
            }

            return query.Paged<IssuanceDto, Domain.Issuance>(search, _mapper);
        }
    }
}
