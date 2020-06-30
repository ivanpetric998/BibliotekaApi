using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class User : BaseEntity
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public int RoleId { get; set; }

        public virtual Role Role { get; set; }
        public virtual ICollection<UserUseCase> UserUseCases { get; set; } = new HashSet<UserUseCase>();
        public virtual ICollection<Issuance> IssueBooks { get; set; } = new HashSet<Issuance>();
        public virtual ICollection<Issuance> ReturnedBooks { get; set; } = new HashSet<Issuance>();

    }
}
