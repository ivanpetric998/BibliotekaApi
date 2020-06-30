using Application;
using Domain;
using EFDataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Logging
{
    public class EFDatabaseLogger : IUseCaseLogger
    {
        private readonly ProjectContext _context;

        public EFDatabaseLogger(ProjectContext context)
        {
            _context = context;
        }

        public void Log(IUseCase userCase, IApplicationActor actor, object data)
        {
            _context.UseCaseLogs.Add(new UseCaseLog
            {
                Date = DateTime.Now,
                ActorId = actor.Id,
                Data = JsonConvert.SerializeObject(data),
                UseCaseName = userCase.Name.ToString()
            });

            _context.SaveChanges();
        }
    }
}
