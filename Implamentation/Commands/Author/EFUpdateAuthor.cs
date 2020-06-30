using Application.Commands.Author;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Author;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Author
{
    public class EFUpdateAuthor : IUpdateAuthor
    {
        private readonly ProjectContext _context;
        private readonly FluentUpdateAuthorValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdateAuthor(ProjectContext context, FluentUpdateAuthorValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFUpdateAuthor;

        public string Name => UseCasesEnum.EFUpdateAuthor.ToString();

        public void Execute(AuthorDto request)
        {
            var author = _context.Authors.Find(request.Id);

            if(author == null)
            {
                throw new EntityNotFoundException(request.Id,typeof(Domain.Author));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request,author);
            _context.SaveChanges();
        }
    }
}
