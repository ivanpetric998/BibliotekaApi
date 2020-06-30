using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Profiles
{
    public class RecompenseProfile : Profile
    {
        public RecompenseProfile()
        {
            CreateMap<Recompense, RecompenseDto>();
        }
    }
}
