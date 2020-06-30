using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class TitleSearch : PagedSearch
    {
        public ICollection<int> PublisherIds { get; set; } = new List<int>();
        public ICollection<int> CategoryIds { get; set; } = new List<int>();
        public ICollection<int> AuthorIds { get; set; } = new List<int>();
        public string Name { get; set; }
        public int? IssueYearFrom { get; set; }
        public int? IssueYearTo { get; set; }
    }
}
