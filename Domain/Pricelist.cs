using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Pricelist : BaseEntity
    {
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public decimal Value { get; set; }
    }
}
