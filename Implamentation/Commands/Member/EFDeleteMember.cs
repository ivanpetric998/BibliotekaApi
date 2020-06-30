using Application.Commands.Member;
using Application.Exceptions;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.Member
{
    public class EFDeleteMember : IDeleteMember
    {
        private readonly ProjectContext _context;

        public EFDeleteMember(ProjectContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCasesEnum.EFDeleteMember;

        public string Name => UseCasesEnum.EFDeleteMember.ToString();

        public void Execute(int id)
        {
            var member = _context.Members.Include(x => x.Issuances).FirstOrDefault(x => x.Id == id);

            if (member == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Member));
            }

            if (member.Issuances.Count > 0)
            {
                throw new ConflictException("You can't delete this resource because it is used in the system");
            }

            member.IsActive = false;
            member.IsDeleted = true;
            member.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
