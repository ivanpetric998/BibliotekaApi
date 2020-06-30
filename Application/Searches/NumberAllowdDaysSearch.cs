using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class NumberAllowdDaysSearch : PagedSearch
    {
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public decimal? DayFrom { get; set; }
        public decimal? DayTo { get; set; }
    }
}
