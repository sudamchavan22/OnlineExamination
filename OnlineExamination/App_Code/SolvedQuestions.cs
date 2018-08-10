using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineExamination
{
    public class SolvedQuestions : MarshalByRefObject
    {
        public int rowNo { get; set; }
        public int selectedOption { get; set; }
        public bool ansStatus { get; set; }  
    }
}