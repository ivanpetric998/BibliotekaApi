using Application.Commands.NumberAllowdDays;
using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Implamentation.Validators.NumberAllowdDays;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implamentation.Commands.NumberAllowdDays
{
    public class EFCreateNumberAllowedDays : ICreateNumberAllowedDays
    {
        private readonly ProjectContext _context;
        private readonly FluentCreateNumberAllowdDaysValidator _validator;

        public EFCreateNumberAllowedDays(ProjectContext context, FluentCreateNumberAllowdDaysValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EFCreateNumberAllowedDays;

        public string Name => UseCasesEnum.EFCreateNumberAllowedDays.ToString();

        public void Execute(NumberAllowdDaysDto request)
        {
            _validator.ValidateAndThrow(request);

            var numberAlloweddays = _context.NumberAllowdDays.FirstOrDefault(x => x.IsActive == true);

            if (numberAlloweddays != null)
            {
                numberAlloweddays.IsActive = false;
                numberAlloweddays.DateTo = DateTime.Now;
            }

            _context.NumberAllowdDays.Add(new Domain.NumberAllowdDays
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
