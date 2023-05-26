using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using MVCandSQLCONNECTION.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace MVCandSQLCONNECTION.Controllers
{
    public class SubjectController : Controller
    {
        // GET: Subject
        public ActionResult Index()
        {
            var sub = new Subjectdetails();
            return View(sub);
        }
        [HttpPost]

        public ActionResult Addform(Subjectdetails sd)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string InsertCommand = "Insert into [Subject] ";
                InsertCommand += "Values ('" + sd.SubjectName + "')";
                using (SqlCommand sqlCommand = new SqlCommand(InsertCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Added"] = "Record Added Successfully"; 
                }
            }
            return RedirectToAction("Listing");
        }

        public ActionResult Listing()
        {
            SubjectList sublist = new SubjectList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet(); 
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * from Subject";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlCommand.CommandType= CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    sublist.Stable = ds.Tables[0];

                    sublist.slist = new List<Subjectdetails>();

                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        Subjectdetails sub = new Subjectdetails();
                        sub.SubjectId = Convert.ToInt32(dr["SubjectId"]);
                        sub.SubjectName = Convert.ToString(dr["SubjectName"]);
                        sublist.slist.Add(sub);
                    }
                }
            }
            return View(sublist);
        }

        public ActionResult Delete(string id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string DeleteCommand = "Delete From Subject where SubjectId=" + id;
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
            var su = new Subjectdetails();
            SubjectList subjectlist = new SubjectList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * from Subject where SubjectId=" + id;
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand,sqlConnection))
                {
                    sqlCommand.CommandType= CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    subjectlist.Stable = ds.Tables[0];
                     
                    DataRow dr = subjectlist.Stable.Rows[0];
                    su = new Subjectdetails();
                    su.SubjectId = Convert.ToInt32(dr["SubjectId"]);
                    su.SubjectName = Convert.ToString(dr["SubjectName"]);
                }
            }
            return View(su);
        }
        [HttpPost]

        public ActionResult Edit(Subjectdetails s)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string EditCommand = "Update Subject Set SubjectName='" + s.SubjectName + "' where SubjectId='" + s.SubjectId + "'";
                using (SqlCommand sqlCommand = new SqlCommand(EditCommand,sqlConnection))
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