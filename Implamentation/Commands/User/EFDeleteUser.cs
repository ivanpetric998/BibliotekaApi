using Application.Commands.User;
using Application.Exceptions;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.User
{
    public class EFDeleteUser : IDeleteUser
    {
        private readonly ProjectContext _context;

        public EFDeleteUser(ProjectContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCasesEnum.EFDeleteUser;

        public string Name => UseCasesEnum.EFDeleteUser.ToString();

        public void Execute(int id)
        {
            var user = _context.Users.Include(x => x.UserUseCases).FirstOrDefault(x => x.Id == id);

            if (user == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.User));
            }

            if (user.IssueBooks.Count > 0 && user.ReturnedBooks.Count > 0)
            {
                throw new ConflictException("You can't delete this resource because it is used in the system");
            }

            user.DeletedAt = DateTime.Now;
            user.IsDeleted = true;
            user.IsActive = false;
            
            foreach(var x in user.UserUseCases)
            {
                x.DeletedAt = DateTime.Now;
                x.IsDeleted = true;
                x.IsActive = false;
            }

            _context.SaveChanges();
        }
    }
}
