using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace OnlineExamination
{
    public partial class frmInstructions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XElement doc = XElement.Load(Server.MapPath("Instructions.xml"));
            var instructions = doc.Elements("Instructions");
            var ds = from s in instructions select new { Instruction = s.Element("Instruction").Value };
            BulletedList1.DataSource = ds;
            BulletedList1.DataTextField = "Instruction";
            BulletedList1.DataValueField = "Instruction";
            BulletedList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), null, "window.open('frmTest.aspx', '_self')", true);
        }
    }
}