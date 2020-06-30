using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Implamentation.Extensions
{
    public static class FileExtension
    {
        public static string UploadImage(this IFormFile image, string folder)
        {
            var guid = Guid.NewGuid();

            var extension = Path.GetExtension(image.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", folder, newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                image.CopyTo(fileStream);
            }

            return newFileName;
        }
    }
}
