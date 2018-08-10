using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamination
{
    public partial class frmSubjects : System.Web.UI.Page
    {
        DBOperations db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            if (!IsPostBack)
                LoadSubjects();

        }
        private void LoadSubjects()
        {
            gvSubjects.DataSource = db.AllSubject();
            gvSubjects.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int count = db.NewSubject(txtSubject.Text);
            if (count == 0)
                Response.Write("<script>alert('Subject is already Present..!')</script>");
            else
                Response.Write("<script>alert('Subject is Added Successfully..!')</script>");
            LoadSubjects();
        }
    }
}