using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Author;
using Application.DataTransfer;
using Application.Queries.Author;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AuthorController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public AuthorController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Author
        [HttpGet]
        public IActionResult Get([FromServices] IGetAuthors query, [FromQuery] AuthorSearch search)
        {
            return Ok(_executor.ExecuteQuery(query,search));
        }

        // GET: api/Author/5
        [HttpGet("{id}", Name = "GetAuthor")]
        public IActionResult Get(int id, [FromServices] IGetOneAuthor query)
        {
            return Ok(_executor.ExecuteQuery(query,id));
        }

        // POST: api/Author
        [HttpPost]
        public IActionResult Post([FromBody] AuthorDto dto, [FromServices] ICreateAuthor command)
        {
            _executor.ExecuteCommand(command,dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Author/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] AuthorDto dto, [FromServices] IUpdateAuthor command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command,dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteAuthor command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
