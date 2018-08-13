using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace OnlineExamination
{
    public class DBConnection
    {
        public string ConnState
        {
            get { return ConfigurationManager.ConnectionStrings["OnlineExaminationDB"].ConnectionString; }
            //modified by sudam chavan
        }

    }
}