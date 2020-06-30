using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.Member;
using AutoMapper;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Queries.Member
{
    public class EFGetOneMember : IGetOneMember
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetOneMember(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetOneMember;

        public string Name => UseCasesEnum.EFGetOneMember.ToString();

        public MemberDto Execute(int id)
        {
            var member = _context.Members.Find(id);

            if (member == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Member));
            }

            return _mapper.Map<MemberDto>(member);
        }
    }
}
