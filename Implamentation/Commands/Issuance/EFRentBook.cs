using Application;
using Application.Commands.Issuance;
using Application.DataTransfer;
using AutoMapper;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Issuance;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Issuance
{
    public class EFRentBook : IRentBook
    {
        private readonly ProjectContext _context;
        private readonly FluentRentBookValidator _validator;
        private readonly IApplicationActor _actor;

        public EFRentBook(ProjectContext context, FluentRentBookValidator validator, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
        }

        public int Id => (int)UseCasesEnum.EFRentBook;

        public string Name => UseCasesEnum.EFRentBook.ToString();

        public void Execute(RentBookDto request)
        {
            _validator.ValidateAndThrow(request);
            _context.Issuances.Add(new Domain.Issuance
            {
                RentedDate = DateTime.Now,
                MemberId = request.MemberId,
                BookId = request.BookId,
                LibrarianRentedId = _actor.Id,
                IsActive = true,
                Status = IssuanceStatus.Rented
            });
            _context.SaveChanges();
        }
    }
}
