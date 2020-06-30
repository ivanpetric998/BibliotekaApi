using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Issuance;
using Application.DataTransfer;
using Application.Queries.Issuance;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class IssuanceController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public IssuanceController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Issuance
        [HttpGet]
        public IActionResult Get([FromQuery] IssuanceSearch search, [FromServices] IGetIssuances query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Issuance/5
        [HttpGet("{id}", Name = "GetIssuance")]
        public IActionResult Get(int id, [FromServices] IGetOneIssuance query)
        {
            return Ok(_executor.ExecuteQuery(query,id));
        }

        // POST: api/Issuance
        [HttpPost]
        public IActionResult Post([FromBody] RentBookDto dto, [FromServices] IRentBook command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        [HttpPatch]
        public IActionResult Patch([FromBody] ReturnBookDto dto, [FromServices] IReturnBook command)
        {
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

    }
}
