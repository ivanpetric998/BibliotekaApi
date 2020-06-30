using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Issuance
{
    public interface IReturnBook : ICommand<ReturnBookDto>
    {
    }
}
