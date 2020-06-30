using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Author
{
    public interface IGetAuthors : IQuery<PagedResponse<AuthorDto>,AuthorSearch>
    {
    }
}
