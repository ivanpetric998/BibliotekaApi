using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Book
{
    public interface ICreateBook : ICommand<CreateModifyBookDto>
    {
    }
}
