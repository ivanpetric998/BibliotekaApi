using Application.DataTransfer;
using Application.Queries;
using Application.Queries.NumberAllowdDays;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.NumberAllowdDays
{
    public class EFGetNumberAllowedDays : IGetNumberAllowdDays
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetNumberAllowedDays(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetNumberAllowedDays;

        public string Name => UseCasesEnum.EFGetNumberAllowedDays.ToString();

        public PagedResponse<NumberAllowdDaysDto> Execute(NumberAllowdDaysSearch search)
        {
            var query = _context.NumberAllowdDays.AsQueryable().DefaultFilter(search);

            if (search.DayFrom.HasValue)
            {
                query = query.Where(x => x.Value >= search.DayFrom.Value);
            }

            if (search.DayTo.HasValue)
            {
                query = query.Where(x => x.Value <= search.DayTo.Value);
            }

            if (search.DateFrom.HasValue)
            {
                query = query.Where(x => x.DateFrom.Date >= search.DateFrom.Value.Date);
            }

            if (search.DateTo.HasValue)
            {
                query = query.Where(x => x.DateFrom.Date <= search.DateTo.Value.Date);
            }

            return query.Paged<NumberAllowdDaysDto, Domain.NumberAllowdDays>(search, _mapper);
        }
    }
}
