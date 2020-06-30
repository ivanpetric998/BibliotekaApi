using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.Book;
using AutoMapper;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implamentation.Queries.Book
{
    public class EFGetOneBook : IGetOneBook
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetOneBook(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetOneBook;

        public string Name => UseCasesEnum.EFGetOneBook.ToString();

        public BookDto Execute(int id)
        {
            var book = _context.Books
                .Include(x => x.Title)
                    .ThenInclude(x => x.TitleAuthors)
                    .ThenInclude(x => x.Author)
                .Include(x => x.Title)
                    .ThenInclude(x => x.Publisher)
                .Include(x => x.Title)
                    .ThenInclude(x => x.Category)
                .Include(x => x.Title)
                    .ThenInclude(x => x.Prices)
                .FirstOrDefault(x => x.Id == id);

            if (book == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Book));
            }

            return _mapper.Map<BookDto>(book);
        }
    }
}
