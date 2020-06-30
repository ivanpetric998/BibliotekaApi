using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Issuance
{
    public interface IGetOneIssuance : IQuery<IssuanceDto,int>
    {
    }
}
