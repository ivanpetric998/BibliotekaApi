using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Title
{
    public interface IGetTitles : IQuery<PagedResponse<TitleDto>,TitleSearch>
    {
    }
}
