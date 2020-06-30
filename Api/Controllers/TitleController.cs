using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Core;
using Application;
using Application.Commands.Title;
using Application.DataTransfer;
using Application.Queries.Title;
using Application.Searches;
using FluentValidation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class TitleController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public TitleController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Title
        [HttpGet]
        public IActionResult Get([FromQuery] TitleSearch search, [FromServices] IGetTitles query)
        {
            return Ok(_executor.ExecuteQuery(query,search));
        }

        // GET: api/Title/5
        [HttpGet("{id}", Name = "GetTitle")]
        public IActionResult Get(int id, [FromServices] IGetOneTitle query)
        {
            return Ok(_executor.ExecuteQuery(query,id));
        }

        // POST: api/Title
        [HttpPost]
        public IActionResult Post([FromForm] CreateModifyTitle dto, [FromServices] ICreateTitle command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Title/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromForm] CreateModifyTitle dto, [FromServices] IUpdateTitle command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteTitle command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }

}
