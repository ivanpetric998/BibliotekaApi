using Application.Commands.Book;
using Application.Exceptions;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.Book
{
    public class EFDeleteBook : IDeleteBook
    {
        private readonly ProjectContext _context;

        public EFDeleteBook(ProjectContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCasesEnum.EFDeleteBook;

        public string Name => UseCasesEnum.EFDeleteBook.ToString();

        public void Execute(int id)
        {
            var book = _context.Books.Include(x => x.Issuances).FirstOrDefault(x => x.Id == id);

            if (book == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Book));
            }

            if (book.Issuances.Count > 0)
            {
                throw new ConflictException("You can't delete this resource because it is used in the system");
            }

            book.IsActive = false;
            book.IsDeleted = true;
            book.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
