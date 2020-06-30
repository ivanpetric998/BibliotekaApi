using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Author
{
    public interface IGetOneAuthor : IQuery<AuthorDto,int>
    {
    }
}
