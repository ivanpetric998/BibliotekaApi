using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Profiles
{
    public class LoggerProfile : Profile
    {
        public LoggerProfile()
        {
            CreateMap<UseCaseLog, LoggerDto>();
        }
    }
}
