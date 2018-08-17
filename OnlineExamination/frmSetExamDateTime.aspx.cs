using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

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
            lstClass.DataSource = db.getClassList();
            lstClass.DataTextField = "className";
            lstClass.DataValueField = "classId";
            lstClass.DataBind();
            lstClass.Items.Insert(0, "--Select Class--");
            lstClass.SelectedIndex = 0;
            lstSubject.Items.Insert(0, "--Select Subject--");
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
           loadData();

        }
        //where date='"+txtUpdateExamD.Text+"'", con);
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SetExam();
        }

        protected void btnSet_Click(object sender, EventArgs e)
        {
            SetExam();
        }

        private void SetExam()
        {
            int sbid = 0, createdBy = Convert.ToInt32(Session["cid"]), count = 0;
            string selectedQue = string.Empty;
            Hashtable htQuestions = new Hashtable();
            if (Session["setQuestions"] != null)
                htQuestions = (Hashtable)Session["setQuestions"];
            foreach (int key in htQuestions.Keys)
            {
                sbid = key;
                selectedQue = htQuestions[key].ToString();
                count = db.InsertOrUpdateExamTime(null, txtExamDate.Text, txtStartTime.Text, txtEndTime.Text, createdBy, sbid, selectedQue, Convert.ToInt32(txtMarks.Text));
            }
            if (count > 0)
                Response.Write("<script>alert('Done!')</script>");
            loadData();
        }

        //private string SelectedSubjects()
        //{
        //    string subjects = null;
            
        //    foreach (ListItem li in CheckBoxList1.Items)
        //    {
        //        if (li.Selected)
        //        {
        //            subjects +=li.Value.ToString() + ", ";
        //        }
        //    }
        //    if (subjects != null)
        //    {
        //        subjects = subjects.Substring(0, subjects.Length - 2);
                              
        //    }
        //   return subjects;
        //}

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

        protected void lstClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstClass.SelectedIndex > 0)
            {
                lstSubject.DataSource = db.AllSubject(Convert.ToInt32(lstClass.SelectedValue));
                lstSubject.DataTextField = "subject_name";
                lstSubject.DataValueField = "sbid";
                lstSubject.DataBind();
                lstClass.Enabled = false;
            }
                lstSubject.Items.Insert(0, "--Select Subject--");
        }

        protected void lstSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstSubject.SelectedIndex > 0)
                loadQuestions(Convert.ToInt32(lstSubject.SelectedValue));
            else
                loadQuestions(0);
        }
        private void loadQuestions(int sbid) {
            gridQuestions.DataSource = db.RetriveQuetions(sbid);
            gridQuestions.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            Hashtable htQuestions = new Hashtable();
            Hashtable htDisplaySb = new Hashtable();
            string q_ids = string.Empty,sbName=lstSubject.SelectedItem.Text;
            int sbid = 0,counter=0;
            foreach (GridViewRow row in gridQuestions.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("cbSelect") as CheckBox);
                    if (chkRow.Checked)
                    {
                        sbid = Convert.ToInt32((row.Cells[2].FindControl("hfsbid") as HiddenField).Value);
                        q_ids += (row.Cells[2].FindControl("hfQuestionId") as HiddenField).Value + ",";
                        counter++;
                    }
                }
            }
            if (q_ids.Length > 0)
            {
                q_ids = q_ids.Remove(q_ids.Length - 1);

                if (Session["setQuestions"] != null)
                    htQuestions = (Hashtable)Session["setQuestions"];
                if (Session["htDisplaySb"] != null)
                    htDisplaySb = (Hashtable)Session["htDisplaySb"];
                

                if (htQuestions.Contains(sbid))
                    htQuestions.Remove(sbid);

                if (htDisplaySb.Contains(sbName))
                    htDisplaySb.Remove(sbName);

                    htDisplaySb.Add(sbName, counter);
                    htQuestions.Add(sbid, q_ids);

               
                Session["setQuestions"] = htQuestions;
                 Session["htDisplaySb"] = htDisplaySb;
                
                gridSelectedSubject.DataSource=htDisplaySb;
                gridSelectedSubject.DataBind();

                
            }
            else
                Response.Write("<script>alert('Please select Questions!')</script>");
            //gvSelected.DataSource = dt;
            //gvSelected.DataBind();

            
        }
   
    }
}