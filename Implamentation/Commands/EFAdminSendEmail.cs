using Application.Commands;
using Application.Email;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Commands
{
    public class EFAdminSendEmail : IAdminSendEmail
    {
        private readonly IEmailSender _sender;

        public EFAdminSendEmail(IEmailSender sender)
        {
            _sender = sender;
        }

        public int Id => (int)UseCasesEnum.EFAdminSendEmail;

        public string Name => UseCasesEnum.EFAdminSendEmail.ToString();

        public void Execute(SendEmailDto request)
        {
            _sender.Send(request);
        }
    }
}
