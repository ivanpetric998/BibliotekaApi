using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class BookDto : BaseDto
    {
        public int SerialNumber { get; set; }
        public int TitleId { get; set; }
        public TitleDto Title { get; set; }
    }

    public class CreateModifyBookDto : BaseDto
    {
        public int SerialNumber { get; set; }
        public int TitleId { get; set; }
    }
}
