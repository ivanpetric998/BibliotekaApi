using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class PricelistSearch : PagedSearch
    {
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public decimal? PriceFrom { get; set; }
        public decimal? PriceTo { get; set; }
    }
}
