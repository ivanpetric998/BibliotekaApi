using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Issuance
{
    public interface IGetIssuances : IQuery<PagedResponse<IssuanceDto>, IssuanceSearch>
    {
    }
}
