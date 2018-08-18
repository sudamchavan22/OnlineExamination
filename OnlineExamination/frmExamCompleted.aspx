<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmExamCompleted.aspx.cs" Inherits="OnlineExamination.frmExamComplited" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style5 {
            color: #009900;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div style="background-color: #fff;text-align:center;margin-left:23%;margin-right:20%;width:731px" >
    <table align="center" class="auto-style1" style="border-style: solid;">
        <tr><th><h1 align="center" class="auto-style5">Exam Completed...!</h1>
            
                        </th></tr>
        <tr><td><hr /><h2>Congratulations you have successuly completed test..</h2>
            <h3><asp:Label runat="server" ID="lblResult"></asp:Label></h3>
            </td></tr>
          <tr align="center"><td style="vertical-align: top; text-align: left; font-size: 18px; font-weight: normal;">
            <hr />
            </td></tr>
        <tr><td>
           
            <asp:Button ID="txtNext" runat="server" Text="Next Candidate" CssClass="btn-lg" PostBackUrl="~/index.aspx" />
            </td></tr>

                       </table>
    </div>
    </form>
</body>
</html>
