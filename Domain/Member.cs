using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Member : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public int MemberCardNumber { get; set; }

        public virtual ICollection<Issuance> Issuances { get; set; } = new HashSet<Issuance>();
    }
}
