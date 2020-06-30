using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class TitleAuthor
    {
        public int TitleId { get; set; }
        public int AuthorId { get; set; }

        public virtual Author Author { get; set; }
        public virtual Title Title { get; set; }
    }
}
