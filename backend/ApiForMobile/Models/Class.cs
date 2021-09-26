using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;


namespace ApiForMobile.Models
{
    public class RegisterModel
    {
        public string firstname { get; set; }
        public string lastname { get; set; }
       
        public string email { get; set; }
       
        public string password { get; set; }
    }
}
