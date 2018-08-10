using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineExamination
{
    public partial class frmAddQuestions : System.Web.UI.Page
    {
        DataSet ds;
        DBOperations db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            if (!IsPostBack)
                loadData();
        }

        private void loadData()
        {
            GridView1.DataSource = db.RetriveAllQuetions();
            GridView1.DataBind();
            DropDownList1.DataSource = DropDownList2.DataSource = db.AllSubject();
           DropDownList1.DataTextField= DropDownList2.DataTextField = "subject_name";
           DropDownList1.DataValueField = DropDownList2.DataValueField = "sbid";
            DropDownList1.DataBind();
            DropDownList2.DataBind();
            DropDownList1.Items.Insert(0, "--Select Subject--"); DropDownList2.Items.Insert(0, "All");
            GridView1.PageIndex = 0;
        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ans = rblAnswer.SelectedValue.ToString();
            int sbid=Convert.ToInt32(DropDownList1.SelectedValue);
            int count = db.InsertOrUpdateQuestions(null, sbid, txtQuestion.Text, txtOpt1.Text, txtOpt2.Text, txtOpt3.Text, txtOpt4.Text, ans);
        if (count > 0)
            Response.Write("<script>alert('Question Added Successfully!')</script>");
        GetControlVidible();
        loadData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            int count = db.RemoveQuestion(id);
            if (count > 0)
                Response.Write("<script>alert('Question removed successfully..!')</script>");
            loadData();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            int id = Convert.ToInt32(((Label)row.FindControl("lblID")).Text);
            Session["id"] = id;
            ds = new DataSet();
            ds = db.RetriveAllQuetions(id,null,null);
            DropDownList1.SelectedValue = ds.Tables[0].Rows[0]["sbid"].ToString();
            txtQuestion.Text = ds.Tables[0].Rows[0]["question"].ToString();
            txtOpt1.Text = ds.Tables[0].Rows[0]["opt_1"].ToString();
            txtOpt2.Text = ds.Tables[0].Rows[0]["opt_2"].ToString();
            txtOpt3.Text = ds.Tables[0].Rows[0]["opt_3"].ToString();
            txtOpt4.Text = ds.Tables[0].Rows[0]["opt_4"].ToString();
            rblAnswer.SelectedValue =ds.Tables[0].Rows[0]["ans"].ToString();
            Button1.Visible = false;
            btnUpdate.Visible = true;
        }
        private void GetControlVidible()
        {
            rblAnswer.SelectedIndex = -1;
            txtQuestion.Text = txtOpt1.Text = txtOpt2.Text = txtOpt3.Text = txtOpt4.Text = "";
        Button1.Visible = true;
        btnUpdate.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(Session["id"].ToString());
            int sbid = Convert.ToInt32(DropDownList1.SelectedValue);
            int count = db.InsertOrUpdateQuestions(id,sbid, txtQuestion.Text, txtOpt1.Text, txtOpt2.Text, txtOpt3.Text, txtOpt4.Text, rblAnswer.SelectedValue.ToString());
            if (count > 0)
                Response.Write("<script>alert('Question updated successfully..!')</script>");
            GetControlVidible();
            loadData();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            GetControlVidible();
            loadData();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
            FilterRecords();
        }

        private void FilterRecords()
        {
            if (DropDownList2.SelectedIndex == 0)
                GridView1.DataSource = db.RetriveAllQuetions();
            else
            {
                int sbid = int.Parse(DropDownList2.SelectedValue);
                GridView1.DataSource = db.RetriveQuetions(sbid);
            }
            GridView1.DataBind();
            rblAnswer.SelectedIndex = -1;
            GridView1.PageIndex = 0;
            txtQuestion.Text = txtOpt1.Text = txtOpt2.Text = txtOpt3.Text = txtOpt4.Text = "";
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            FilterRecords();
        }

    }
}