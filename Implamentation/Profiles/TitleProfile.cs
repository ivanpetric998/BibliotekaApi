using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Profiles
{
    public class TitleProfile : Profile
    {
        public TitleProfile()
        {
            CreateMap<Title, TitleDto>()
                .ForMember(dest => dest.PriceForDamage, member =>
                member.MapFrom(source => source.Prices.Where(x => x.IsActive).FirstOrDefault().Price))
                .ForMember(dest => dest.Authors, 
                member => member.MapFrom(source => source.TitleAuthors.Select(x => x.Author)));
        }
    }
}
