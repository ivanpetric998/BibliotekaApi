using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class PricelistDto : BaseDto
    {
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public decimal Value { get; set; }
    }
}
