using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Title : BaseEntity
    {
        public string Name { get; set; }
        public int PublisherId { get; set; }
        public int CategoryId { get; set; }
        public int IssueYear { get; set; }
        public string Image { get; set; }

        public virtual Publisher Publisher { get; set; }
        public virtual Category Category { get; set; }
        public virtual ICollection<TitleAuthor> TitleAuthors { get; set; } = new HashSet<TitleAuthor>();
        public virtual ICollection<Book> Books { get; set; } = new HashSet<Book>();
        public virtual ICollection<TitlePrice> Prices { get; set; } = new HashSet<TitlePrice>();
        
    }
}
