using Application.Commands.Publisher;
using Application.DataTransfer;
using Application.Exceptions;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Publisher;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Publisher
{
    public class EFUpdatePublisher : IUpdatePublisher
    {
        private readonly ProjectContext _context;
        private readonly FluentUpdatePublisherValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdatePublisher(ProjectContext context, FluentUpdatePublisherValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFUpdatePublisher;

        public string Name => UseCasesEnum.EFUpdatePublisher.ToString();

        public void Execute(PublisherDto request)
        {
            var publisher = _context.Publishers.Find(request.Id);

            if (publisher == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Publisher));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, publisher);
            _context.SaveChanges();
        }
    }
}
