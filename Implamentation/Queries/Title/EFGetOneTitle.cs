using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.Title;
using AutoMapper;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Queries.Title
{
    public class EFGetOneTitle : IGetOneTitle
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetOneTitle(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetOneTitle;

        public string Name => UseCasesEnum.EFGetOneTitle.ToString();

        public TitleDto Execute(int id)
        {
            var title = _context.Titles.Include(x => x.Prices)
                .Include(x => x.Publisher).Include(x => x.Category)
                .Include(x => x.TitleAuthors).ThenInclude(x => x.Author)
                .FirstOrDefault(x => x.Id == id);

            if (title == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Title));
            }

            return _mapper.Map<TitleDto>(title);
        }
    }
}
