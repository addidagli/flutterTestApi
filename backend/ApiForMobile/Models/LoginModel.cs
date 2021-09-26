using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ApiForMobile.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Please enter the email")]
        public string email { get; set; }
        public string password { get; set; }
    }
}
