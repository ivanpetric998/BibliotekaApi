using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class RecompenseSearch : PagedSearch
    {
        public bool? ExistTransgression { get; set; }
        public bool? ExistDamage { get; set; }
        public decimal? MinPrice { get; set; }
        public decimal? MaxPrice { get; set; }
    }
}
