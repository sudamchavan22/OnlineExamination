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
        int _classId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            if (!IsPostBack)
            {
                SelectedOption();
                LoadClass();
               
                
            }
        }
        private void LoadSubjects(int classId)
        {
            gvSubjects.DataSource = db.AllSubject(classId);
            gvSubjects.DataBind();
          
        }
        private void LoadClass()
        {
            gridClass.DataSource = db.getClassList();
            gridClass.DataBind();
            txtClassName.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int count = db.NewSubject(txtSubject.Text,Convert.ToInt32(lstClass.SelectedValue));
            if (count == 0)
                Response.Write("<script>alert('Subject is already Present..!')</script>");
            else
                Response.Write("<script>alert('Subject is Added Successfully..!')</script>");
            LoadSubjects(Convert.ToInt32(lstClass.SelectedValue));
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
                pnlAddClass.Visible = true;
                pnlAddSubject.Visible = false;

                break;
            case 1:
                pnlAddSubject.Visible = true;
                pnlAddClass.Visible = false;
                lstClass.DataSource = db.getClassList();
                lstClass.DataTextField = "className";
                lstClass.DataValueField = "classId";
                lstClass.DataBind();
                lstClass.SelectedIndex = 0;
                _classId = Convert.ToInt32(lstClass.SelectedValue);
                LoadSubjects(_classId);
                    
                break;
        }
        }

        protected void btnSaveClass_Click(object sender, EventArgs e)
        {
 bool result=false;
            if (btnSaveClass.Text != "Update Class")
            {
                result = db.AddClass(0, txtClassName.Text);
                if (!result)
                {
                    Response.Write("<script>alert('Class is already Present')</script>");
                    gridClass.DataSource = db.getClassList();
                    gridClass.DataBind();
                }
                else
                    Response.Write("<script>alert('Class is Added Successfully')</script>");
            }
            else {
                 result = db.AddClass(Convert.ToInt32(hfClassId.Value), txtClassName.Text);
                 if (result)
                     Response.Write("<script>alert('Class is Updated Successfully')</script>");
                else
                     Response.Write("<script>alert('Failed to Update Class')</script>");

                btnSaveClass.Text = "Add Class";
            }
            LoadClass();
        }

        protected void gridClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtClassName.Text =gridClass.Rows[2].ToString();
            hfClassId.Value = gridClass.Rows[1].ToString();
        }

        protected void gridClass_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = gridClass.Rows[rowIndex];

            //Access Cell values.
            string classId = row.Cells[0].Text;
            string className = row.Cells[1].Text;
            txtClassName.Text = className;
            hfClassId.Value = classId;
            btnSaveClass.Text = "Update Class";
        }

        protected void lstClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            _classId = Convert.ToInt32(lstClass.SelectedValue);
            LoadSubjects(_classId);
        }
    }
}