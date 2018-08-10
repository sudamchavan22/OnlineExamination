<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmInstructions.aspx.cs" Inherits="OnlineExamination.frmInstructions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/design.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 731px;
            margin-left: 0px;
        }
        .auto-style5 {
            margin-bottom: 0px;
        }
        .auto-style6 {
            color: #FF0000;
        }
    </style>
</head>
<body style="background-image: url('http://localhost:52109/images/max.jpg');background-size:cover;">
    <form id="form1" runat="server">
    <div style="background-color: #fff;text-align:center;margin-left:23%;margin-right:20%;width:731px" >
    <table align="center" class="auto-style1" style="border-style: solid;">
        <tr><th><h1 align="center" class="auto-style5">Instructions/Information</h1>
            (<span class="auto-style6">Read instructions cearfully.</span>)
                        </th></tr>
        <tr><td><hr /></td></tr>
        <tr align="center"><td style="vertical-align: top; text-align: left; font-size: 18px; font-weight: normal;">
            <asp:BulletedList ID="BulletedList1" runat="server">
            </asp:BulletedList>
            </td></tr>
        <tr align="center"><td style="vertical-align: top; text-align: left; font-size: 18px; font-weight: normal;">
            <hr />
            </td></tr>
        <tr><td>
            <asp:Button ID="Button1" runat="server" Text="Start Test" CssClass="btn-lg" OnClick="Button1_Click" />
            </td></tr>

                       </table>
    </div>
    </form>
</body>
</html>
