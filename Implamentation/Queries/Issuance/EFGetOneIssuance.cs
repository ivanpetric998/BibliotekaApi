using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.Issuance;
using AutoMapper;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Issuance
{
    public class EFGetOneIssuance : IGetOneIssuance
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetOneIssuance(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetOneIssuance;

        public string Name => UseCasesEnum.EFGetOneIssuance.ToString();

        public IssuanceDto Execute(int id)
        {
            var issuance = _context.Issuances
                .Include(x => x.Book)
                    .ThenInclude(x => x.Title)
                .Include(x => x.Member)
                .Include(x => x.LibrarianRented)
                .Include(x => x.LibrarianReturned)
                .FirstOrDefault(x => x.Id == id);

            if (issuance == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Issuance));
            }

            return _mapper.Map<IssuanceDto>(issuance);
        }
    }
}
