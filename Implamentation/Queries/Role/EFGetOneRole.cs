using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.Role;
using AutoMapper;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Queries.Role
{
    public class EFGetOneRole : IGetOneRole
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetOneRole(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetOneRole;

        public string Name => UseCasesEnum.EFGetOneRole.ToString();

        public RoleDto Execute(int id)
        {
            var role = _context.Roles.Find(id);

            if (role == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Role));
            }

            return _mapper.Map<RoleDto>(role);
        }
    }
}
