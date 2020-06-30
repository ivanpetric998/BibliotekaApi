using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Publisher
{
    public interface IGetPublishers : IQuery<PagedResponse<PublisherDto>,PublisherSearch>
    {
    }
}
