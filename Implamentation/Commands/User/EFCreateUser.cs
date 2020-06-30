using Application.Commands.User;
using Application.DataTransfer;
using AutoMapper;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implamentation.Extensions;
using Implamentation.Validators.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.User
{
    public class EFCreateUser : ICreateCommand
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;
        private readonly FluentCreateUserValidator _validator;

        public EFCreateUser(ProjectContext context, IMapper mapper, FluentCreateUserValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EFCreateUser;

        public string Name => UseCasesEnum.EFCreateUser.ToString();

        public void Execute(CreateUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = _mapper.Map<Domain.User>(request);
            user.AddDefaultUseCasesForRole();

            _context.Users.Add(user);
            _context.SaveChanges();
        }
    }
}
