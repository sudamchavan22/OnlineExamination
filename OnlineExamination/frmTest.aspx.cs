using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

namespace OnlineExamination
{
    public partial class frmTest : System.Web.UI.Page      
    {
        DBOperations db;
        DataSet ds;
        int rowNo,marks=0, TotalMarks=0, index, examid, stud_id,queCount=0;
        string ans,strmin,strsec;
        List<int> SolvIndex, UnSolvIndex;
        List<SolvedQuestions> storeSelectedOptions, Temp;
        SolvedQuestions obj;
        bool ansStatus, addStatus;
        int min = 59, sec =59 ;

        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBOperations();
            SolvIndex = new List<int>();
            storeSelectedOptions = new List<SolvedQuestions>();
            Temp = new List<SolvedQuestions>();
            obj = new SolvedQuestions();
            UnSolvIndex = new List<int>();
           
           
            examid = Convert.ToInt32(Session["examid"].ToString());
            if (ViewState["Q_Count"] != null)
                queCount = Convert.ToInt32(ViewState["Q_Count"].ToString());
              if (ViewState["marks"] != null)
                marks = Convert.ToInt32(ViewState["marks"].ToString());
            
            if (!IsPostBack)
            {
                if (Session["stud_id"] == null)
                    Response.Redirect("~/index.aspx");
                else
                {
                    loadstudentDetails();
                    Session["storeSelectedOptions"] = null;
                    ViewState["rowNo"] = rowNo = 1; ViewState["TotalMarks"] = TotalMarks = 0;
                    DataSet ds1 = db.RetriveAllQuetions(examid);
                    ViewState["marks"] = marks = Convert.ToInt32(ds1.Tables[0].Rows[0]["marks"].ToString());
                    ViewState["Q_Count"] = queCount=ds1.Tables[0].Rows.Count;
                    loadQuestions();
                }
            }

        }
        //load student Details
        private void loadstudentDetails()
        {
            stud_id = (int)Session["stud_id"];
            ds = new DataSet();
            ds = db.StudentDetails(stud_id);
            lblName.Text = ds.Tables[0].Rows[0]["name"].ToString();
            lblEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
            

        }
        //Load all Questions and add count of questions for Que.No Button Generation....!
        private void loadQuestions()
        {
            string subjectID = GetSubjectsID();
            rowNo = Convert.ToInt32(ViewState["rowNo"].ToString());
            //lvIndexOfQ.DataSource = db.RetriveAllQuetions(null,null,subjectID);
            lvIndexOfQ.DataSource = db.RetriveAllQuetions(null, null,subjectID);
            lvIndexOfQ.DataBind();
            DataList1.DataSource = db.RetriveAllQuetions(null, rowNo,subjectID);
            DataList1.DataBind();

        }

        //retrive Exam Subjects
        private string GetSubjectsID()
        {
            string subjectID = null;
           
            ds = new DataSet();
            ds = db.SelectExamOnID(examid);

    //       var query =
    //from product in ds.Tables[0].AsEnumerable().Distinct().Select(p=>p.Field<Int32>("sbid")).GroupBy(;

    //subjectID=string.Join(',',ds.Tables[0].AsEnumerable().Distinct().Select(p=>p.Field<string>("sbid")))
            List<string> sbids=new List<string>();
            foreach (DataRow q in ds.Tables[0].Rows)
            {
               if(!sbids.Contains(q["sbid"].ToString()))
                   sbids.Add(q["sbid"].ToString());
                
            }
            foreach (string i in sbids) {
                subjectID += i + ",";
            }
            subjectID = subjectID.Remove(subjectID.Length - 1);
            //subjectID = string.Join(',',sbids.ToList().Select());
            ListView1.DataSource = db.GetSubjectName(subjectID);
            ListView1.DataBind();
            return subjectID;
        }
        //Load Options For the Question No....With Answer...!
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
           
            RadioButtonList rblQstList = (RadioButtonList)e.Item.FindControl("rblQstList");
            HiddenField hfq_id = (HiddenField)e.Item.FindControl("hfq_id");

            //DataSet ds = db.RetriveAllQuetions(Convert.ToInt32(hfq_id.Value), null,null);
            DataSet ds = db.RetriveAllQuetions(Convert.ToInt32(hfq_id.Value),null,null);
            int count = ds.Tables[0].Rows.Count;

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                Options opt1 = new Options() { Text = ds.Tables[0].Rows[0]["opt_1"].ToString(), Value = "a" };
                Options opt2 = new Options() { Text = ds.Tables[0].Rows[0]["opt_2"].ToString(), Value = "b" };
                Options opt3 = new Options() { Text = ds.Tables[0].Rows[0]["opt_3"].ToString(), Value = "c" };
                Options opt4 = new Options() { Text = ds.Tables[0].Rows[0]["opt_4"].ToString(), Value = "d" };
                List<Options> rblist = new List<Options>();
                rblist.Add(opt1); rblist.Add(opt2); rblist.Add(opt3); rblist.Add(opt4);
                ViewState["ans"] = ds.Tables[0].Rows[0]["ans"].ToString();
                rblQstList.DataSource = rblist;
                rblQstList.DataTextField = "Text";
                rblQstList.DataValueField = "Value";
                rblQstList.DataBind();
                storeSelectedOptions = (List<SolvedQuestions>)Session["storeSelectedOptions"];
                if (Session["storeSelectedOptions"] != null)
                {
                    var sol = from tab in storeSelectedOptions where tab.rowNo == rowNo orderby tab.rowNo select tab;
                    foreach (SolvedQuestions item in sol)
                    {
                        if (item.rowNo == rowNo)
                        {
                            rblQstList.SelectedIndex = item.selectedOption;
                        }
                    }
                }

            }


        }
      
        //Click on Next Button...!
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            TotalMarks = Convert.ToInt32(ViewState["TotalMarks"].ToString());
            rowNo = Convert.ToInt32(ViewState["rowNo"].ToString());
            int qcount = Convert.ToInt32(ViewState["Q_Count"]);
            storeSelectedOptions = (List<SolvedQuestions>)Session["storeSelectedOptions"];
            if (rowNo <= qcount)
            {
                RadioButtonList rblQstList = (RadioButtonList)e.Item.FindControl("rblQstList");
                rowNo = Convert.ToInt32(ViewState["rowNo"].ToString());
                ans = ViewState["ans"].ToString();

                if (rblQstList.SelectedIndex == -1)
                {
                    if (ViewState["UnSolvIndex"] != null)
                    {
                        List<int> list = new List<int>();
                        list = (List<int>)ViewState["UnSolvIndex"];
                        UnSolvIndex.AddRange(list);
                    }
                    UnSolvIndex.Add(rowNo);
                    ViewState["UnSolvIndex"] = UnSolvIndex;
                }
                else
                {
                    ansStatus = false;
                   
                    if (Session["storeSelectedOptions"] != null)
                    {
                        Temp = (List<SolvedQuestions>)Session["storeSelectedOptions"];
                        var sol = (from tab in Temp where tab.rowNo == rowNo orderby tab.rowNo select tab).Distinct();

                        if (sol.ToList<SolvedQuestions>().Count > 0)
                        {
                            foreach (SolvedQuestions item in sol.Distinct())
                            {
                                if (item.rowNo == rowNo && item.selectedOption != rblQstList.SelectedIndex && item.ansStatus == true)
                                {
                                    if (TotalMarks > 0)
                                    {
                                        if (item.rowNo == rowNo)
                                        {
                                            addStatus = true;
                                            TotalMarks -= marks;
                                            index = Temp.IndexOf(item);
                                            Temp.RemoveAt(index);
                                            Session["storeSelectedOptions"] = Temp;
                                            ansStatus = false;
                                        }
                                    }
                                    break;
                                }
                                else if (item.rowNo == rowNo && item.selectedOption == rblQstList.SelectedIndex && item.ansStatus == true)
                                {
                                    addStatus = true;
                                    TotalMarks += 0;
                                    ansStatus = true;

                                }
                                else
                                    addStatus = false;
                            }
                        }
                    }
                    if (rblQstList.SelectedValue == ans && addStatus == false)
                    {
                        ansStatus = true;
                        TotalMarks += marks;

                    }

                    if (UnSolvIndex.Contains(rowNo))
                    {
                        UnSolvIndex.Remove(rowNo);
                        ViewState["UnSolvIndex"] = UnSolvIndex;
                    }
                    if (ViewState["SolvIndex"] != null)
                    {
                        List<int> list = new List<int>();
                        list = (List<int>)ViewState["SolvIndex"];
                        SolvIndex.AddRange(list);
                    }

                    SolvIndex.Add(rowNo);
                    ViewState["SolvIndex"] = SolvIndex;

                }
                if (Session["storeSelectedOptions"] == null)
                {
                    storeSelectedOptionsNotNull(rblQstList);
                }
                else
                {
                    Temp = (List<SolvedQuestions>)Session["storeSelectedOptions"];

                    obj.rowNo = rowNo;
                    obj.selectedOption = rblQstList.SelectedIndex;
                    obj.ansStatus = ansStatus;
                    Temp.Add(obj);
                    Session["storeSelectedOptions"] = Temp;
                }   

                rowNo += 1;
                if (rowNo > qcount)
                {
                     rowNo = qcount;

                }

                ViewState["TotalMarks"] = TotalMarks;
                ViewState["rowNo"] = rowNo;
               loadQuestions();
               Label1.Text = "When You will Solve all Questions then click on 'Submit Test' button to Save your Answers!";
                

            }
        }

        //Add Selected Options Into storeSelectedOptions Session to Calculate Answer....!
        private void storeSelectedOptionsNotNull(RadioButtonList rblQstList)
        {
            obj.rowNo = rowNo;
            obj.selectedOption = rblQstList.SelectedIndex;
            obj.ansStatus = ansStatus;
            Temp.Add(obj);
            Session["storeSelectedOptions"] = Temp;
        }

        //Add Colors to the Solve Or Unsolve Que.No Buttons...!
        protected void lvIndexOfQ_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            int qcount = Convert.ToInt32(ViewState["Q_Count"]);
            rowNo = Convert.ToInt32(ViewState["rowNo"].ToString());
            if (rowNo <= qcount)
            {
                string rowNom = rowNo.ToString();
                Button btnIndexOfQ = (Button)e.Item.FindControl("btnIndexOfQ");
                int index = Convert.ToInt32(btnIndexOfQ.Text);
                if (ViewState["UnSolvIndex"] != null)
                {
                    List<int> listUnSolve = new List<int>();
                    listUnSolve = (List<int>)ViewState["UnSolvIndex"];
                    foreach (int no in listUnSolve)
                    {
                        if (no == index)
                            btnIndexOfQ.BackColor = Color.Red;
                    }
                }
                if (ViewState["SolvIndex"] != null)
                {
                    List<int> listSolve = new List<int>();
                    listSolve = (List<int>)ViewState["SolvIndex"];
                    foreach (int no in listSolve)
                    {
                        if (no == index)
                        {
                            btnIndexOfQ.BackColor = Color.Green;
                        }
                    }

                }
            }
        }

        //Change Question No Based On Selected Que.No....!
        protected void lvIndexOfQ_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataList1.Enabled = true;
            rowNo = lvIndexOfQ.SelectedIndex + 1;
            ViewState["rowNo"] = rowNo;
            loadQuestions();
        }

        //Just For Exception Handeling if we don't define this it Will Thows an Error...!
        protected void lvIndexOfQ_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {

        }

      //Exam Time Counter CountDown
        protected void Timer2_Tick(object sender, EventArgs e)
        {
            if (ViewState["sec"] == null)
            {
                sec -= 1;
                ViewState["sec"] = sec;
                ViewState["min"] = min;
                lblClock.Text = min + ":" + sec;
            }
            else
            {
                sec = (Int32)ViewState["sec"];
                min =(Int32) ViewState["min"];
                if (sec > 0)
                    sec -= 1;
                else
                {
                    if (sec == 0)
                    {
                        if (min == 1 && sec==0)
                            OneMinWarning.Show();
                        if (min == 5 && sec==0)
                            FiveMinWarning.Show();
                        if (min == 0 && sec == 0)
                            Response.Redirect("~/frmExamCompleted.aspx");
                        else
                        {
                            sec = 59;
                            min -= 1;

                        }
                    }
                    
                 }
                
                if (sec < 10 || min < 10)
                {
                    if (sec < 10)
                        strsec = "0";
                    if (min < 10)
                        strmin = "0";
                }
                      
                    strmin += min.ToString();
                    strsec += sec.ToString();
                    ViewState["sec"] = sec;
                ViewState["min"] = min;
                lblClock.Text = strmin + ":" + strsec;
            }
           
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            GetSummeryOfQuestions();
            ShowAllQuestionSummery.Show();
            
          
        }
        protected void btnHiddden_Click(object sender, EventArgs e)
        {
            callDataList_ItemCommand();
        }
        private void callDataList_ItemCommand()
        { 
            object source=new object();
            DataListCommandEventArgs e = null;
        DataList1_ItemCommand(source,e);
        }

        private void GetSummeryOfQuestions() 
        {
            int unsolveCount = 0, SolveCount = 0, UnAttempt = 0;
            List<int> unsolve = (List<int>)ViewState["UnSolvIndex"];
            List<int> solve = (List<int>)ViewState["SolvIndex"];
            try
            {
                for (int a = 0; a < unsolve.Count; a++)
                {
                    for (int b = 0; b < solve.Count; b++)
                    {
                        unsolve[a].CompareTo(solve[b]);
                        if (unsolve[a] == solve[b])
                        {
                            unsolve.Remove(solve[b]);
                        }

                    }
                }
           
            unsolveCount = unsolve.Count;
            SolveCount = solve.Count;
            UnAttempt = queCount - (unsolveCount + SolveCount);
            btnSUnsolve.Text = unsolveCount.ToString();
            btnSsolve.Text = SolveCount.ToString();
            btnSUnAttempted.Text = UnAttempt.ToString();
            }
            catch (Exception e)
            { }
        }

        protected void btnSaveTest_Click(object sender, EventArgs e)
        {
            string time = "00:" + lblClock.Text;
            TotalMarks = Convert.ToInt32(ViewState["TotalMarks"].ToString());
            examid = Convert.ToInt32(Session["examid"].ToString());
            stud_id = Convert.ToInt32(Session["stud_id"].ToString());
            int count = db.Storeresult(examid, stud_id, time, TotalMarks);
            Session["StudentResult"] = " You score " + TotalMarks + " out of " + queCount * marks;
            if (count > 0)
                Response.Redirect("~/frmExamCompleted.aspx");
        }
    }
}