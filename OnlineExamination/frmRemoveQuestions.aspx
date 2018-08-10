<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmRemoveQuestions.aspx.cs" Inherits="OnlineExamination.frmRemoveQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Remove Questions</h1>
    <hr />
    Enter Question No. :- <asp:TextBox ID="txtQno" runat="server" TextMode="Number" CssClass="auto-style22" Height="20px" Width="70px"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-lg" ValidationGroup="removeQuestion" />
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtQno" ForeColor="red" ValidationGroup="removeQuestion" runat="server" ErrorMessage="Enter Question No."></asp:RequiredFieldValidator>
    <br />
    <asp:GridView ID="GridView1" runat="server" Width="100%"></asp:GridView>
</asp:Content>
