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
    public class NewUserController : Controller
    {
        // GET: NewUser
        public ActionResult Index()
        {
            var user = new UserDetails();
            return View(user);
        }
        [HttpPost]

        public ActionResult AddForm(UserDetails ud)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            //SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string InsertCommand = "insert into NewUser ";
                InsertCommand += "Values ('" + ud.Name + "', '" + ud.Phone + "', '" + ud.Email + "', '" + ud.Password + "', '" + ud.ConfirmPassword + "')";
                using (SqlCommand sqlCommand = new SqlCommand(InsertCommand,sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Add"] = "Record Added SuccessFully";
                }
            }
            return RedirectToAction("Listing");
        }

        public ActionResult Listing()
        {
            //var U = new UserDetails();
            UserList userlist = new UserList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * from NewUser";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand,sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    userlist.Utable = ds.Tables[0];
                }
            }
            return View(userlist);
        }

        public ActionResult Delete(string id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            using(SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string DeleteCommand = "Delete From NewUser where UserId= " + id;
                using (SqlCommand sqlCommand = new SqlCommand(DeleteCommand,sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Delete"] = "record Deleted Successfully";
                }
            }
            return RedirectToAction("Listing");
        }

        public ActionResult Edit(string id)
        {
            var n = new UserDetails();
            UserList user = new UserList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * from NewUser where UserId=" + id;
                using ( SqlCommand sqlCommand = new SqlCommand(SelectCommand,sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    user.Utable = ds.Tables[0];

                    DataRow dr = user.Utable.Rows[0];
                    n.UserId = Convert.ToInt32(dr["UserId"]);
                    n.Name = Convert.ToString(dr["Name"]);
                    n.Phone = Convert.ToString(dr["Phone"]);
                    n.Email = Convert.ToString(dr["Email"]);
                    n.Password = Convert.ToString(dr["Password"]);
                    n.ConfirmPassword = Convert.ToString(dr["ConfirmPassword"]);
                }
            }
            return View(n);
        }

        public ActionResult Edit(UserDetails ud)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            //SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string EditCommand = "Update NewUser set Name='" + ud.Name + "', Phone= '" + ud.Phone + "', Email= '" + ud.Email + "', Password= '" + ud.Password + "', ConfirmPassword='" + ud.ConfirmPassword + "' where UserId= '" + ud.UserId + "'";
                using (SqlCommand sqlCommand = new SqlCommand(EditCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Edit"] = "Report Edited Successfully";
                }
            }
            return RedirectToAction("Listing");
        }
    }
}