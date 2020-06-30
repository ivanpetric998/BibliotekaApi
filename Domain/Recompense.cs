using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Recompense : BaseEntity
    {
        public int IssuanceId { get; set; }
        public bool ExistTransgression { get; set; }
        public bool ExistDamage { get; set; }
        public decimal TotalPrice { get; set; }

        public virtual Issuance Issuance { get; set; }

    }
}
