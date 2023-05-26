using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MVCandSQLCONNECTION.Models
{
    public class OswalList
    {
        public DataTable Otable { get; set; }
        public List<OswalDetails> Olist { get; set; }
    }
}