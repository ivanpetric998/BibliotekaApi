using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.User;
using AutoMapper;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.User
{
    public class EFGetOneUser : IGetOneUser
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetOneUser(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFCreateUser;

        public string Name => UseCasesEnum.EFCreateUser.ToString();

        public UserDto Execute(int id)
        {
            var user = _context.Users.Include(x => x.Role).Include(x => x.UserUseCases).FirstOrDefault(x => x.Id == id);

            if (user == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.User));
            }

            return _mapper.Map<UserDto>(user);
        }
    }
}
