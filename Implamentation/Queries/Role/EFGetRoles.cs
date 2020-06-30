using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Role;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Role
{
    public class EFGetRoles : IGetRoles
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetRoles(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetRoles;

        public string Name => UseCasesEnum.EFGetRoles.ToString();

        public PagedResponse<RoleDto> Execute(RoleSearch search)
        {
            var query = _context.Roles.AsQueryable().DefaultFilter(search);

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return query.Paged<RoleDto, Domain.Role>(search, _mapper);
        }
    }
}
