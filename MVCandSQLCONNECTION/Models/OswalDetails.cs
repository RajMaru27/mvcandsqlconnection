using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Mvc;

namespace MVCandSQLCONNECTION.Models
{
    public class OswalDetails
    {
        public int OswalId { get; set; }
        public string ClassId { get; set; }
        public string StudentsId { get; set; }
        public List<SelectListItem> OSlist { get; set; }
        public List<SelectListItem> Stdlist { get; set; }
    }
}