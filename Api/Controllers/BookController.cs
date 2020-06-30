using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Book;
using Application.DataTransfer;
using Application.Queries.Book;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public BookController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Book
        [HttpGet]
        public IActionResult Get([FromServices] IGetBooks query, [FromQuery] BookSearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Book/5
        [HttpGet("{id}", Name = "GetBook")]
        public IActionResult Get(int id, [FromServices] IGetOneBook query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Book
        [HttpPost]
        public IActionResult Post([FromBody] CreateModifyBookDto dto, [FromServices] ICreateBook command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Book/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CreateModifyBookDto dto, [FromServices] IUpdateBook command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteBook command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
