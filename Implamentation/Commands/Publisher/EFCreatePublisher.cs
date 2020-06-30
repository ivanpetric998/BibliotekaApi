using Application.Commands.Publisher;
using Application.DataTransfer;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Publisher;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Publisher
{
    public class EFCreatePublisher : ICreatePublisher
    {
        private readonly ProjectContext _context;
        private readonly FluentCreatePublisherValidator _validator;
        private readonly IMapper _mapper;

        public EFCreatePublisher(ProjectContext context, FluentCreatePublisherValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => (int)UseCasesEnum.EFCreatePublisher;

        public string Name => UseCasesEnum.EFCreatePublisher.ToString();

        public void Execute(PublisherDto request)
        {
            _validator.ValidateAndThrow(request);
            _context.Publishers.Add(_mapper.Map<Domain.Publisher>(request));
            _context.SaveChanges();
        }
    }
}
