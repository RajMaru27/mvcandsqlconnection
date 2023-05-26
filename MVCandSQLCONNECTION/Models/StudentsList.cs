using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MVCandSQLCONNECTION.Models
{
    public class StudentsList
    {
        public DataTable Stable { get; set; }
        public List<StudentsDetail> Slist { get; set; }
    }
}