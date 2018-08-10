<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmSubjects.aspx.cs" Inherits="OnlineExamination.frmSubjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style6 {}
    .auto-style7 {
        width: 100%;
    }
    .auto-style8 {
        width: 105px;
    }
    .auto-style9 {
        width: 105px;
        height: 23px;
    }
    .auto-style10 {
        height: 23px;
    }
    .auto-style11 {
        width: 105px;
        height: 22px;
    }
    .auto-style12 {
        height: 22px;
    }
    .auto-style13 {
        height: 23px;
        font-size: x-large;
        text-decoration: underline;
    }
    .auto-style14 {
        width: 105px;
        height: 23px;
        text-decoration: underline;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Add New Subject</h2>
    <p>
        &nbsp;<table class="auto-style7">
            <tr>
                <td class="auto-style8">Subject Name :-</td>
                <td>
            <asp:TextBox ID="txtSubject" runat="server" Height="24px" CssClass="auto-style6" Width="330px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject" ErrorMessage="Can't be leave field  Empty." ForeColor="Red" ValidationGroup="Subject"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style10">
                    <asp:Button ID="Button1" runat="server" CssClass="btn-lg" OnClick="Button1_Click" Text="ADD" ValidationGroup="Subject" />
                </td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style14"></td>
                <td class="auto-style13"><strong>Existing Subjects<br />
                    </strong>
                    <asp:GridView ID="gvSubjects" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        </p>
</asp:Content>
