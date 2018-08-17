using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineExamination
{
    public class Options
    {
        public string Text { get; set; }
        public string Value { get; set; }
        public int unSolvQ { get; set; }
        public int SolvQ { get; set; }
        //update this by ram
      }
    public class ClassDto {
        public int classId { get; set; }
        public string className { get; set; }
    }

    public class SubjectDto
    {
    public int subjectId { get; set; }
    public string subjectName { get; set; }

    }
}