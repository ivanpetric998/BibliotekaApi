using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Publisher;
using Application.DataTransfer;
using Application.Queries.Publisher;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PublisherController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public PublisherController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Publisher
        [HttpGet]
        public IActionResult Get([FromServices] IGetPublishers query, [FromQuery] PublisherSearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Publisher/5
        [HttpGet("{id}", Name = "GetPublisher")]
        public IActionResult Get(int id, [FromServices] IGetOnePublisher query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Publisher
        [HttpPost]
        public IActionResult Post([FromBody] PublisherDto dto, [FromServices] ICreatePublisher command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Publisher/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] PublisherDto dto, [FromServices] IUpdatePublisher command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePublisher command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
