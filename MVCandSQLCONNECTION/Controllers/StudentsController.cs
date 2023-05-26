using MVCandSQLCONNECTION.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;

namespace MVCandSQLCONNECTION.Controllers
{
    public class StudentsController : Controller
    {
        // GET: Students
        public ActionResult Index()
        {
            var S = new StudentsDetail();
            return View(S);
        }
        [HttpPost]

        public ActionResult AddForm(StudentsDetail sd)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string InsertCommand = "Insert into Students ";
                InsertCommand += "Values ('" + sd.StudentName + "', '" + sd.Email + "', '" + sd.Birthdate + "')";
                using (SqlCommand sqlCommand = new SqlCommand(InsertCommand,sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();
                    TempData["Add"] = "Record Added Successfully";
                }
            }
            return RedirectToAction("Listing");
        }

        public ActionResult Listing()
        {
            var S = new StudentsDetail();
            StudentsList studentslist = new StudentsList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * from Students";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand,sqlConnection))
                {
                    sqlCommand.CommandType= CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    studentslist.Stable = ds.Tables[0];

                    studentslist.Slist = new List<StudentsDetail>();
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        StudentsDetail Sdetails = new StudentsDetail();
                        Sdetails.StudentsId = Convert.ToInt32(dr["StudentsId"]);
                        Sdetails.StudentName = Convert.ToString(dr["StudentName"]);
                        Sdetails.Email = Convert.ToString(dr["Email"]);
                        Sdetails.Birthdate = Convert.ToString(dr["Birthdate"]);
                        studentslist.Slist.Add(Sdetails);
                    }
                }
            }
            return View(studentslist);
        }

        public ActionResult Delete(string id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string DeleteCommand = "Delete from Students where StudentsId= " + id;
                using (SqlCommand sqlCommand = new SqlCommand(DeleteCommand,sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Delete"] = "Record Deleted Sucessfully";
                }
            }
            return RedirectToAction("Listing");
        }

        public ActionResult Edit(string id)
        {
            var std = new StudentsDetail();
            StudentsList studentslist = new StudentsList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * from Students where StudentsId= " + id;
                using (SqlCommand sqlCommand = new SqlCommand (SelectCommand,sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    studentslist.Stable = ds.Tables[0];

                    DataRow dr = studentslist.Stable.Rows[0];
                    std = new StudentsDetail();
                    std.StudentsId = Convert.ToInt32(dr["StudentsId"]);
                    std.StudentName = Convert.ToString(dr["StudentName"]);
                    std.Email = Convert.ToString(dr["Email"]);
                    std.Birthdate = Convert.ToString(dr["Birthdate"]);
                }
            }
            return View(std);
        }
        [HttpPost]

        public ActionResult Edit(StudentsDetail sd)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using ( SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string EditCommand = "Update Students set StudentName='" + sd.StudentName + "', Email='" + sd.Email + "', Birthdate='" + sd.Birthdate + "' where StudentsId ='" + sd.StudentsId + "'";
                using (SqlCommand sqlCommand = new SqlCommand(EditCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Edit"] = "Record Edited Sucessfully";
                }
            }
            return RedirectToAction("Listing");
        }
    }
}