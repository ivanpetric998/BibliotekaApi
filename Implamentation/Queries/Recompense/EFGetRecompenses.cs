using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Recompense;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Recompense
{
    public class EFGetRecompenses : IGetRecompenses
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetRecompenses(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetRecompenses;

        public string Name => UseCasesEnum.EFGetRecompenses.ToString();

        public PagedResponse<RecompenseDto> Execute(RecompenseSearch search)
        {
            var query = _context.Recompenses.Include(x => x.Issuance).AsQueryable();
          
            if (search.ExistDamage.HasValue)
            {
                query = query.Where(x => x.ExistDamage == search.ExistDamage.Value);
            }

            if (search.ExistTransgression.HasValue)
            {
                query = query.Where(x => x.ExistTransgression == search.ExistTransgression.Value);
            }

            if (search.MinPrice.HasValue)
            {
                query = query.Where(x => x.TotalPrice >= search.MinPrice.Value);
            }

            if (search.MaxPrice.HasValue)
            {
                query = query.Where(x => x.TotalPrice <= search.MaxPrice.Value);
            }

            return query.Paged<RecompenseDto, Domain.Recompense>(search, _mapper);
        }
    }
}
