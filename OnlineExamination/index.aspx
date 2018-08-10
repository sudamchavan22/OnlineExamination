<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OnlineExamination.index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/design.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 8px;
        }
         .auto-style5 {
            height: 24px;
        }
         </style>
</head>
<body style="background-image: url('http://localhost:52109/images/max.jpg');background-size:cover;">
    <form id="form1" runat="server" >
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
         <div class="menu">
        <asp:LinkButton ID="lbtnLogin" runat="server" style="float:right;vertical-align:top" Height="20px" OnClick="lbtnLogin_Click">LogIn</asp:LinkButton>
    </div>
        <asp:UpdatePanel runat="server" ID="pnlClock" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" >
        </asp:Timer>
        <h1 style="color:#b6ff00">Clock : <asp:Label runat="server" ID="lblClock" /></h1>
        </ContentTemplate>
        </asp:UpdatePanel>
        
        <div align="center">
        
        <div align="center" style="text-align:center; vertical-align:middle; width: 399px;height:400px;" class="radius">
                <h1 style="color:#0026ff">Exam on <asp:Label runat="server" ID="lblDate" /><br />
                Start Time: <asp:Label runat="server" Text="" ID="lblST" />  &nbsp;End Time : <asp:Label runat="server" ID="lblET" />
                <asp:HiddenField ID="hfexamid" runat="server" />
                     </h1>
       <br />
         <h2>Enter Your Information Here!</h2>
        <hr />
        <br />
    <table align="center" style="font-size: large">
        <tr>
            <td>Name</td><td><asp:TextBox ID="txtName" runat="server" CssClass="formControl"  /></td>
                </tr>
        <tr><td class="auto-style1" colspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName" ErrorMessage="Enter Your Name" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Email ID</td><td><asp:TextBox ID="txtEmail" runat="server" CssClass="formControl"/></td></tr>
        <tr><td class="auto-style5" colspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ControlToValidate="txtEmail" ErrorMessage="EnterEmail ID." ForeColor="Red" ValidationGroup="Register">
               </asp:RequiredFieldValidator> <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Register" runat="server" ErrorMessage="invalied Email ID"></asp:RegularExpressionValidator>
            
            </td></tr>
    </table>
        <br />
        <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="Register" Enabled="False" />
    </div>
        </div>
      
        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="LoginPopup" TargetControlID="lbtnLogin"
            CancelControlID="lbtnCancel"></asp:ModalPopupExtender>
          
        <div id="LoginPopup" align="center" style="text-align:center; vertical-align:middle; width: 399px;height:300px;" class="login radius">
       <br />
         <h1 style="color:#0026ff">Examinar Login!</h1>
        <hr />
        <br />
            
             <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ClientIDMode="Predictable" RenderMode="Inline">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnLogin"  EventName="click"/>
            </Triggers>
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                 </ContentTemplate>
        </asp:UpdatePanel>
            <div align="center" style="width:100%">
    <table align="center" style="font-size: large">
        <tr>
            <td>User ID</td><td><asp:TextBox ID="txtUserID" runat="server" CssClass="formControl" /></td>
                </tr><tr><td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUserID" ForeColor="Red" ValidationGroup="Login" runat="server" ErrorMessage="Enter User ID."></asp:RequiredFieldValidator></td></tr>
        <tr><td class="auto-style1"></td><td class="auto-style1"></td></tr>
        <tr><td>Password</td><td><asp:TextBox ID="txtPwd" TextMode="Password" runat="server" CssClass="formControl" /></td></tr>
       <tr><td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPwd" ForeColor="Red" ValidationGroup="Login" runat="server" ErrorMessage="Enter Password."></asp:RequiredFieldValidator></td></tr>
    </table>

        <br />
       
                    
             <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="LogIn" ValidationGroup="Login" OnClick="btnLogin_Click"/>
             <asp:LinkButton ID="lbtnCancel" runat="server" CssClass="btn" style="position:absolute;right:10px;padding:5px;margin-bottom:5px;">Cancel</asp:LinkButton>
               </div>
    </div>
    </form>
    




</body>
</html>
