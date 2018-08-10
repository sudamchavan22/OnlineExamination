using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineExamination
{
    public partial class frmResult : System.Web.UI.Page
    {
        DataSet ds;
        DBOperations db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            if (!IsPostBack)
                loadExamData();
        }

        private void loadExamData()
        {
            GridView1.DataSource = db.ResultExamDetails(null);
            GridView1.DataBind();
        }
        protected void btnResult_Click(object sender, EventArgs e)
        {
            int criteria=Convert.ToInt32(txtCriteria.Text);
            ds = new DataSet();
            ds = db.ViewResult(txtdate.Text, criteria);
            if (ds.Tables[0].Rows.Count > 0)
            {
                List<string> result = new List<string>() {txtdate.Text,txtCriteria.Text };
                Session["result"] = result;
                Response.Write("<script>window.open('PrintResult.aspx','_blank')</script>");
            }
            else
                Response.Write("<script>alert('record not found!')</script>");
        }

      
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
             Label lbldate=(Label) GridView1.SelectedRow.FindControl("lbldate");
             txtdate.Text = lbldate.Text;
             //Response.Redirect("http://localhost:52109/PrintResult.aspx");
        }
    }
}