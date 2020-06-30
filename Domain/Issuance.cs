using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Issuance : BaseEntity
    {
        public DateTime RentedDate { get; set; }
        public DateTime? ReturnedDate { get; set; }
        public IssuanceStatus Status { get; set; }
        public bool? ExistRecompense { get; set; }
        public int BookId { get; set; }
        public int MemberId { get; set; }
        public int LibrarianRentedId { get; set; }
        public int? LibrarianReturnedId { get; set; }

        public virtual Book Book { get; set; }
        public virtual Member Member { get; set; }
        public virtual User LibrarianRented { get; set; }
        public virtual User LibrarianReturned { get; set; }
        public virtual Recompense? Recompense { get; set; }

    }

    public enum IssuanceStatus
    {
        Rented = 1,
        Returned = 2
    }
}
