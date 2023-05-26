using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MVCandSQLCONNECTION.Models
{
    public class SubjectList
    {
        public DataTable Stable { get; set; }
        public List<Subjectdetails> slist { get; set; }

    }
}