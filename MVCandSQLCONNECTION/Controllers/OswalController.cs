using MVCandSQLCONNECTION.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace MVCandSQLCONNECTION.Controllers
{
    public class OswalController : Controller
    {
        // GET: Oswal
        public ActionResult Index()
        {
            var O = new OswalDetails();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            DataSet dataSet = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * From Class";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand,sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);

                    O.OSlist = new List<SelectListItem>();
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        var Cls = new SelectListItem();
                        Cls.Text = Convert.ToString(dr["ClassName"]);
                        Cls.Value = Convert.ToString(dr["ClassId"]);
                        O.OSlist.Add(Cls);
                    }
                }

                string SelectCommand1 = "Select * from Students";
                using (SqlCommand sqlCommand1 = new SqlCommand(SelectCommand1,sqlConnection))
                {
                    sqlCommand1.CommandType = CommandType.Text;
                    sqlDataAdapter.SelectCommand = sqlCommand1;
                    sqlDataAdapter.Fill(dataSet);

                    O.Stdlist = new List<SelectListItem>();
                    foreach (DataRow dr in dataSet.Tables[0].Rows)
                    {
                        var S = new SelectListItem();
                        S.Text = Convert.ToString(dr["StudentName"]);
                        S.Value = Convert.ToString(dr["StudentsId"]);
                        O.Stdlist.Add(S);
                    }
                }
            }
            return View(O);
        }

        public ActionResult AddForm(OswalDetails os)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
           // SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string InsertCommand = "Insert into Oswal ";
                InsertCommand += "Values ('" + os.ClassId + "', '" + os.StudentsId + "')";
                using (SqlCommand sqlCommand = new SqlCommand(InsertCommand,sqlConnection))
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
            var ows = new OswalDetails();
            OswalList Ol = new OswalList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter SqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select o.OswalId,s.StudentName,c.ClassName From Oswal as o join Class as c on o.ClassId = c.ClassId join Students as s on s.studentsId = o.studentsId";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    SqlDataAdapter.SelectCommand = sqlCommand;
                    SqlDataAdapter.Fill(ds);
                    Ol.Otable = ds.Tables[0];

                }
            }
            return View(Ol);
        }

        public ActionResult Delete(string Id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string DeleteCommand = "Delete from Oswal where OswalId= " + Id;  
                using (SqlCommand sqlCommand = new SqlCommand(DeleteCommand, sqlConnection))
                {
                    sqlCommand.CommandType= CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Delete"] = "Record Deleted Sucessfully";
                }
            }
            return RedirectToAction("Listing");
        }

        public ActionResult Edit(string Id)
        {
            var osl = new OswalDetails();
            OswalList oswalList = new OswalList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            DataSet dataSet = new DataSet();
            DataSet data = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {

                string SelectCommand = "Select * From Class";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);

                    osl.OSlist = new List<SelectListItem>();
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        var Cls = new SelectListItem();
                        Cls.Text = Convert.ToString(dr["ClassName"]);
                        Cls.Value = Convert.ToString(dr["ClassId"]);
                        osl.OSlist.Add(Cls);
                    }
                }

                string SelectCommand1 = "Select * from Students";
                using (SqlCommand sqlCommand1 = new SqlCommand(SelectCommand1, sqlConnection))
                {
                    sqlCommand1.CommandType = CommandType.Text;
                    sqlDataAdapter.SelectCommand = sqlCommand1;
                    sqlDataAdapter.Fill(dataSet);

                    osl.Stdlist = new List<SelectListItem>();
                    foreach (DataRow dr in dataSet.Tables[0].Rows)
                    {
                        var S = new SelectListItem();
                        S.Text = Convert.ToString(dr["StudentName"]);
                        S.Value = Convert.ToString(dr["StudentsId"]);
                        osl.Stdlist.Add(S);
                    }
                }

                string SelectCommand2 = "Select * from Oswal where OswalId = " + Id;
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand2, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(data);
                    oswalList.Otable = data.Tables[0];

                    DataRow dr2 = oswalList.Otable.Rows[0];
                   // osl = new OswalDetails();
                    osl.OswalId = Convert.ToInt32(dr2["OswalId"]);
                    osl.ClassId = Convert.ToString(dr2["ClassId"]);
                    osl.StudentsId = Convert.ToString(dr2["StudentsId"]);
                }
            } 
            return View(osl);
        }
        [HttpPost]

        public ActionResult Edit(OswalDetails od)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            //SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string EditCommand = "Update Oswal Set ClassId='" + od.ClassId + "', StudentsId='" + od.StudentsId + "' where OswalId='" + od.OswalId + "'";
                using (SqlCommand sqlCommand = new SqlCommand(EditCommand, sqlConnection))
                {
                    sqlCommand .CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Edit"] = "Record Edited Sucessfully";
                }
            }
            return RedirectToAction("Listing");
        }       
    }
}