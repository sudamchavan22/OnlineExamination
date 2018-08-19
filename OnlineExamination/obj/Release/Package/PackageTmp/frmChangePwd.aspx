<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmChangePwd.aspx.cs" Inherits="OnlineExamination.frmChangePwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 396px;
            margin-left: 170px;
            background-color: #FFFFFF;
            border-radius:20px;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            text-align: left;
        }
        .auto-style9 {
            text-align: left;
            width: 122px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Change Password</h1>
    <hr />
    <div class="auto-style6">

        <h3 class="auto-style7">Enter New Password</h3>
            <table class="txtControl">
                <tr>
                    <td class="auto-style9">New Password</td>
                    <td>
                        <asp:TextBox ID="txtNewPwd" runat="server" CssClass="formControl" BorderStyle="NotSet" TextMode="Password"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td><asp:RequiredFieldValidator ID="RequiredPwd" ControlToValidate="txtNewPwd" ForeColor="Red" runat="server" ErrorMessage="Enter Password" ValidationGroup="changePwd"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="auto-style9">Confirm Password</td>
                    <td>
                        <asp:TextBox ID="txtConfirmPwd" runat="server" CssClass="formControl" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td> <asp:RequiredFieldValidator ID="RequiredConfirmPwd" ValidationGroup="changePwd" ControlToValidate="txtConfirmPwd" ForeColor="Red" runat="server" ErrorMessage="Enter Confirm Password" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password doen't Match" Display="Dynamic" ValidationGroup="changePwd" ForeColor="Red" ControlToCompare="txtNewPwd" ControlToValidate="txtConfirmPwd"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center" colspan="2">
                        <asp:Button ID="btnChangePwd" ValidationGroup="changePwd" runat="server" CssClass="btn-lg" Text="Change" OnClick="btnChangePwd_Click" />
                    </td>
                </tr>
                </table>

    </div>
</asp:Content>
