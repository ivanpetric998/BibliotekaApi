using Application.DataTransfer;
using Application.Queries;
using Application.Queries.User;
using Application.Searches;
using AutoMapper;
using EFDataAccess;
using Implamentation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.User
{
    public class EFGetUsers : IGetUsers
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetUsers(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => (int)UseCasesEnum.EFGetUsers;

        public string Name => UseCasesEnum.EFGetUsers.ToString();

        public PagedResponse<UserDto> Execute(UserSearch search)
        {
            var query = _context.Users.Include(x => x.Role).Include(x => x.UserUseCases).DefaultFilter(search);

            if(!string.IsNullOrEmpty(search.UserName) || !string.IsNullOrWhiteSpace(search.UserName))
            {
                query = query.Where(x => x.UserName.ToLower().Contains(search.UserName.ToLower()));
            }

            if (search.RoleId.HasValue)
            {
                query = query.Where(x => x.RoleId == search.RoleId.Value);
            }

            return query.Paged<UserDto, Domain.User>(search, _mapper);
        }
    }
}
