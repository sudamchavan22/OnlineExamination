using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineExamination
{
    public partial class frmNewController : System.Web.UI.Page
    {
        DataSet ds;
         DBOperations db;
         int count;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            if (!IsPostBack)
                loadControllerDetails();
        }

        private void loadControllerDetails()
        {
            GridView1.DataSource = db.RetriveControllerDetails(null);
            GridView1.DataBind();
        }
        protected void btnNewController_Click(object sender, EventArgs e)
        {
            ds = new DataSet();
            ds = db.RetriveControllerDetailsOnUserID(txtUserid.Text);
            if (ds.Tables[0].Rows.Count > 0)
                Response.Write("<script>alert('This UserID is already Present in database!')</script>");
            else
            {
                count = db.InsertOrUpdateController(null, txtName.Text, txtContact.Text, txtEmail.Text, txtUserid.Text, txtPwd.Text);
                if(count>0)
                    Response.Write("<script>alert('Added Successfully!')</script>");
                GetVisibleControls();
                loadControllerDetails();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cid = Convert.ToInt32(GridView1.DataKeys[0].Value.ToString());
            count = db.DeleteController(cid);
            if (count > 0)
                Response.Write("<script>alert('Delete Successfully!')</script>");
            GetVisibleControls();
            loadControllerDetails();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            int cid = Convert.ToInt32(((Label)row.FindControl("lblcid")).Text);
            Session["cid"] = cid;
            Response.Write(cid);
            ds = new DataSet();
            ds = db.RetriveControllerDetails(cid);
            txtName.Text = ds.Tables[0].Rows[0]["name"].ToString();
            txtContact.Text = ds.Tables[0].Rows[0]["cont_no"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["email_id"].ToString();
            txtUserid.Text = ds.Tables[0].Rows[0]["user_id"].ToString();
            txtPwd.TextMode =txtConfirmPwd.TextMode= TextBoxMode.SingleLine;
            txtPwd.Text = ds.Tables[0].Rows[0]["pwd"].ToString();
            txtConfirmPwd.Text = ds.Tables[0].Rows[0]["pwd"].ToString();

            btnUpdate.Visible = true;
            txtPwd.Enabled = txtConfirmPwd.Enabled= btnNewController.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int cid = Convert.ToInt32(Session["cid"].ToString());
            count = db.InsertOrUpdateController(cid, txtName.Text, txtContact.Text, txtEmail.Text, txtUserid.Text, txtPwd.Text);
            if (count > 0)
                Response.Write("<script>alert('Updated Successfully!')</script>");
            loadControllerDetails();
            GetVisibleControls();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            GetVisibleControls();
        }

        private void GetVisibleControls()
        {
            txtConfirmPwd.Text = txtContact.Text = txtEmail.Text = txtName.Text = txtPwd.Text = txtUserid.Text = "";
            txtPwd.ReadOnly = txtConfirmPwd.ReadOnly =btnUpdate.Visible = false;
            btnNewController.Visible = true;
        }
    }
}