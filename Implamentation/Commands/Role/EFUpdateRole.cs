using Application.Commands.Role;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Role;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Role
{
    public class EFUpdateRole : IUpdateRole
    {
        private readonly ProjectContext _context;
        private readonly FluentUpdateRoleValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdateRole(ProjectContext context, FluentUpdateRoleValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFUpdateRole;

        public string Name => UseCasesEnum.EFUpdateRole.ToString();

        public void Execute(RoleDto request)
        {
            var role = _context.Roles.Find(request.Id);

            if (role == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Role));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, role);
            _context.SaveChanges();
        }
    }
}
