using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Application.DataTransfer
{
    public class TitleDto : BaseDto
    {
        public string Name { get; set; }
        public int PublisherId { get; set; }
        public int CategoryId { get; set; }
        public int IssueYear { get; set; }
        public string Image { get; set; }
        public decimal? PriceForDamage { get; set; }

        public virtual PublisherDto Publisher { get; set; }
        public virtual CategoryDto Category{ get; set; }
        public virtual ICollection<AuthorDto> Authors { get; set; } = new List<AuthorDto>();
    }

    public class CreateModifyTitle : BaseDto
    {
        public string Name { get; set; }
        public int PublisherId { get; set; }
        public int CategoryId { get; set; }
        public int IssueYear { get; set; }
        public IFormFile? Image { get; set; }
        public decimal PriceForDamage { get; set; }
        public ICollection<int> Authors { get; set; } = new List<int>();
    }
}
