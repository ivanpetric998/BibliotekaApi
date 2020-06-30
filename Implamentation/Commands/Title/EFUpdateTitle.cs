using Application.Commands.Title;
using Application.DataTransfer;
using Application.Exceptions;
using EFDataAccess;
using FluentValidation;
using Implamentation.Extensions;
using Implamentation.Validators.Title;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.Title
{
    public class EFUpdateTitle : IUpdateTitle
    {
        private readonly ProjectContext _context;
        private readonly FluentUpdateTitleValidator _validator;

        public EFUpdateTitle(ProjectContext context, FluentUpdateTitleValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EFUpdateTitle;

        public string Name => UseCasesEnum.EFUpdateTitle.ToString();

        public void Execute(CreateModifyTitle request)
        {
            var title = _context.Titles.Include(x => x.Prices).Include(x => x.TitleAuthors).FirstOrDefault(x => x.Id == request.Id);

            if(title == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Title)); 
            }

            _validator.ValidateAndThrow(request);

            title.Name = request.Name;
            title.IssueYear = request.IssueYear;
            title.CategoryId = request.CategoryId;
            title.PublisherId = request.PublisherId;
            title.IsActive = request.IsActive;

            if(request.PriceForDamage != title.Prices.Where(x => x.IsActive).FirstOrDefault().Price)
            {
                foreach(var price in title.Prices)
                {
                    price.IsActive = false;
                    price.DateTo = DateTime.Now;
                }

                title.Prices.Add(new Domain.TitlePrice
                {
                    DateFrom = DateTime.Now,
                    Price = request.PriceForDamage,
                    IsActive = true
                });
            }

            if(request.Image != null)
            {
                title.Image = request.Image.UploadImage("BookImages");
            }
            
            var authorsForDelete = title.TitleAuthors.Where(x => !request.Authors.Contains(x.AuthorId)).ToList();
            var authorsForInsert = request.Authors.Where(id => !title.TitleAuthors.Select(x => x.AuthorId).Contains(id)).ToList();

            foreach (var authorId in authorsForInsert)
            {
                title.TitleAuthors.Add(new Domain.TitleAuthor
                {
                    AuthorId = authorId
                });
            }

            foreach (var author in authorsForDelete)
            {
                title.TitleAuthors.Remove(author);
            }

            _context.SaveChanges();
        }
    }
}
