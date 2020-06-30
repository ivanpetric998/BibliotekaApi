using Application;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation
{
    public class NoNameActor : IApplicationActor
    {
        public int Id => 0;

        public string Identity => "No name Actor";

        public IEnumerable<int> AllowedUseCases => new List<int>() {};
    }
}
