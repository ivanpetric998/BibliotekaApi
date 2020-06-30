using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.Publisher;
using AutoMapper;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Queries.Publisher
{
    public class EFGetOnePublisher : IGetOnePublisher
    {
        private readonly ProjectContext _context;
        private readonly IMapper _mapper;

        public EFGetOnePublisher(ProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFGetOnePublisher;

        public string Name => UseCasesEnum.EFGetOnePublisher.ToString();

        public PublisherDto Execute(int id)
        {
            var publisher = _context.Publishers.Find(id);

            if (publisher == null)
            {
                throw new EntityNotFoundException(id, typeof(Domain.Publisher));
            }

            return _mapper.Map<PublisherDto>(publisher);
        }
    }
}
