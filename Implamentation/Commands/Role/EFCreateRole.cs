using Application.Commands.Role;
using Application.DataTransfer;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Role;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Role
{
    public class EFCreateRole : ICreateRole
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;
        private readonly FluentCreateRoleValidator _validator;

        public EFCreateRole(ProjectContext context, IMapper mapper, FluentCreateRoleValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EFCreateRole;

        public string Name => UseCasesEnum.EFCreateRole.ToString();

        public void Execute(RoleDto request)
        {
            _validator.ValidateAndThrow(request);
            _context.Roles.Add(_mapper.Map<Domain.Role>(request));
            _context.SaveChanges();
        }
    }
}
