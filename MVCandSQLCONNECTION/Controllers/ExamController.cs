using MVCandSQLCONNECTION.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;


namespace MVCandSQLCONNECTION.Controllers
{
    public class ExamController : Controller
    {
        // GET: Exam
        public ActionResult Index()
        {
            var ex = new ExamDetails();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            DataSet Data = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * From Subject";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);

                    ex.Sublist = new List<SelectListItem>();
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        var item = new SelectListItem();
                        item.Text = Convert.ToString(dr["SubjectName"]);
                        item.Value = Convert.ToString(dr["SubjectId"]);
                        ex.Sublist.Add(item);
                    }
                }

                string SelectCommand1 = "Select s.StudentName,c.ClassName,o.OswalId From Oswal as o join Class as c on o.ClassId = c.ClassId join Students as s on s.studentsId = o.studentsId";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand1, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(Data);

                    ex.oswlist = new List<SelectListItem>();
                    foreach (DataRow dr in Data.Tables[0].Rows)
                    {
                        var visa = new SelectListItem();
                        visa.Text = Convert.ToString(dr["StudentName"]) + " " + Convert.ToString(dr["ClassName"]);
                        visa.Value = Convert.ToString(dr["OswalId"]);
                        ex.oswlist.Add(visa);
                    }
                }
            }
            return View(ex);
        }

        [HttpPost]
        public ActionResult AddForm(ExamDetails e)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            //SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string InsertCommand = "Insert into Exam ";
                InsertCommand += "Values ('" + e.SubjectId + "', '" + e.OswalId + "', " + e.Marks + ", " + e.OutOf + ")";
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
            var examdetails = new ExamDetails();
            ExamList examlist = new ExamList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select c.ClassName,s.StudentName,sub.SubjectName,e.Marks,e.OutOf From Exam as e join [Subject] as sub on sub.SubjectId = e.SubjectId join Oswal as o on o.OswalId = e.OswalId join Class as c on o.ClassId = c.ClassId join Students as s on s.studentsId = o.studentsId";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);
                    examlist.Etable = ds.Tables[0];


                }
            }
            return View(examlist);
        }

        public ActionResult Delete(string id)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string DeleteCommand = "Delete from Exam where ExamId = " + id;
                using (SqlCommand sqlCommand = new SqlCommand(DeleteCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Delete"] = "Record Deleted Successfully";
                }
            }
            return RedirectToAction("Listing");
        }

        public ActionResult Edit(string id)
        {
            var El = new ExamDetails();
            ExamList exam = new ExamList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            DataSet data = new DataSet();
            DataSet dataset = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select * from Subject";
                using (SqlCommand sqlCommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlCommand;
                    sqlDataAdapter.Fill(ds);

                    El.Sublist = new List<SelectListItem>();
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        var sub = new SelectListItem();
                        sub.Text = Convert.ToString(dr["SubjectName"]);
                        sub.Value = Convert.ToString(dr["SubjectId"]);
                        El.Sublist.Add(sub);
                    }
                }
                string SelectCommand1 = "select o.OswalId,c.ClassName,s.StudentName from Oswal as o join Class as c on o.ClassId = c.ClassId join Students as s on o.StudentsId = s.StudentsId";
                using (SqlCommand sqlCommand1 = new SqlCommand(SelectCommand1, sqlConnection))
                {
                    sqlCommand1.CommandType = CommandType.Text;
                    sqlDataAdapter.SelectCommand = sqlCommand1;
                    sqlDataAdapter.Fill(data);

                    El.oswlist = new List<SelectListItem>();
                    foreach (DataRow dr1 in data.Tables[0].Rows)
                    {
                        var oswal = new SelectListItem();
                        oswal.Text = Convert.ToString(dr1["ClassName"]) + " " + Convert.ToString(dr1["StudentName"]);
                        oswal.Value = Convert.ToString(dr1["OswalId"]);
                        El.oswlist.Add(oswal);
                    }
                }
                string SelectCommand2 = "Select * from Exam where ExamId=" + id;
                using (SqlCommand sqlCommand2 = new SqlCommand(SelectCommand2, sqlConnection))
                {
                    sqlCommand2.CommandType = CommandType.Text;
                    sqlDataAdapter.SelectCommand = sqlCommand2;
                    sqlDataAdapter.Fill(dataset);
                    exam.Etable = dataset.Tables[0];

                    exam.Elist = new List<ExamDetails>();
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        El.ExamId = Convert.ToInt32(row["ExamId"]);
                        El.SubjectId = Convert.ToString(row["SubjectId"]);
                        El.OswalId = Convert.ToString(row["OswalId"]);
                        El.Marks = Convert.ToInt32(row["Marks"]);
                        El.OutOf = Convert.ToInt32(row["OutOf"]);
                        exam.Elist.Add(El);
                    }
                }
            }
            return View(El);
        }

        [HttpPost]
        public ActionResult Edit(ExamDetails ex)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            //SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string EditCommand = "Update Exam set SubjectId='" + ex.SubjectId + "', OswalId='" + ex.OswalId + "', Marks='" + ex.Marks + "', OutOf='" + ex.OutOf + "' where ExamId='" + ex.ExamId + "'";
                using (SqlCommand sqlCommand = new SqlCommand(EditCommand, sqlConnection))
                {
                    sqlCommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();

                    TempData["Edit"] = "Record Edited SucessFully";
                }
            }
            return RedirectToAction("Listing");
        }

        public ActionResult TotalMarks()
        {
            ExamList examlist = new ExamList();
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            using (SqlConnection sqlConnection = new SqlConnection(ConnectionString))
            {
                string SelectCommand = "Select c.ClassName,s.StudentName, sum(Marks) as totalmarks, sum(OutOf) as Total,Convert(Decimal(4,2),((sum(Marks)*1.0)  / (sum(OutOf)*1.0)*100)) as per From Exam as e join Oswal as o on o.OswalId = e.OswalId join Class as c on o.ClassId = c.ClassId join Students as s on s.studentsId = o.studentsId group by c.ClassName, s.StudentName";
                using (SqlCommand sqlcommand = new SqlCommand(SelectCommand, sqlConnection))
                {
                    sqlcommand.CommandType = CommandType.Text;
                    sqlConnection.Open();
                    sqlDataAdapter.SelectCommand = sqlcommand;
                    sqlDataAdapter.Fill(ds);
                    examlist.Etable = ds.Tables[0];

                }
            }
            return View(examlist);
        }
    }
}