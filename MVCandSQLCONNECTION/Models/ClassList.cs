using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MVCandSQLCONNECTION.Models
{
    public class ClassList
    {
        public DataTable Ctable { get; set; }
        public List<ClassDetails> Clist { get; set; }
    }
}