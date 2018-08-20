using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineExamination
{
    public partial class frmStudRegistration : System.Web.UI.Page
    {
        DataSet ds;
        DBOperations db;
        string str;
        bool status = true;
        public Boolean editflag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
              db = new DBOperations();
            // Page.ClientScript.RegisterStartupScript(GetType(), "none", "<script>executeAfter();</script>", false);
            if (!IsPostBack)
            {
                setlocation();
                fillctrl();
                divStudDetail.Style.Add("display", "block");

            }
            else
            {
                if (ScriptManager.GetCurrent(Page).IsInAsyncPostBack == true)
                {
                  // string cplid = ScriptManager.GetCurrent(Page).IsInAsyncPostBack.ToString();

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "AddAttributesClientSide", "callevent();", true);
                }
            }
            //                loadData();
        }

        private void setlocation()
        {
            divStudDetail.Style.Add("display","none");
            divDGSlist.Style.Add("display", "none");
        }

        private void fillctrl()
        {
<<<<<<< HEAD
            str = "select classId,className from tbl_class_Master";
=======
            str = "select classId,class from tbl_class_Master";
>>>>>>> 5757134e4e2316b2dd37150b9c7267cb780662cc
            db.fillCbo(str, ddl_Class);
            ddl_Class.Items.Insert(0, new ListItem("--Select Class--", "0"));

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            divStudDetail.Style.Add("display", "block");
            divDGSlist.Style.Add("display", "none");

                       //BtnAdd.Enabled = false;
            //BtnEdit.Enabled = false;
            //BtnSave.Enabled = true;

            //BtnAdd.Attributes.Add("disabled", "disabled");
            //BtnEdit.Attributes.Add("disabled", "disabled");
            //BtnSave.Attributes.Remove("disabled");
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            //if (Convert.ToInt32(txt_StudSrno.Value) >0)
            //{
            //    Eflag = 'E';
            //}
            //else
            //{
            //    Eflag = 'A';
                str = "select userId from tblStudents where userId ='" + txt_UserID.Text + "'";
                string uid = db.srno(str);
                if (uid== txt_UserID.Text)
                {
                    Response.Write("<script>alert('User Name Allready Present Try Another!')</script>");
                    txt_UserID.Focus();
                    return;
                }
            //}
            int ddlclass = 0;
            if (ddl_Class.SelectedIndex > 0)
            {
                ddlclass = Convert.ToInt32(ddl_Class.SelectedValue);
            }
            else
            {
                ddlclass = 0;
            }

            

            //str = "Select Getdate()";
            //string regdate = db.srno(str);
            string regdate = DateTime.Now.ToShortDateString();
            //DateTime _date = Convert.ToDateTime(regdate);
          //string entrdate = _date.ToString("MM/dd/yyyy");
         
            str = "";
            str = "exec SpWriteStudentDetails";
            str += "'" + txt_StudName.Text + "',";
            str += "" + ddlclass + ",";
            str += "" + txt_RollNo.Text + ",";
            str +="'"+txt_UserID.Text+"',";
            str +="'"+txt_Passward.Text+"',";
            str += "'" + regdate + "',";
          str += "'" + status + "'";

            int count = 0;
            count = db.stud_Reg(str);
            if (count > 0)
            {
                Response.Write("<script>alert('Successfuly Executed!')</script>");
            }

            editflag = false;
            clearctrl();
            //BtnAdd.Enabled = true;
            //BtnEdit.Enabled = true;
            //BtnSave.Enabled = false;
            //BtnSave.Attributes.Add("disabled", "disabled");
            //BtnEdit.Attributes.Remove("disabled");
            //BtnAdd.Attributes.Remove("disabled");


        }
        public void clearctrl()
        {
            txt_StudName.Text = txt_RollNo.Text = txt_UserID.Text = txt_Passward.Text = "";
            txt_StudSrno.Value = "0";
            ddl_Class.SelectedIndex = 0;
        }
        private void filldg()
        {
            str = "select stud_id,name,classId,rollNo,userId,password,format(redDate,'dd/MM/yyyy')as regDate from tblStudent";
           // str = "Select srno,studName,SClass,RollNo,UserID,passward, Format(regdate,'dd/MMM/yyyy')as regdate from tbl_Stud_Reg_Master where 1=1 ";
            db.fillgrid(DGVStudList, str);


        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {

            filldg();

            divStudDetail.Style.Add("display", "none");
            divDGSlist.Style.Add("display", "block");


            //BtnAdd.Enabled = false;
            //BtnEdit.Enabled = false;
            //BtnSave.Enabled = false; 
            //BtnAdd.Attributes.Add("disabled", "disabled");
            //BtnEdit.Attributes.Add("disabled", "disabled");
            //BtnSave.Attributes.Remove("disabled");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            divStudDetail.Style.Add("display", "block");
            divDGSlist.Style.Add("display", "none");
            clearctrl();
            //BtnAdd.Enabled = true;
            //BtnEdit.Enabled = false;
            //BtnSave.Enabled = false;

            //BtnSave.Attributes.Add("disabled", "disabled");
            //BtnEdit.Attributes.Add("disabled", "disabled");
            //BtnAdd.Attributes.Remove("disabled");
        }

        protected void DGVStudList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //int a = DGVStudList.CurrentCell.RowIndex;
            editflag = true;
            GridViewRow row = DGVStudList.SelectedRow;
            
            //txt_StudSrno.Value = (((Label)row.FindControl("srno")).Text);
            txt_StudSrno.Value = DGVStudList.SelectedRow.Cells[0].Text;
            //txt_StudSrno.Value = DGVStudList.Rows[DGVStudList.SelectedRow.i].Cells["srno"].Value.ToString();


            str = "";
            str += "Select * From tblStudent Where stud_id=" + txt_StudSrno.Value;
            ds = db.fillDS(str);

            ddl_Class.SelectedValue = ds.Tables[0].Rows[0]["classId"].ToString();
            txt_StudName.Text = ds.Tables[0].Rows[0]["name"].ToString();
            txt_RollNo.Text = ds.Tables[0].Rows[0]["nollNo"].ToString();
            txt_UserID.Text = ds.Tables[0].Rows[0]["userId"].ToString();
            txt_Passward.Text = ds.Tables[0].Rows[0]["passward"].ToString();

            divStudDetail.Style.Add("display", "block");
            divDGSlist.Style.Add("display", "none");

        }

        
    }
}