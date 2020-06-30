using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.NumberAllowdDays;
using Application.DataTransfer;
using Application.Queries.NumberAllowdDays;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class NumberAllowdDaysController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public NumberAllowdDaysController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/NumberAllowdDays
        [HttpGet]
        public IActionResult Get([FromQuery] NumberAllowdDaysSearch search , [FromServices] IGetNumberAllowdDays query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // POST: api/NumberAllowdDays
        [HttpPost]
        public IActionResult Post([FromBody] NumberAllowdDaysDto dto, [FromServices] ICreateNumberAllowedDays command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

    }
}
