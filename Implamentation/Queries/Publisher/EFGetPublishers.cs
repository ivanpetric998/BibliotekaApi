using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Publisher;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Publisher
{
    public class EFGetPublishers : IGetPublishers
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetPublishers(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetPublishers;

        public string Name => UseCasesEnum.EFGetPublishers.ToString();

        public PagedResponse<PublisherDto> Execute(PublisherSearch search)
        {
            var query = _context.Publishers.AsQueryable().DefaultFilter(search);

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return query.Paged<PublisherDto, Domain.Publisher>(search, _mapper);
        }
    }
}
