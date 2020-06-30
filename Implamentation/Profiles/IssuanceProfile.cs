using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Profiles
{
    public class IssuanceProfile : Profile
    {
        public IssuanceProfile()
        {
            CreateMap<Issuance, IssuanceDto>();
        }
    }
}
