using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class LoggerSearch : PagedSearch
    {
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public string UseCaseName { get; set; }
        public int? ActorId { get; set; }
    }
}
