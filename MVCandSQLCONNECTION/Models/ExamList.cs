using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MVCandSQLCONNECTION.Models
{
    public class ExamList
    {
        public DataTable Etable { get; set; }
        public List<ExamDetails> Elist { get; set; }
    }
}