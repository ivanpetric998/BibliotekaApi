using Application.Commands.User;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.User;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.User
{
    public class EFUpdateUser : IUpdateUser
    {
        private readonly ProjectContext _context;
        private readonly FluentUpdateUserValidator _validator;

        public EFUpdateUser(ProjectContext context, FluentUpdateUserValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EFUpdateUser;

        public string Name => UseCasesEnum.EFUpdateUser.ToString();

        public void Execute(UserDto request)
        {
            var user = _context.Users.Include(x => x.UserUseCases).FirstOrDefault(x => x.Id == request.Id);

            if(user == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.User));
            }

            _validator.ValidateAndThrow(request);

            user.UserName = request.UserName;
            user.RoleId = request.RoleId;
            user.IsActive = request.IsActive;

            if(!string.IsNullOrEmpty(request.Password) || !string.IsNullOrWhiteSpace(request.Password))
            {
                user.Password = EasyEncryption.MD5.ComputeMD5Hash(request.Password);
            }

            var useCasesForDelete = user.UserUseCases.Where(x => !request.UseCases.Contains(x.UseCaseId)).ToList();
            var useCasesForInsert = request.UseCases.Where(x => !user.UserUseCases.Select(x => x.UseCaseId).Contains(x)).ToList();

            foreach (var x in useCasesForDelete)
            {
                x.IsActive = false;
                x.IsDeleted = true;
                x.DeletedAt = DateTime.Now;
            }

            foreach(var useCaseId in useCasesForInsert)
            {
                user.UserUseCases.Add(new Domain.UserUseCase
                {
                    UseCaseId = useCaseId
                });
            }

            _context.SaveChanges();
        }
    }
}
