using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.NumberAllowdDays
{
    public interface IGetNumberAllowdDays : IQuery<PagedResponse<NumberAllowdDaysDto>,NumberAllowdDaysSearch>
    {
    }
}
