using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class RecompenseDto : BaseDto
    {
        public bool ExistTransgression { get; set; }
        public bool ExistDamage { get; set; }
        public decimal TotalPrice { get; set; }

        public virtual IssuanceDto Issuance { get; set; }
    }
}
