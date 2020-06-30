using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Queries.Recompense;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class RecompenseController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public RecompenseController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Recompense
        [HttpGet]
        public IActionResult Get([FromQuery] RecompenseSearch search, [FromServices] IGetRecompenses query)
        {
            return Ok(_executor.ExecuteQuery(query,search));
        }

    }
}
