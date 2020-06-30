using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Profiles
{
    public class PricelistProfile : Profile
    {
        public PricelistProfile()
        {
            CreateMap<PricelistDto, Pricelist>();
            CreateMap<Pricelist, PricelistDto>();
        }
    }
}
