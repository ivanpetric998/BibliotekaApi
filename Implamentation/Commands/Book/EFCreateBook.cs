using Application.Commands.Book;
using Application.DataTransfer;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Book;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Book
{
    public class EFCreateBook : ICreateBook
    {
        private readonly ProjectContext _context;
        private readonly FluentCreateBookValidator _validator;
        private readonly IMapper _mapper;

        public EFCreateBook(ProjectContext context, FluentCreateBookValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFCreateBook;

        public string Name => UseCasesEnum.EFCreateBook.ToString();

        public void Execute(CreateModifyBookDto request)
        {
            _validator.ValidateAndThrow(request);
            _context.Books.Add(_mapper.Map<Domain.Book>(request));
            _context.SaveChanges();
        }
    }
}
