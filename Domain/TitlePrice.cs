using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class TitlePrice : BaseEntity
    {
        public int TitleId { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public decimal Price { get; set; }

        public virtual Title Title { get; set; }
    }
}
