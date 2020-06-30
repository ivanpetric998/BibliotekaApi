using Application.Commands.Publisher;
using Application.Exceptions;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.Publisher
{
    public class EFDeletePublisher : IDeletePublisher
    {
        private readonly ProjectContext _context;

        public EFDeletePublisher(ProjectContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCasesEnum.EFDeletePublisher;

        public string Name => UseCasesEnum.EFDeletePublisher.ToString();

        public void Execute(int id)
        {
            var category = _context.Publishers.Include(x => x.Titles).FirstOrDefault(x => x.Id == id);

            if (category == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Publisher));
            }

            if (category.Titles.Count > 0)
            {
                throw new ConflictException("You can't delete this resource because it is used in the system");
            }

            category.IsActive = false;
            category.IsDeleted = true;
            category.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
