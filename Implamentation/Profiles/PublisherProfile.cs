using Application.DataTransfer;
using AutoMapper;
using Domain;
using Microsoft.EntityFrameworkCore.Migrations.Operations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Profiles
{
    public class PublisherProfile : Profile
    {
        public PublisherProfile()
        {
            CreateMap<Publisher, PublisherDto>();
            CreateMap<PublisherDto, Publisher>();
        }
    }
}
