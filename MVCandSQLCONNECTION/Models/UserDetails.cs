using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MVCandSQLCONNECTION.Models
{
    public class UserDetails
    {
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
    }
}