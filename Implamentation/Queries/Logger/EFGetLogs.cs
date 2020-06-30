using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Logger;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Logger
{
    public class EFGetLogs : IGetLogs
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetLogs(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetLogs;

        public string Name => UseCasesEnum.EFGetLogs.ToString();

        public PagedResponse<LoggerDto> Execute(LoggerSearch search)
        {
            var query = _context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
            {
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));
            }

            if (search.ActorId.HasValue)
            {
                query = query.Where(x => x.ActorId == search.ActorId.Value);
            }

            if (search.DateFrom.HasValue)
            {
                query = query.Where(x => x.Date.Date >= search.DateFrom.Value.Date);
            }

            if (search.DateTo.HasValue)
            {
                query = query.Where(x => x.Date.Date <= search.DateTo.Value.Date);
            }

            query = query.OrderByDescending(x => x.Date);

            return query.Paged<LoggerDto, Domain.UseCaseLog>(search, _mapper);
        }
    }
}
