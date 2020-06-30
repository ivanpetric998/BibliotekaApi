using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class NumberAllowdDaysDto : BaseDto
    {
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public int Value { get; set; }
    }
}
