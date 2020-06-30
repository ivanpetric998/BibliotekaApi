using Application.Commands.Role;
using Application.Exceptions;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.Role
{
    public class EFDeleteRole : IDeleteRole
    {
        private readonly ProjectContext _context;

        public EFDeleteRole(ProjectContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCasesEnum.EFDeleteRole;

        public string Name => UseCasesEnum.EFDeleteRole.ToString();

        public void Execute(int id)
        {
            var role = _context.Roles.Include(x => x.Users).FirstOrDefault(x => x.Id == id);

            if (role == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Role));
            }

            if (role.Users.Count > 0)
            {
                throw new ConflictException("You can't delete this resource because it is used in the system");
            }

            role.IsActive = false;
            role.IsDeleted = true;
            role.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
