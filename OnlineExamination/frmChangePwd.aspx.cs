using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamination
{
    public partial class frmChangePwd : System.Web.UI.Page
    {
        DBOperations db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();

        }

        protected void btnChangePwd_Click(object sender, EventArgs e)
        {
            int cid=Convert.ToInt32(Session["cid"].ToString());
            int count = db.UpdatePwd(cid, txtNewPwd.Text);
            if (count > 0)
                Response.Write("<script>alert('Password Changed!')</script>");
        }
    }
}