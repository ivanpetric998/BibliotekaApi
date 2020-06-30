using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.Email;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class EmailController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public EmailController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // POST: api/Email
        [HttpPost]
        public IActionResult Post([FromBody] SendEmailDto dto, [FromServices] IAdminSendEmail command)
        {
            _executor.ExecuteCommand(command,dto);
            return Ok();
        }
    }
}
