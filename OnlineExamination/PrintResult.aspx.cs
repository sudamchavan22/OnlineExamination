using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineExamination
{
    public partial class PrintResult : System.Web.UI.Page
    {
        DataSet ds;
        DBOperations db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            if (!IsPostBack)
            {
                if (Session["cid"] == null)
                    Response.Redirect("~/index.aspx");
                loadResult();
            }
        }
        private void loadResult()
        {
            List<string> result = new List<string>();
            result=(List<string>)Session["result"];
            string date = Label2.Text= result[0].ToString();
            int criteria = Convert.ToInt32(result[1]);
            ds = new DataSet();
            ds = db.ViewResult(date,criteria);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}