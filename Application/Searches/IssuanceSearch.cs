using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class IssuanceSearch : PagedSearch
    {
        public DateTime? RentedDateFrom { get; set; }
        public DateTime? RentedDateTo { get; set; }
        public IssuanceStatus? Status { get; set; }
        public bool? ExistRecompense { get; set; }
        public ICollection<int> TitleIds { get; set; } = new List<int>();
        public ICollection<int> MemberIds { get; set; } = new List<int>();
        public ICollection<int> LibrarianRentedIds { get; set; } = new List<int>();
        public ICollection<int> LibrarianReturnedIds { get; set; } = new List<int>();

    }
}
