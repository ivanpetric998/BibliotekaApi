using Application.Commands.Title;
using Application.DataTransfer;
using AutoMapper;
using EFDataAccess;
using FluentValidation;
using Implamentation.Extensions;
using Implamentation.Validators.Title;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands.Title
{
    public class EFCreateTitle : ICreateTitle
    {
        private readonly ProjectContext _context;
        private readonly FluentCreateTitleValidator _validator;

        public EFCreateTitle(ProjectContext context, FluentCreateTitleValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EFCreateTitle;

        public string Name => UseCasesEnum.EFCreateTitle.ToString();

        public void Execute(CreateModifyTitle request)
        {
            _validator.ValidateAndThrow(request);

            var title = new Domain.Title()
            {
                Name = request.Name,
                PublisherId = request.PublisherId,
                CategoryId = request.CategoryId,
                IssueYear = request.IssueYear,
                Image = request.Image.UploadImage("BookImages"),
				IsActive = request.IsActive
            };

            title.Prices.Add(new Domain.TitlePrice
            {
                Price = request.PriceForDamage,
                DateFrom = DateTime.Now,
                IsActive = true
            });

            foreach (var AuthorId in request.Authors)
            {
                title.TitleAuthors.Add(new Domain.TitleAuthor
                {
                    AuthorId = AuthorId
                });
            }

            _context.Titles.Add(title);
            _context.SaveChanges();
        }
    }
}