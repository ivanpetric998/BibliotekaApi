using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Book : BaseEntity
    {
        public int TitleId { get; set; }
        public int SerialNumber { get; set; }

        public virtual Title Title { get; set; }
        public virtual ICollection<Issuance> Issuances { get; set; } = new HashSet<Issuance>();
    }
}
