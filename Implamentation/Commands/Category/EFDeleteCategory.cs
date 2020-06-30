using Application.Commands.Category;
using Application.Exceptions;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implamentation.Commands.Category
{
    public class EFDeleteCategory : IDeleteCategory
    {
        private readonly ProjectContext _context;

        public EFDeleteCategory(ProjectContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCasesEnum.EFDeleteCategory;

        public string Name => UseCasesEnum.EFDeleteCategory.ToString();

        public void Execute(int id)
        {
            var category = _context.Categories.Include(x => x.Titles).FirstOrDefault(x => x.Id == id);

            if(category == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Category));
            }

            if(category.Titles.Count > 0)
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