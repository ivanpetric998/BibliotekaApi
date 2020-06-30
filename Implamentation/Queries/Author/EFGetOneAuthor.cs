using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.Author;
using AutoMapper;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Queries.Author
{
    public class EFGetOneAuthor : IGetOneAuthor
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetOneAuthor(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetOneAuthor;

        public string Name => UseCasesEnum.EFGetOneAuthor.ToString();

        public AuthorDto Execute(int id)
        {
            var author = _context.Authors.Find(id);

            if(author == null)
            {
                throw new EntityNotFoundException(id,typeof(Domain.Author));
            }

            return _mapper.Map<AuthorDto>(author);
        }
    }
}
