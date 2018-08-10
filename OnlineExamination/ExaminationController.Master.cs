using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineExamination
{
    public partial class ExaminationController : System.Web.UI.MasterPage
    {
        DataSet ds;
        DBOperations db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            if (Session["cid"] == null)
                Response.Redirect("~/index.aspx");
            if (!IsPostBack)
                LoadUserDetails();
        }
        private void LoadUserDetails()
        { 
            int cid=Convert.ToInt32(Session["cid"].ToString());
            ds = new DataSet();
            ds = db.RetriveControllerDetails(cid);
            lblUsername.Text = ds.Tables[0].Rows[0]["name"].ToString();
        }

        protected void lblLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }
    }
}