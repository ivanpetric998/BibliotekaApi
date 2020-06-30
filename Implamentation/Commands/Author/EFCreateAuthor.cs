using Application.Commands.Author;
using Application.DataTransfer;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Author;
using System;
using System.Collections.Generic;
using System.Text;
using Domain;

namespace Implamentation.Commands.Author
{
    public class EFCreateAuthor : ICreateAuthor
    {
        private readonly ProjectContext _context;
        private readonly FluentCreateAuthorValidator _validator;
        private readonly IMapper _mapper;

        public EFCreateAuthor(ProjectContext context, FluentCreateAuthorValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFCreateAuthor;

        public string Name => UseCasesEnum.EFCreateAuthor.ToString();

        public void Execute(AuthorDto request)
        {
            _validator.ValidateAndThrow(request);
            _context.Authors.Add(_mapper.Map<Domain.Author>(request));
            _context.SaveChanges();
        }
    }
}
