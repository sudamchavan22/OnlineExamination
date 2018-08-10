using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OnlineExamination
{
    public partial class frmSetExamDateTime : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(new DBConnection().ConnState);
        SqlDataAdapter da;
        DataSet ds;
        DBOperations db;
        int count;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            if (!IsPostBack)
            {
                
                SelectedOption();
                loadData();
            }
            
        }

        private void loadData()
        {
            GridView1.DataSource = db.selectExamDT();
            GridView1.DataBind();
            CheckBoxList1.DataSource = db.AllSubject();
            CheckBoxList1.DataTextField = "subject_name";
            CheckBoxList1.DataValueField = "sbid";
            CheckBoxList1.DataBind();
            
        }
        protected void rblOptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            SelectedOption();

           }
        private void SelectedOption()
        {
        int index=rblOptions.SelectedIndex;
           switch (index)
           { 
               case 0:
                   pnlNew.Visible = true;
                  pnlUpdate.Visible = false;
                   break;
               case 1:
                   pnlUpdate.Visible = true;
                   pnlNew.Visible = false;
                   break;
               
        }

        }
        //where date='"+txtUpdateExamD.Text+"'", con);
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string subjects = SelectedSubjects();
             if (subjects != null)
                {
            int id = Convert.ToInt32(Session["id"].ToString());
            int count=db.InsertOrUpdateExamTime(id,txtUpdateExamD.Text,txtUpdateST.Text,txtUpdateET.Text,subjects);
            if(count>0) 
                Response.Write("<script>alert('Update Successfully!')</script>");
                loadData();
                }
             else
                 Response.Write("<script>alert('Select any 3 Subjects!')</script>");
           
        }

        protected void btnSet_Click(object sender, EventArgs e)
        {
            int countSubject=SelectedSubCount();
            if (countSubject == 3)
            {
                string subjects = SelectedSubjects();
                int count = db.InsertOrUpdateExamTime(null, txtExamDate.Text, txtStartTime.Text, txtEndTime.Text, subjects);

                    if (count > 0)
                        Response.Write("<script>alert('Done!')</script>");
                    loadData();
                }
                 else
                Response.Write("<script>alert('Select any 3 Subjects!')</script>");
        }

        private string SelectedSubjects()
        {
            string subjects = null;
            
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Selected)
                {
                    subjects +=li.Value.ToString() + ", ";
                }
            }
            if (subjects != null)
            {
                subjects = subjects.Substring(0, subjects.Length - 2);
                              
            }
           return subjects;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            rblOptions.SelectedIndex = 1;
            pnlUpdate.Visible = true;
            pnlNew.Visible = false;
            GridViewRow row = GridView1.SelectedRow;
           int id = Convert.ToInt32(((Label)row.FindControl("lblid")).Text);
            Session["id"]=id;
           ds = new DataSet();
           ds=db.SelectExamOnID(id);
           txtUpdateExamD.Text = ds.Tables[0].Rows[0]["date"].ToString();
           txtUpdateST.Text = ds.Tables[0].Rows[0]["start_time"].ToString();
           txtUpdateET.Text = ds.Tables[0].Rows[0]["end_time"].ToString();
             
            
            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            int count =db.CancelExam(id);
            if(count>0)
                Response.Write("<script>alert('Exam Canceled Successfully..!')</script>");
            loadData();
        }
        private int SelectedSubCount()
        {
           count = 0;
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Selected)
                    count += 1;
            }
            if (count == 3)
                count = 3;
            return count;
            
        }
   
    }
}