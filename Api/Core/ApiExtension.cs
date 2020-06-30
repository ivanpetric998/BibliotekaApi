using Application;
using Application.Commands;
using Application.Commands.Author;
using Application.Commands.Book;
using Application.Commands.Category;
using Application.Commands.Issuance;
using Application.Commands.Member;
using Application.Commands.NumberAllowdDays;
using Application.Commands.Pricelist;
using Application.Commands.Publisher;
using Application.Commands.Role;
using Application.Commands.Title;
using Application.Commands.User;
using Application.Queries.Author;
using Application.Queries.Book;
using Application.Queries.Category;
using Application.Queries.Issuance;
using Application.Queries.Logger;
using Application.Queries.Member;
using Application.Queries.NumberAllowdDays;
using Application.Queries.Pricelist;
using Application.Queries.Publisher;
using Application.Queries.Recompense;
using Application.Queries.Role;
using Application.Queries.Title;
using Application.Queries.User;
using EFDataAccess;
using Implamentation;
using Implamentation.Commands;
using Implamentation.Commands.Author;
using Implamentation.Commands.Book;
using Implamentation.Commands.Category;
using Implamentation.Commands.Issuance;
using Implamentation.Commands.Member;
using Implamentation.Commands.NumberAllowdDays;
using Implamentation.Commands.Pricelist;
using Implamentation.Commands.Publisher;
using Implamentation.Commands.Role;
using Implamentation.Commands.Title;
using Implamentation.Commands.User;
using Implamentation.Logging;
using Implamentation.Queries.Author;
using Implamentation.Queries.Book;
using Implamentation.Queries.Category;
using Implamentation.Queries.Issuance;
using Implamentation.Queries.Logger;
using Implamentation.Queries.Member;
using Implamentation.Queries.NumberAllowdDays;
using Implamentation.Queries.Pricelist;
using Implamentation.Queries.Publisher;
using Implamentation.Queries.Recompense;
using Implamentation.Queries.Role;
using Implamentation.Queries.Title;
using Implamentation.Queries.User;
using Implamentation.Validators.Author;
using Implamentation.Validators.Book;
using Implamentation.Validators.Category;
using Implamentation.Validators.Issuance;
using Implamentation.Validators.Member;
using Implamentation.Validators.NumberAllowdDays;
using Implamentation.Validators.Pricelist;
using Implamentation.Validators.Publisher;
using Implamentation.Validators.Role;
using Implamentation.Validators.Title;
using Implamentation.Validators.User;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.Core
{
    public static class ApiExtension
    {
        public static void LoadUseCaseObjects(this IServiceCollection services)
        {
            services.AddTransient<UseCaseExecutor>();
            

            services.AddTransient<FluentCreateAuthorValidator>();
            services.AddTransient<FluentUpdateAuthorValidator>();

            services.AddTransient<ICreateAuthor, EFCreateAuthor>();
            services.AddTransient<IGetOneAuthor, EFGetOneAuthor>();
            services.AddTransient<IGetAuthors, EFGetAuthors>();
            services.AddTransient<IUpdateAuthor, EFUpdateAuthor>();
            services.AddTransient<IDeleteAuthor, EFDeleteAuthor>();


            services.AddTransient<FluentCreateCategoryValidator>();
            services.AddTransient<FluentUpdateCategoryValidator>();

            services.AddTransient<ICreateCategory, EFCreateCategory>();
            services.AddTransient<IGetOneCategory, EFGetOneCategory>();
            services.AddTransient<IDeleteCategory, EFDeleteCategory>();
            services.AddTransient<IGetCategories, EFGetCategories>();
            services.AddTransient<IUpdateCategory, EFUpdateCategory>();


            services.AddTransient<FluentCreateRoleValidator>();
            services.AddTransient<FluentUpdateRoleValidator>();

            services.AddTransient<ICreateRole, EFCreateRole>();
            services.AddTransient<IGetOneRole, EFGetOneRole>();
            services.AddTransient<IDeleteRole, EFDeleteRole>();
            services.AddTransient<IGetRoles, EFGetRoles>();
            services.AddTransient<IUpdateRole, EFUpdateRole>();


            services.AddTransient<FluentUpdatePublisherValidator>();
            services.AddTransient<FluentCreatePublisherValidator>();

            services.AddTransient<ICreatePublisher, EFCreatePublisher>();
            services.AddTransient<IGetOnePublisher, EFGetOnePublisher>();
            services.AddTransient<IDeletePublisher, EFDeletePublisher>();
            services.AddTransient<IGetPublishers, EFGetPublishers>();
            services.AddTransient<IUpdatePublisher, EFUpdatePublisher>(); 


            services.AddTransient<FluentCreatePriceValidator>();

            services.AddTransient<ICreatePrice, EFCreatePrice>();
            services.AddTransient<IGetPricelists, EFGetPricelists>();


            services.AddTransient<FluentCreateMemberValidator>();
            services.AddTransient<FluentUpdateMemberValidator>();

            services.AddTransient<ICreateMember, EFCreateMember>();
            services.AddTransient<IUpdateMember, EFUpdateMember>();
            services.AddTransient<IGetMembers, EFGetMembers>();
            services.AddTransient<IGetOneMember, EFGetOneMember>();
            services.AddTransient<IDeleteMember, EFDeleteMember>();


            services.AddTransient<FluentCreateNumberAllowdDaysValidator>();

            services.AddTransient<ICreateNumberAllowedDays, EFCreateNumberAllowedDays>();
            services.AddTransient<IGetNumberAllowdDays, EFGetNumberAllowedDays>();


            services.AddTransient<FluentCreateUserValidator>();
            services.AddTransient<FluentUpdateUserValidator>();

            services.AddTransient<ICreateCommand, EFCreateUser>();
            services.AddTransient<IGetUsers, EFGetUsers>();
            services.AddTransient<IGetOneUser, EFGetOneUser>();
            services.AddTransient<IUpdateUser, EFUpdateUser>();
            services.AddTransient<IDeleteUser, EFDeleteUser>();


            services.AddTransient<FluentCreateTitleValidator>();
            services.AddTransient<FluentUpdateTitleValidator>();

            services.AddTransient<ICreateTitle, EFCreateTitle>();
            services.AddTransient<IGetTitles, EFGetTitles>();
            services.AddTransient<IGetOneTitle, EFGetOneTitle>();
            services.AddTransient<IUpdateTitle, EFUpdateTitle>();
            services.AddTransient<IDeleteTitle, EFDeleteTitle>();


            services.AddTransient<FluentCreateBookValidator>();
            services.AddTransient<FluentUpdateBookValidator>();

            services.AddTransient<ICreateBook, EFCreateBook>();
            services.AddTransient<IDeleteBook, EFDeleteBook>();
            services.AddTransient<IUpdateBook, EFUpdateBook>();
            services.AddTransient<IGetBooks, EFGetBooks>();
            services.AddTransient<IGetOneBook, EFGetOneBook>();


            services.AddTransient<FluentRentBookValidator>();
            services.AddTransient<FluentReturnBookValidator>();

            services.AddTransient<IRentBook,EFRentBook>();
            services.AddTransient<IGetIssuances, EFGetIssuances>();
            services.AddTransient<IGetOneIssuance, EFGetOneIssuance>();
            services.AddTransient<IReturnBook, EFReturnBook>();


            services.AddTransient<IGetRecompenses, EFGetRecompenses>();

            services.AddTransient<IGetLogs, EFGetLogs>();

            services.AddTransient<IAdminSendEmail, EFAdminSendEmail>();
        }

        public static void AddJwt(this IServiceCollection services, AppSettings appSettings)
        {
            services.AddTransient<JwtManager>(x =>
            {
                var context = x.GetService<ProjectContext>();

                return new JwtManager(context, appSettings.JwtIssuer, appSettings.JwtSecretKey);
            });

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = appSettings.JwtIssuer,
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(appSettings.JwtSecretKey)),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new NoNameActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });
        }
    }
}
