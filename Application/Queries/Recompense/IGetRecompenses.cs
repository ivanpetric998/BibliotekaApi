using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Recompense
{
    public interface IGetRecompenses : IQuery<PagedResponse<RecompenseDto>, RecompenseSearch>
    {
    }
}
