using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Book
{
    public interface IGetOneBook : IQuery<BookDto,int>
    {
    }
}
