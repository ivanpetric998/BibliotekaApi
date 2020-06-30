using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class IssuanceDto : BaseDto
    {
        public DateTime RentedDate { get; set; }
        public DateTime? ReturnedDate { get; set; }
        public IssuanceStatus Status { get; set; }
        public bool? ExistRecompense { get; set; }
        public int BookId { get; set; }
        public int MemberId { get; set; }
        public int LibrarianRentedId { get; set; }
        public int? LibrarianReturnedId { get; set; }

        public BookDto Book { get; set; }
        public MemberDto Member { get; set; }
        public UserDto LibrarianRented { get; set; }
        public UserDto LibrarianReturned { get; set; }
    }

    public class RentBookDto
    {
        public int BookId { get; set; }
        public int MemberId { get; set; }
    }

    public class ReturnBookDto
    {
        public int IssuanceId { get; set; }
        public bool ExistDamage { get; set; }
    }
}
