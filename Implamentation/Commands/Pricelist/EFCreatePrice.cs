using Application.Commands.Pricelist;
using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.Pricelist;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.Pricelist
{
    public class EFCreatePrice : ICreatePrice
    {
        private readonly ProjectContext _context;
        private readonly FluentCreatePriceValidator _validator;

        public EFCreatePrice(ProjectContext context, FluentCreatePriceValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EFCreatePrice;

        public string Name => UseCasesEnum.EFCreatePrice.ToString();

        public void Execute(PricelistDto request)
        {
            _validator.ValidateAndThrow(request);

            var price = _context.Pricelists.FirstOrDefault(x => x.IsActive == true);

            if(price != null)
            {
                price.IsActive = false;
                price.DateTo = DateTime.Now;
            }

            _context.Pricelists.Add(new Domain.Pricelist
            {
                DateFrom = DateTime.Now,
                DateTo = null,
                Value = request.Value,
                IsActive = true
            });

            _context.SaveChanges();
        }
    }
}
