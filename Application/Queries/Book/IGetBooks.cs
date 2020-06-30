using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Book
{
    public interface IGetBooks : IQuery<PagedResponse<BookDto>, BookSearch>
    {
    }
}
