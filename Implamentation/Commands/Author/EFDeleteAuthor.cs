using Application.Commands.Author;
using Application.Exceptions;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.Author
{
    public class EFDeleteAuthor : IDeleteAuthor
    {
        private readonly ProjectContext _context;

        public EFDeleteAuthor(ProjectContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCasesEnum.EFDeleteAuthor;

        public string Name => UseCasesEnum.EFDeleteAuthor.ToString();

        public void Execute(int id)
        {
            var author = _context.Authors.Include(x => x.TitleAuthors).FirstOrDefault(x => x.Id == id);

            if(author == null)
            {
                throw new EntityNotFoundException(id,typeof(Domain.Author));
            }

            if(author.TitleAuthors.Count > 0)
            {
                throw new ConflictException("You can't delete this resource because it is used in the system");
            }

            author.IsDeleted = true;
            author.IsActive = false;
            author.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
