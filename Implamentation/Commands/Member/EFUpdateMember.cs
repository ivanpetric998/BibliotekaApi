using Application.Commands.Member;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Member;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Member
{
    public class EFUpdateMember : IUpdateMember
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;
        private readonly FluentUpdateMemberValidator _validator;

        public EFUpdateMember(ProjectContext context, IMapper mapper, FluentUpdateMemberValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EFUpdateMember;

        public string Name => UseCasesEnum.EFUpdateMember.ToString();

        public void Execute(MemberDto request)
        {
            var member = _context.Members.Find(request.Id);

            if(member == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Member));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request,member);
            _context.SaveChanges();
        }
    }
}
