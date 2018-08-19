using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OnlineExamination
{

    public class DBOperations
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        SqlDataReader dr;
        DBConnection dbcon;
        LoginProperties lp;
        public DBOperations()
        {
            dbcon = new DBConnection();
            con = new SqlConnection(dbcon.ConnState);
        }
        int count;



        //Insert/Update/Delete Exam of Details
        public DataSet selectExamDT()
        {
            // string str="select ROW_NUMBER() OVER(ORDER BY date desc)RowNum,examid,convert(varchar(10),date,101)date,start_time,end_time,subjects from tblExa"+
            //+"mDateTime where date>=FORMAT(Getdate(),'yyyy-MM-dd') order by start_time"

            return LoadExamOnID(null);
        }
        private DataSet LoadExamOnID(int? examId)
        {
            cmd = new SqlCommand("Sp_GetExamDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@examId", examId);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds, "tblExamDateTime");
            return ds;
        }
        public DataSet SelectExamOnID(int id)
        {
            // da = new SqlDataAdapter("select convert(varchar(10),date,101)date,start_time,end_time,subjects from tblExamDateTime where examid=" + id, con);
            return LoadExamOnID(id);
        }
        public int InsertOrUpdateExamTime(int? id, string date, string st, string et, int createdBy, int sbid, string qids, int marks, bool isExamId)
        {
            int result = 0;
            try
            {
                con.Open();
                cmd = new SqlCommand("SpWriteExamQuestions", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@examid", id);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@start_time", st);
                cmd.Parameters.AddWithValue("@end_time", et);
                cmd.Parameters.AddWithValue("@createdBy", createdBy);
                cmd.Parameters.AddWithValue("@sbid", sbid);
                cmd.Parameters.AddWithValue("@qids", qids);
                cmd.Parameters.AddWithValue("@marks", marks);
                cmd.Parameters.AddWithValue("@isExamId", isExamId);
                result = cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            //if (id != null)
            //{
            //    cmd = new SqlCommand("update tblExamDateTime set date=@date, start_time=@start_time, end_time=@end_time, subjects=@subjects where examid=" + id, con);
            //    cmd.Parameters.AddWithValue("@date", date);
            //    cmd.Parameters.AddWithValue("@start_time", st);
            //    cmd.Parameters.AddWithValue("@end_time", et);
            //    cmd.Parameters.AddWithValue("@subjects", subjects);
            //    count = cmd.ExecuteNonQuery();

            //}
            //else
            //{

            //    cmd = new SqlCommand("insert into tblExamDateTime(date,start_time,end_time,subjects) valueS(@date,@start_time,@end_time,@subjects)", con);
            //    cmd.Parameters.AddWithValue("@date", date);
            //    cmd.Parameters.AddWithValue("@start_time", st);
            //    cmd.Parameters.AddWithValue("@end_time", et);
            //    cmd.Parameters.AddWithValue("@subjects", subjects);
            //    count = cmd.ExecuteNonQuery();

            //}
            finally
            {
                con.Close();
            }

            return result;

        }
        public int CancelExam(int id)
        {
            int count = 0;
            cmd = new SqlCommand("delete from tblExamDateTime where examid=" + id, con);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;

        }
        public DataSet GetSubjectName(string SubjectID)
        {
            da = new SqlDataAdapter("select subject_name from tblSubject where sbid in (" + SubjectID + ")", con);
            ds = new DataSet();
            da.Fill(ds, "tblSubject");
            return ds; ;
        }


        //Insert/Update/Delete of Questions?
        public int InsertOrUpdateQuestions(int? id, int sbid, string question, string opt1, string opt2, string opt3, string opt4, string ans)
        {

            int count = 0;
            con.Open();
            if (id == null)
            {
                cmd = new SqlCommand("insert into tblQuestionMaster(sbid,question,opt_1,opt_2,opt_3,opt_4,ans) values(@sbid,@question,@opt_1,@opt_2,@opt_3,@opt_4,@ans)", con);
                count = AddParaTo_InsertOrUpdateQuestion(sbid, question, opt1, opt2, opt3, opt4, ans, count);
            }
            else
            {
                cmd = new SqlCommand("update tblQuestionMaster set sbid=@sbid, question=@question, opt_1=@opt_1, opt_2=@opt_2, opt_3=@opt_3,opt_4=@opt_4, ans=@ans where q_id=" + id, con);
                count = AddParaTo_InsertOrUpdateQuestion(sbid, question, opt1, opt2, opt3, opt4, ans, count);

            }
            con.Close();
            return count;
        }
        private int AddParaTo_InsertOrUpdateQuestion(int sbid, string question, string opt1, string opt2, string opt3, string opt4, string ans, int count)
        {
            cmd.Parameters.AddWithValue("@sbid", sbid);
            cmd.Parameters.AddWithValue("@question", question);
            cmd.Parameters.AddWithValue("@opt_1", opt1);
            cmd.Parameters.AddWithValue("@opt_2", opt2);
            cmd.Parameters.AddWithValue("@opt_3", opt3);
            cmd.Parameters.AddWithValue("@opt_4", opt4);
            cmd.Parameters.AddWithValue("@ans", ans);
            count = cmd.ExecuteNonQuery();
            return count;
        }

        public DataSet RetriveAllQuetions()
        {
            try
            {
                da = new SqlDataAdapter("select * from(select q_id,question,opt_1,opt_2,opt_3,opt_4,ans,sbid,ROW_NUMBER() OVER(ORDER BY q_id ASC)AS Q_Number from tblQuestionMaster) tblQuestionMaster", con);
                return LoadQuestions();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public DataSet RetriveAllQuetions(int examId)
        {
            try
            {

                cmd = new SqlCommand("SpGetExamQuestions", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@examId", examId);
                da = new SqlDataAdapter(cmd);
                //da = new SqlDataAdapter("select * from(select q_id,question,opt_1,opt_2,opt_3,opt_4,ans,sbid,ROW_NUMBER() OVER(ORDER BY q_id ASC)AS Q_Number from tblQuestionMaster) tblQuestionMaster", con);
                return LoadQuestions();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public DataSet RetriveQuetions(int sbid)
        {
            da = new SqlDataAdapter("select * from(select q_id,question,opt_1,opt_2,opt_3,opt_4,ans,sbid,ROW_NUMBER() OVER(ORDER BY q_id ASC)AS Q_Number from tblQuestionMaster where sbid=" + sbid + ") tblQuestionMaster", con);
            return LoadQuestions();
        }
        public DataSet RetriveAllQuetions(int? q_id, int? rowID, string subjectsID)
        {
            if (q_id == null && rowID != null)
                da = new SqlDataAdapter("select * from (select r.*,ROW_NUMBER() OVER(order by sbid)AS Q_Number from(select r.*,row_number() over(partition by r.sbid order by r.q_id) row from tblQuestionMaster r)r where r.row<=20 and sbid in(" + subjectsID + "))r where Q_Number=" + rowID, con);
            //da = new SqlDataAdapter("select r.*,ROW_NUMBER() OVER(order by q_id)AS Q_Number from(select r.*,row_number() over(partition by r.sbid order by r.q_id) row from tblQuestionMaster r)r where r.row<=20 and r.sbid in(1,2,3) order by r.sbid", con);
            //da = new SqlDataAdapter("select * from(select q_id,question,opt_1,opt_2,opt_3,opt_4,ans,ROW_NUMBER() OVER(ORDER BY q_id ASC)AS Q_Number from tblQuestionMaster) tblQuestionMaster where  Q_Number=" + rowID, con);
            else if (q_id != null && rowID == null)
                da = new SqlDataAdapter("select q_id,question,opt_1,opt_2,opt_3,opt_4,ans,sbid from tblQuestionMaster where q_id=" + q_id, con);
            else if (q_id == null && rowID == null)
                da = new SqlDataAdapter("select r.*,ROW_NUMBER() OVER(order by sbid)AS Q_Number from(select r.*,row_number() over(partition by r.sbid order by r.q_id) row from tblQuestionMaster r)r where r.row<=20 and sbid in(" + subjectsID + ")", con);
            return LoadQuestions();
        }
        private DataSet LoadQuestions()
        {
            ds = new DataSet();
            da.Fill(ds, "tblQuestionMaster");
            return ds;
        }

        public int RemoveQuestion(int id)
        {
            int count = 0;
            cmd = new SqlCommand("delete from tblQuestionMaster where q_id=" + id, con);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;

        }

        //Retrive Result
        public DataSet ViewResult(string exam_date, int criteria)
        {
            da = new SqlDataAdapter("select row_number() over(order by solved_time,ans desc)as RowNum, r.examid,s.rollNo,s.name,e.date,r.ans,r.solved_time from tblResult r,tblExamDateTime e,tblStudents s where r.examid=e.examid and r.stud_id=s.stud_id and e.date='" + exam_date + "' and (convert(decimal(10,2),r.ans)/60*100)>=" + criteria, con);
            ds = new DataSet();
            da.Fill(ds, "tblResult");
            return ds;
        }
        public DataSet ResultExamDetails(int? id)
        {
            if (id == null)
                da = new SqlDataAdapter("select row_number() over(order by date)as RowNum,e.examid,convert(varchar(10),e.date,101)date,e.start_time,e.end_time from tblResult r join tblExamDateTime e on r.examid=e.examid group by date,start_time,end_time,e.examid order by date desc", con);
            else
                da = new SqlDataAdapter("select row_number() over(order by date)as RowNum,convert(varchar(10),e.date,101)date,e.start_time,e.end_time from tblResult r,tblExamDateTime e where r.examid=" + id, con);
            ds = new DataSet();
            da.Fill(ds, "tblResult");
            return ds;
        }
        public DataSet ExamDate(string date)
        {
            //da = new SqlDataAdapter("select examid,convert(varchar(10),date,101)date,start_time,end_time from tblExamDateTime where date>='"+date+"' and end_time>'"+ (DateTime.Now).ToShortTimeString()+"'", con);
            da = new SqlDataAdapter("select examid,convert(varchar(10),date,101)date,start_time,end_time from tblExamDateTime where date='" + date + "' and end_time>(SELECT CONVERT (time, SYSDATETIME())) order by start_time ", con);
            ds = new DataSet();
            da.Fill(ds, "tblExamDateTime");
            if (ds.Tables[0].Rows.Count > 0)
                return ds;
            else
            {
                da = new SqlDataAdapter("select examid,convert(varchar(10),date,101)date,start_time,end_time from tblExamDateTime where date >'" + date + "' order by date,start_time", con);
                da.Fill(ds, "tblExamDateTime");
                return ds;
            }
        }
        public bool ExamTime(string time, int examid)
        {
            bool status = false;
            da = new SqlDataAdapter("select * from tblExamDateTime where start_time<='" + time + "' and end_time >'" + time + "' and examid=" + examid, con);
            ds = new DataSet();
            da.Fill(ds, "tblExamDateTime");
            if (ds.Tables[0].Rows.Count > 0)
                status = true;
            return status;
        }



        //Add/Update/Delete/Select Controller
        public int InsertOrUpdateController(int? cid, string name, string cont_no, string email_id, string user_id, string pwd)
        {
            con.Open();
            int count = 0;
            if (cid == null)
            {
                cmd = new SqlCommand("insert into tblController(name,cont_no,email_id,user_id,pwd) values(@name,@cont_no,@email_id,@user_id,@pwd)", con);
                count = AddParaToInsertOrUpdateController(name, cont_no, email_id, user_id, pwd, count);
            }
            else
            {
                cmd = new SqlCommand("update tblController set name=@name, cont_no=@cont_no, email_id=@email_id, user_id=@user_id, pwd=@pwd where cid=" + cid, con);
                count = AddParaToInsertOrUpdateController(name, cont_no, email_id, user_id, pwd, count);
            }
            con.Close();
            return count;
        }
        private int AddParaToInsertOrUpdateController(string name, string cont_no, string email_id, string user_id, string pwd, int count)
        {
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@cont_no", cont_no);
            cmd.Parameters.AddWithValue("@email_id", email_id);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            cmd.Parameters.AddWithValue("@pwd", pwd);
            count = cmd.ExecuteNonQuery();
            return count;
        }
        public DataSet RetriveControllerDetails(int? id)
        {
            if (id != null)
            {
                da = new SqlDataAdapter("select cid,name,cont_no,email_id,user_id,pwd from tblController where cid=" + id, con);
            }
            else
            {
                da = new SqlDataAdapter("select cid,name,cont_no,email_id,user_id,pwd from tblController", con);
            }
            ds = new DataSet();
            da.Fill(ds, "tblController");
            return ds;
        }
        public DataSet RetriveControllerDetailsOnUserID(string userID)
        {
            da = new SqlDataAdapter("select cid,name,cont_no,email_id,user_id,pwd from tblController where user_id='" + userID + "'", con);
            ds = new DataSet();
            da.Fill(ds, "tblController");
            return ds;
        }
        public int DeleteController(int id)
        {
            int count = 0;
            cmd = new SqlCommand("delete from tblController where cid=" + id, con);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;

        }

        //Update Password
        public int UpdatePwd(int userID, string pwd)
        {
            int count = 0;
            cmd = new SqlCommand("Update tblController set pwd='" + pwd + "' where cid=" + userID, con);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;
        }

        //Get Student Details and Store Result
        public int AddNewStudentDetails(string userId, string pwd)
        {
            int count = 0, stud_id = 0;
            ds = new DataSet();

            da = new SqlDataAdapter("select stud_id from tblStudents where userId='" + userId + "' and password='" + pwd + "'", con);
            da.Fill(ds, "tblStudents");
            if (ds.Tables[0].Rows.Count > 0)
            {
                stud_id = Convert.ToInt32(ds.Tables[0].Rows[0]["stud_id"].ToString());
            }
            //else
            //{
            //    cmd = new SqlCommand("insert into tblStudents(name,email) values('" + name + "','" + email + "')", con);
            //    con.Open();
            //    count = cmd.ExecuteNonQuery();
            //    con.Close();
            //    if (count > 0)
            //    {
            //        ds = new DataSet();
            //        da = new SqlDataAdapter("select top(1) stud_id from tblStudents where name='" + name + "' order by stud_id desc;", con);
            //        da.Fill(ds, "tblStudents");
            //        stud_id = Convert.ToInt32(ds.Tables[0].Rows[0]["stud_id"].ToString());
            //    }
            //}
            return stud_id;
        }
        public int Storeresult(int examid, int stud_id, string solve_time, int ans)
        {
            count = 0;
            cmd = new SqlCommand("insert into tblResult(examid,stud_id,solved_time,ans) values(" + examid + "," + stud_id + ",'" + solve_time + "'," + ans + ")", con);
            con.Open();
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;
        }
        public DataSet StudentDetails(int stud_id)
        {
            da = new SqlDataAdapter("select name from tblStudents where stud_id=" + stud_id, con);
            ds = new DataSet();
            da.Fill(ds, "tblStudents");
            return ds;
        }

        //Login for Start exam
        public bool ExamDoneChacking(string userId, int examid)
        {
            bool examStatus = true;
            ds = new DataSet();
            da = new SqlDataAdapter("SELECT tblStudents.name FROM tblExamDateTime INNER JOIN tblResult ON tblExamDateTime.examid = tblResult.examid INNER JOIN tblStudents ON tblResult.stud_id = tblStudents.stud_id WHERE (tblStudents.userId = '" + userId + "') AND (tblExamDateTime.examid = " + examid + ")", con);
            da.Fill(ds, "tblExamDateTime");
            if (ds.Tables[0].Rows.Count > 0)
                examStatus = false;
            return examStatus;


        }

        //Login Dtails
        public List<LoginProperties> Login(string userID, string password)
        {
            bool login = false;
            int cid = 0;
            cmd = new SqlCommand("select cid from tblController where user_id='" + userID + "' and pwd='" + password + "'", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                login = true;
                cid = Convert.ToInt32(dr.GetValue(0).ToString());
            }
            LoginProperties l1 = new LoginProperties();
            l1.cid = cid;
            l1.LoginState = login;
            List<LoginProperties> loginInfo = new List<LoginProperties> { l1 };
            return loginInfo;

        }

        //Add New Subject and Retrive 
        public int NewSubject(string Subject_Name, int classId)
        {
            int count = 0;
            da = new SqlDataAdapter("select * from tblSubject where subject_name='" + Subject_Name + "' and classId=" + classId, con);
            ds = new DataSet();
            da.Fill(ds, "tblSubject");
            if (ds.Tables[0].Rows.Count == 0)
            {
                cmd = new SqlCommand("insert into tblSubject(subject_name,classId) values('" + Subject_Name + "'," + classId + ")", con);
                con.Open();
                count = cmd.ExecuteNonQuery();
                con.Close();
                if (count > 0)
                    count = 1;
            }
            return count;
        }
        public DataSet AllSubject(int classId)
        {
            ds = new DataSet();
            da = new SqlDataAdapter("select sbid,subject_name from tblSubject where classId=" + classId, con);
            da.Fill(ds, "tblSubject");
            return ds;
        }
        public List<ClassDto> getClassList()
        {
            List<ClassDto> lstClass = new List<ClassDto>();
            da = new SqlDataAdapter("select * from tbl_Class_Master order by classId", con);
            ds = new DataSet();
            da.Fill(ds, "tbl_Class_Master");
            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    ClassDto classdto = new ClassDto();
                    classdto.classId = Convert.ToInt32(row[0]);
                    classdto.className = row[1].ToString();
                    lstClass.Add(classdto);
                }

            }
            return lstClass;
        }
        public bool AddClass(int classId, string className)
        {
            bool result = false;
            if (classId == 0)
            {
                da = new SqlDataAdapter("select * from tbl_Class_Master where className='" + className + "'", con);
                ds = new DataSet();
                da.Fill(ds, "tbl_Class_Master");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    cmd = new SqlCommand("insert into tbl_Class_Master(className) values('" + className + "')", con);
                    con.Open();
                    int count = cmd.ExecuteNonQuery();
                    con.Close();
                    if (count > 0)
                        result = true;
                }
            }
            else
            {
                cmd = new SqlCommand("update tbl_Class_Master set className='" + className + "' where classId=" + classId, con);
                con.Open();
                int count = cmd.ExecuteNonQuery();
                con.Close();
                if (count > 0)
                    result = true;
            }
            return result;
        }




        public int stud_Reg(string str)
        {
            count = 0;
            cmd = new SqlCommand(str, con);
            if (con.State == 0)
            {
                con.Open();
            }
            count = cmd.ExecuteNonQuery();
            con.Close();
            return count;
        }

        public void fillgrid(GridView dg, string str)
        {
            //cmd.Connection = con;
            //cmd.CommandText = str;
            cmd = new SqlCommand(str, con);
            if (con.State == 0)
            {
                con.Open();
            }
            DataSet ds = new DataSet();
            //da = new OleDbDataAdapter(sql, con);
            da = new SqlDataAdapter(str, con);
            da.Fill(ds);
            dg.DataSource = ds.Tables[0];
            dg.DataBind();
        }

        public void fillCbo(string str, DropDownList ddl)
        {

            cmd = new SqlCommand(str, con);
            if (con.State == 0)
            {
                con.Open();
            }
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(str, con);
            //            OleDbDataAdapter da = new OleDbDataAdapter(str, con);
            da.Fill(ds);
            DataRow dr;
            //***********************************************
            dr = ds.Tables[0].NewRow();
            dr.Table.Columns[0].ColumnName = "0";
            dr.Table.Columns[1].ColumnName = "1";
            //ds.Tables[0].Rows.InsertAt(dr, 0);
            ds.Tables[0].AcceptChanges();

            ddl.DataSource = ds.Tables[0];
            ddl.DataValueField = "0";
            ddl.DataTextField = "1";
            ddl.DataBind();

        }

        public DataSet fillDS(string str)
        {
            cmd = new SqlCommand(str, con);
            if (con.State == 0)
            {
                con.Open();
            }
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(str, con);
            da.Fill(ds);
            return ds;
        }

        public string srno(string str)
        {
            string a = "";
            try
            {
                if (con.State == 0)
                {
                    con.Open();
                }
                cmd = new SqlCommand(str, con);
                //con.Open();
                a = Convert.ToString(cmd.ExecuteScalar());
                return a;
            }
            catch (Exception ex)
            {
                return a;
            }
            finally {
                con.Close();
            }

        }
    }
}