using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Mvc;

namespace MVCandSQLCONNECTION.Models
{
    public class ExamDetails
    {
        public int ExamId { get; set; }
        public string SubjectId { get; set; }
        public string OswalId { get; set; }
        public int Marks { get; set; }
        public int OutOf { get; set; }   
        public List<SelectListItem> Sublist { get; set; }
        public List<SelectListItem> oswlist { get; set; }
    }
}