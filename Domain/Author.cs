using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Author : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public virtual ICollection<TitleAuthor> TitleAuthors { get; set; } = new HashSet<TitleAuthor>();
    }
}
