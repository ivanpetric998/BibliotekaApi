using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Member;
using Application.DataTransfer;
using Application.Queries.Member;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class MemberController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public MemberController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Member
        [HttpGet]
        public IActionResult Get([FromServices] IGetMembers query, [FromQuery] MemberSearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Member/5
        [HttpGet("{id}", Name = "GetMember")]
        public IActionResult Get(int id, [FromServices] IGetOneMember query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Member
        [HttpPost]
        public IActionResult Post([FromBody] MemberDto dto, [FromServices] ICreateMember command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Member/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] MemberDto dto, [FromServices] IUpdateMember command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteMember command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
