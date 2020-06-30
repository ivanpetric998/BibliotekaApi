using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class BookSearch : PagedSearch
    {
        public int? SerialNumber { get; set; }
        public ICollection<int> TitleIds { get; set; } = new List<int>();
    }
}
