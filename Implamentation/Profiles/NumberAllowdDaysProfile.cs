using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Profiles
{
    public class NumberAllowdDaysProfile : Profile
    {
        public NumberAllowdDaysProfile()
        {
            CreateMap<NumberAllowdDays, NumberAllowdDaysDto>();
            CreateMap<CategoryDto, Category>();
        }
    }
}
