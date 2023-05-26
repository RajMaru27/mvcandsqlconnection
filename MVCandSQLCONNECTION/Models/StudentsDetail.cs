using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MVCandSQLCONNECTION.Models
{
    public class StudentsDetail
    {
        public int StudentsId { get; set; }
        public string StudentName { get; set; }
        public string Email { get; set; }
        public string Birthdate { get; set; }
    }
}