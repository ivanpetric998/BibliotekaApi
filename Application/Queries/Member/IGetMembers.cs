using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Member
{
    public interface IGetMembers : IQuery<PagedResponse<MemberDto>, MemberSearch>
    {
    }
}
