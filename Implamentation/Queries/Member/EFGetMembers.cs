using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Member;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Member
{
    public class EFGetMembers : IGetMembers
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetMembers(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetMembers;

        public string Name => UseCasesEnum.EFGetMembers.ToString();

        public PagedResponse<MemberDto> Execute(MemberSearch search)
        {
            var query = _context.Members.AsQueryable().DefaultFilter(search);

            if(!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.LastName) || !string.IsNullOrWhiteSpace(search.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Email) || !string.IsNullOrWhiteSpace(search.Email))
            {
                query = query.Where(x => x.Email.ToLower().Contains(search.Email.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Phone) || !string.IsNullOrWhiteSpace(search.Phone))
            {
                query = query.Where(x => x.Phone.ToLower().Contains(search.Phone.ToLower()));
            }

            if (search.MemberCardNumber.HasValue)
            {
                query = query.Where(x => x.MemberCardNumber.ToString().Contains(search.MemberCardNumber.ToString()));
            }

            return query.Paged<MemberDto, Domain.Member>(search, _mapper);
        }
    }
}
