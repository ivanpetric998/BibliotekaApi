using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Logger
{
    public interface IGetLogs : IQuery<PagedResponse<LoggerDto>, LoggerSearch>
    {
    }
}
