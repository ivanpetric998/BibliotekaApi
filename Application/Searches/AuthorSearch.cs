using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class AuthorSearch : PagedSearch
    {
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
    }
}
