<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmUpdateQuestions.aspx.cs" Inherits="OnlineExamination.frmUpdateQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style6 {
        width: 100%;
    }
    .auto-style7 {
            text-align: right;
            width: 101px;
        }
    .auto-style8 {
            width: 101px;
        }
    .auto-style10 {
        width: 101px;
        height: 23px;
    }
    .auto-style12 {
        height: 23px;
    }
        .auto-style13 {
            text-align: right;
            width: 5px;
        }
        .auto-style14 {
            text-align: right;
            height: 23px;
            width: 5px;
        }
        .auto-style17 {
        }
        .auto-style18 {
            height: 23px;
            width: 351px;
        }
        .auto-style19 {
            text-align: right;
            width: 34px;
        }
        .auto-style20 {
            text-align: right;
            height: 23px;
            width: 34px;
        }
        .auto-style21 {}
        .auto-style22 {}
        .auto-style23 {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1>Update Questions</h1>
    <hr />
<table class="auto-style6">
    <tr>
        <td class="auto-style7" style="vertical-align: top">Question No:-</td>
        <td colspan="4" style="vertical-align: top"> 
            <asp:TextBox ID="txtQno" runat="server" TextMode="Number" CssClass="auto-style22" Height="20px" Width="70px"></asp:TextBox>
        &nbsp;<asp:Button ID="Button1" runat="server" CssClass="btn-lg" Height="25px" Text="search" Width="75px" ValidationGroup="Search" />
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtQno" ForeColor="red" ValidationGroup="Search" runat="server" Display="Dynamic" ErrorMessage="Enter Question No."></asp:RequiredFieldValidator>
        </td>
    </tr>
    </table>
<asp:Panel ID="pnlUpdate" runat="server" Visible="false">
        <table class="auto-style6">
    <tr>
        <td class="auto-style7" style="vertical-align: top">&nbsp;</td>
        <td colspan="4" style="vertical-align: top"> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtQuestion" Display="Dynamic" ErrorMessage="Enter Question" ForeColor="red" ValidationGroup="updateQuestion"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style7" style="vertical-align: top">Question :- </td>
        <td colspan="4" style="vertical-align: top"> <asp:TextBox ID="txtQuestion" TextMode="MultiLine" Width="100%" runat="server" CssClass="auto-style21" Height="49px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style13">&nbsp;</td>
        <td class="auto-style17">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOpt1" Display="Dynamic" ErrorMessage="Enter option 1st" ForeColor="red" ValidationGroup="updateQuestion"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style19">&nbsp;</td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtOpt2" Display="Dynamic" ErrorMessage="Enter option 2nd" ForeColor="red" ValidationGroup="updateQuestion"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style14">a)</td>
        <td class="auto-style18">
            <asp:TextBox ID="txtOpt1" runat="server" CssClass="txtControl"></asp:TextBox>
        </td>
        <td class="auto-style20">b)</td>
        <td class="auto-style12">
            <asp:TextBox ID="txtOpt2" runat="server" CssClass="txtControl"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style13">&nbsp;</td>
        <td class="auto-style17">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtOpt3" Display="Dynamic" ErrorMessage="Enter option 3rd" ForeColor="red" ValidationGroup="updateQuestion"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style19">&nbsp;</td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtOpt4" Display="Dynamic" ErrorMessage="Enter option 4th" ForeColor="red" ValidationGroup="updateQuestion"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style13">c)</td>
        <td class="auto-style17">
            <asp:TextBox ID="txtOpt3" runat="server" CssClass="txtControl"></asp:TextBox>
        </td>
        <td class="auto-style19">d)</td>
        <td>
            <asp:TextBox ID="txtOpt4" runat="server" CssClass="txtControl"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style13">&nbsp;</td>
        <td class="auto-style17">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="rblAnswer" Display="Dynamic" ErrorMessage="Select Answer for this Question" ForeColor="red" ValidationGroup="updateQuestion"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style19">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style10"></td>
        <td class="auto-style14"></td>
        <td class="auto-style12" colspan="3"><strong class="auto-style22">Select Answer</strong></td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style13">&nbsp;</td>
        <td class="auto-style17" colspan="3">
            <asp:RadioButtonList ID="rblAnswer" runat="server" CellPadding="5" CellSpacing="5" CssClass="auto-style23" RepeatDirection="Horizontal" Width="243px">
                <asp:ListItem Value="a">a)</asp:ListItem>
                <asp:ListItem Value="b">b)</asp:ListItem>
                <asp:ListItem Value="c">c)</asp:ListItem>
                <asp:ListItem Value="d">d)</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lblSelcetedAns" CssClass="menu" runat="server" Text="Selected Answer :- " ForeColor="Red" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style13">&nbsp;</td>
        <td class="auto-style17" colspan="3">
            <asp:Button ID="btnUpdate" runat="server" CssClass="btn-lg" Height="45px" Text="Update" Width="162px" ValidationGroup="updateQuestion" />
        </td>
    </tr>
</table>
    </asp:Panel>
    <br />
</asp:Content>
