using Application;
using Application.Commands.Issuance;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Issuance;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.Issuance
{
    public class EFReturnBook : IReturnBook
    {
        private readonly ProjectContext _context;
        private readonly FluentReturnBookValidator _validator;
        private readonly IApplicationActor _actor;

        public EFReturnBook(ProjectContext context, FluentReturnBookValidator validator, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
        }

        public int Id => (int)UseCasesEnum.EFReturnBook;

        public string Name => UseCasesEnum.EFReturnBook.ToString();

        public void Execute(ReturnBookDto request)
        {
            var issunce = _context.Issuances.Include(x => x.Book).FirstOrDefault(x => x.Id == request.IssuanceId);

            if(issunce == null)
            {
                throw new EntityNotFoundException(request.IssuanceId, typeof(Domain.Issuance));
            }

            if(issunce.Status == IssuanceStatus.Returned)
            {
                throw new ConflictException("This book alerady returned");
            }

            _validator.ValidateAndThrow(request);

            issunce.LibrarianReturnedId = _actor.Id;
            issunce.ReturnedDate = DateTime.Now;
            issunce.Status = IssuanceStatus.Returned;

            decimal sum = 0;
            var existDamage = false;
            var existTransgression = false;

            var allowedDays = _context.NumberAllowdDays.Where(x => x.IsActive).FirstOrDefault() != null ?
                    _context.NumberAllowdDays.Where(x => x.IsActive).FirstOrDefault().Value : 0;

            var numberRentedDays = (int)(DateTime.Now.Date - issunce.RentedDate.Date).TotalDays;

            if (numberRentedDays >= allowedDays)
            {
                var pricePerDay = _context.Pricelists.Where(x => x.IsActive).FirstOrDefault() != null ?
                _context.Pricelists.Where(x => x.IsActive).FirstOrDefault().Value : 0;

                sum+= (numberRentedDays - allowedDays) * pricePerDay;
                existTransgression = true;
            }

            if (request.ExistDamage)
            {
                var title = _context.Titles.Include(x => x.Prices).FirstOrDefault(x => x.Id == issunce.Book.TitleId);
                var priceForDamage = title.Prices.Where(x => x.IsActive).FirstOrDefault();

                sum += priceForDamage != null ? priceForDamage.Price : 0;
                existDamage = true;
            }

            if(sum > 0)
            {
                issunce.ExistRecompense = true;
                issunce.Recompense = new Domain.Recompense
                {
                    TotalPrice = sum,
                    ExistDamage = existDamage,
                    ExistTransgression = existTransgression,
                    IsActive = true
                };
            }
			else
			{
				issunce.ExistRecompense = false;
			}

            _context.SaveChanges();

        }
    }
}
