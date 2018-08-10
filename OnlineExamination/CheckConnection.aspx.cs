using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineExamination
{
   
    public partial class CheckConnection : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        DBConnection db;
        SolvedQuestions sq;
        List<SolvedQuestions> lstSol;
        protected void Page_Load(object sender, EventArgs e)
        {
            db=new DBConnection();
            con = new SqlConnection(db.ConnState);
            sq = new SolvedQuestions();
            lstSol = new List<SolvedQuestions>();
                    }
        private void LoadData() { }


        protected void btnTestConn_Click(object sender, EventArgs e)
        {
            int count = 0, nagcount = 0;
            count += 1; nagcount -= 10;
            con.Open();
            Response.Write("<script>alert('Hurry up Your Time is upto the end!')</script>");
            Label1.Text = con.State.ToString();
            if (Session["count"] == null)
            {
                List<SolvedQuestions> newItem = new List<SolvedQuestions>();
                sq.rowNo = count; sq.selectedOption = nagcount;
                newItem.Add(sq);
                lstSol.AddRange(newItem);
                Session["count"] = lstSol;
                Response.Write("Added to List!");
                foreach (SolvedQuestions item in lstSol)
                {
                    Response.Write(item.rowNo);
                    Response.Write(item.selectedOption);
                }


            }
            else if (Session["count"] != null)
            {
                lstSol = (List<SolvedQuestions>)Session["count"];
                 List<SolvedQuestions> newItem = new List<SolvedQuestions>();
                 sq.rowNo = count; sq.selectedOption = nagcount;
                 newItem.Add(sq);
                 lstSol.AddRange(newItem);
                 Session["count"] = lstSol;
                 Response.Write("Added to List!(Not Null)");
                 foreach (SolvedQuestions item in lstSol){
                     Response.Write(item.rowNo);
                 Response.Write(item.selectedOption);
            }}

            else
                Response.Write("View State is Null!");
           
           
            

        }

        protected void Timer2_Tick(object sender, EventArgs e)
        {
            DateTime date = DateTime.Now.ToLocalTime();
            string start_time = date.ToLongTimeString();
            lblClock.Text = date.ToLongTimeString();
        }
    }
}