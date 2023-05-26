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
    public class ClassController : Controller
    {
        // GET: Class
        public ActionResult Index()
        {
            var C = new ClassDetails();
            return View(C);
        }
        [HttpPost]

        public ActionResult AddForm(ClassDetails cd)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            //SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string InsertCommand = "Insert into Class ";
                InsertCommand += "Values ('" + cd.ClassName + "')";
                using (SqlCommand sqlCommand = new SqlCommand(InsertCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["ADD"] = "Record Added Successfully";
                }
            }
            return RedirectToAction("Listing");
        }

        public ActionResult Listing()
        {
            var L = new ClassDetails();
            ClassList classList = new ClassList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * from Class";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlCommand.CommandType= CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    classList.Ctable = ds.Tables[0];

                }
            }
            return View(classList);
        }

        public ActionResult Delete(string id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            using ( SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string DeleteCommand = "Delete From Class where ClassId= " + id;
                using (SqlCommand sqlCommand = new SqlCommand(DeleteCommand, sqlConnection))
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
            var cs = new ClassDetails();
            ClassList classList = new ClassList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "select * from Class where ClassId= " + id;
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlCommand.CommandType= CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    classList.Ctable = ds.Tables[0];

                    DataRow dr = classList.Ctable.Rows[0];
                    //cs = new ClassDetails();
                    cs.ClassId = Convert.ToInt32(dr["ClassId"]);
                    cs.ClassName = Convert.ToString(dr["ClassName"]);

                }
            }
            return View(cs);
        }
        [HttpPost]
        public ActionResult Edit(ClassDetails cs)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            //SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string EditCommand = "Update Class set ClassName='" + cs.ClassName + "' where ClassId= '" + cs.ClassId + "'";
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

        public ActionResult loginform()
        {
            var l = new LoginDetails();
            return View(l);
        }
        [HttpPost]

        public ActionResult SubmitForm(LoginDetails ld)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * from NewUser where Email='" + ld.Email + "' and  Password= '" + ld.Password + "'";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    var sub = ds.Tables[0].Rows.Count;

                    if (sub > 0)
                    {
                        return RedirectToAction("Listing");
                    }
                }
            }
            return RedirectToAction("loginform");
        }
    }
}