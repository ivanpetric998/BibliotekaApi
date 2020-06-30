using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Queries.Logger;
using Application.Searches;
using EFDataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class LoggerController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public LoggerController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Logger
        [HttpGet]
        public IActionResult Get([FromQuery] LoggerSearch search, [FromServices] IGetLogs query)
        {
            var context = new ProjectContext();

            return Ok(_executor.ExecuteQuery(query,search));
        }

    }
}
