using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class NumberAllowdDays : BaseEntity
    {
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public int Value { get; set; }
    }
}
