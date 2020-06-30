using Application.Commands.Title;
using Application.Exceptions;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.Title
{
    public class EFDeleteTitle : IDeleteTitle
    {
        private readonly ProjectContext _context;

        public EFDeleteTitle(ProjectContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCasesEnum.EFDeleteTitle;

        public string Name => UseCasesEnum.EFDeleteTitle.ToString();

        public void Execute(int id)
        {
            var title = _context.Titles.Include(x => x.Prices).Include(x => x.TitleAuthors).Include(x => x.Books).FirstOrDefault(x => x.Id == id);

            if (title == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Title));
            }

            if(title.Books.Count > 0)
            {
                throw new ConflictException("You can't delete this resource because it is used in the system");
            }

            var prices = title.Prices.ToList();
            foreach (var price in prices)
            {
                price.IsDeleted = true;
                price.IsActive = false;
                price.DeletedAt = DateTime.Now;
            }

            var titleAuthors = title.TitleAuthors.ToList();
            foreach (var author in titleAuthors)
            {
                title.TitleAuthors.Remove(author);
            }

            title.IsActive = false;
            title.IsDeleted = true;
            title.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
