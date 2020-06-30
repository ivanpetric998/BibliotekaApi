using Application.Commands.Member;
using Application.DataTransfer;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Member;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Member
{
    public class EFCreateMember : ICreateMember
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;
        private readonly FluentCreateMemberValidator _validator;

        public EFCreateMember(ProjectContext context, IMapper mapper, FluentCreateMemberValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EFCreateMember;

        public string Name => UseCasesEnum.EFCreateMember.ToString();

        public void Execute(MemberDto request)
        {
            _validator.ValidateAndThrow(request);
            _context.Members.Add(_mapper.Map<Domain.Member>(request));
            _context.SaveChanges();
        }
    }
}