using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class MemberSearch : PagedSearch
    {
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public int? MemberCardNumber { get; set; }
    }
}
