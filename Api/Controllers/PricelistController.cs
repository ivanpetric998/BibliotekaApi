using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Pricelist;
using Application.DataTransfer;
using Application.Queries.Pricelist;
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
    public class PricelistController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        public PricelistController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Pricelist
        [HttpGet]
        public IActionResult Get([FromQuery] PricelistSearch search, [FromServices] IGetPricelists query)
        {
            return Ok(_executor.ExecuteQuery(query,search));
        }

        // POST: api/Pricelist
        [HttpPost]
        public IActionResult Post([FromBody] PricelistDto dto, [FromServices] ICreatePrice command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

    }

}
