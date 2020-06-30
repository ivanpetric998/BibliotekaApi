using Application.Commands.Book;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Book;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Book
{
    public class EFUpdateBook : IUpdateBook
    {
        private readonly ProjectContext _context;
        private readonly FluentUpdateBookValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdateBook(ProjectContext context, FluentUpdateBookValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFUpdateBook;

        public string Name => UseCasesEnum.EFUpdateBook.ToString();

        public void Execute(CreateModifyBookDto request)
        {
            var book = _context.Books.Find(request.Id);

            if (book == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Book));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, book);
            _context.SaveChanges();
        }
    }
}
