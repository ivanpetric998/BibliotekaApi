using Application.DataTransfer;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Profiles
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<CreateUserDto, User>()
                .ForMember(dest => dest.Password, member => member.MapFrom(source => EasyEncryption.MD5.ComputeMD5Hash(source.Password)))
                .ForMember(source => source.Role, opt => opt.Ignore());

            CreateMap<User, UserDto>()
                .ForMember(dest => dest.UseCases, member => member.MapFrom(source => source.UserUseCases.Select(x => x.UseCaseId)))
                .ForMember(source => source.Password, opt => opt.Ignore());

        }
    }
}
