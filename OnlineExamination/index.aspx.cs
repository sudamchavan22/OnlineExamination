using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamination
{
    public partial class index : System.Web.UI.Page
            {
        DBOperations db;
        DataSet ds;
        DateTime st, et, date;
        string date1,start_time;
        int examid;
         protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            if (!IsPostBack)
            {


                if (ValidateLi())
                {
                    loadExamDetails();
                    date = DateTime.Now.Date;
                    date1 = date.ToString("dd/MM/yyyy");
                    date = DateTime.Now.ToLocalTime();
                    start_time = date.ToShortTimeString();
                    bool Started = db.ExamTime(start_time, examid);
                    if (lblDate.Text == date1 && Started)
                    {
                        btnSubmit.Enabled = true;
                    }
                }
                           }
        }
        private void loadExamDetails()
        {
           date1 = DateTime.Now.Date.ToString("MM/dd/yyyy");
            ds = new DataSet();
            ds = db.ExamDate(date1);
            if (ds.Tables[0].Rows.Count > 0)
            {
                st = Convert.ToDateTime(ds.Tables[0].Rows[0]["date"] + " " + ds.Tables[0].Rows[0]["start_time"]);
                et = Convert.ToDateTime(ds.Tables[0].Rows[0]["date"] + " " + ds.Tables[0].Rows[0]["end_time"]);
                hfexamid.Value = ds.Tables[0].Rows[0]["examid"].ToString();
                examid = Convert.ToInt32(hfexamid.Value);
                date = Convert.ToDateTime(ds.Tables[0].Rows[0]["date"]);
                lblDate.Text = date.ToString("dd/MM/yyyy");
                lblST.Text = st.ToShortTimeString();
                lblET.Text = et.ToShortTimeString();
            }
            else
                lblDate.Text = " No exam Yet!";
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            List<LoginProperties> loginInfo = new List<LoginProperties>();
            loginInfo=db.Login(txtUserID.Text, txtPwd.Text);
            if (loginInfo[0].LoginState)
            {
                Session["cid"] = loginInfo[0].cid;
                Response.Redirect("~/frmSubjects.aspx");
            }
            else
                Label1.Text="Wrong User ID or Password";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            examid=Convert.ToInt32(hfexamid.Value);
            bool Authentication = db.ExamDoneChacking(txtUserIdStud.Text,examid );
            if (Authentication == true)
            {
                int stud_id = db.AddNewStudentDetails(txtUserIdStud.Text, txtPwdStud.Text);
                if (stud_id > 0)
                {
                    Session["examid"]= hfexamid.Value;
                    Session["stud_id"] = stud_id;
                    Response.Redirect("~/frmInstructions.aspx");
                }
                else
                    Response.Write("<script>alert('Enter valid Username/Password..!')</script>");
            }
            else
                Response.Write("<script>alert('You done with Your turn..!')</script>");
        }
        protected bool ValidateLi() {
            if (Convert.ToDateTime(hfExpDate.Value) <= Convert.ToDateTime(DateTime.Now.ToShortDateString()))
                Response.Redirect("~/error.html");
            return true;
        
        }


        protected void Timer1_Tick(object sender, EventArgs e)
        {
            date = DateTime.Now.ToLocalTime();
            start_time = date.ToLongTimeString();
            lblClock.Text = date.ToLongTimeString();
        }

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {

        }
            }
}