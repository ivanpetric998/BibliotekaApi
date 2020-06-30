using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Pricelist;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using System.Linq;

namespace Implamentation.Queries.Pricelist
{
    public class EFGetPricelists : IGetPricelists
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetPricelists(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetPricelists;

        public string Name => UseCasesEnum.EFGetPricelists.ToString();

        public PagedResponse<PricelistDto> Execute(PricelistSearch search)
        {
            var query = _context.Pricelists.AsQueryable().DefaultFilter(search);

            if (search.PriceFrom.HasValue)
            {
                query = query.Where(x => x.Value >= search.PriceFrom.Value);
            }

            if (search.PriceTo.HasValue)
            {
                query = query.Where(x => x.Value <= search.PriceTo.Value);
            }

            if (search.DateFrom.HasValue)
            {
                query = query.Where(x => x.DateFrom.Date >= search.DateFrom.Value.Date);
            }

            if (search.DateTo.HasValue)
            {
                query = query.Where(x => x.DateFrom.Date <= search.DateTo.Value.Date);
            }

            return query.Paged<PricelistDto, Domain.Pricelist>(search, _mapper);
        }
    }
}