<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmSubjects.aspx.cs" Inherits="OnlineExamination.frmSubjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
        }

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
    
     
    
     <asp:radiobuttonlist id="rblOptions" runat="server" autopostback="True" onselectedindexchanged="rblOptions_SelectedIndexChanged" cellpadding="10" cssclass="auto-style6" repeatdirection="Horizontal" width="48%" height="36px">
                <asp:ListItem Selected="True">Add Class</asp:ListItem>
                <asp:ListItem>Add Subject</asp:ListItem>
            </asp:radiobuttonlist>
    <asp:Panel runat="server" ID="pnlAddClass">
        <h1>Add Class</h1>
        Class Name : <asp:TextBox runat="server" ID="txtClassName"></asp:TextBox>
        <asp:Button runat="server" ID ="btnSaveClass" Text="Add Class" OnClick="btnSaveClass_Click"/>
        <hr />
        <asp:GridView runat="server" ID="gridClass" AutoGenerateColumns="False" OnRowCommand="gridClass_RowCommand">

            <Columns>
<%--              <asp:TemplateField HeaderText="Class Id" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="lblClassId" runat="server" Text='<%# Eval("classId") %>'></asp:Label>
            </ItemTemplate>
                  <ItemStyle Width="150px" />
                </asp:TemplateField>--%>
                 <asp:BoundField DataField="classID" HeaderText="Class Id" />
                <asp:BoundField DataField="className" HeaderText="Class Name" />
                <asp:ButtonField Text="Select" />
            </Columns>

        </asp:GridView>
        <asp:HiddenField ID="hfClassId" runat="server" />
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlAddSubject">
          <h2>Add New Subject</h2>
    
        Select Class : <asp:DropDownList ID="lstClass" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstClass_SelectedIndexChanged"></asp:DropDownList>
        &nbsp;<table class="auto-style7">
            <tr>
                <td class="auto-style8">Subject Name :-</td>
                <td>
                    <asp:textbox id="txtSubject" runat="server" height="24px" cssclass="auto-style6" width="330px"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" controltovalidate="txtSubject" errormessage="Can't be leave field  Empty." forecolor="Red" validationgroup="Subject"></asp:requiredfieldvalidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style10">
                    <asp:button id="Button1" runat="server" cssclass="btn-lg" onclick="Button1_Click" text="ADD" validationgroup="Subject" />
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
                    <asp:gridview id="gvSubjects" runat="server" backcolor="White" bordercolor="#CCCCCC" borderstyle="None" borderwidth="1px" cellpadding="4" forecolor="Black" gridlines="Horizontal">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:gridview>
                </td>
            </tr>
        </table>
    </asp:Panel>

   
   
   
</asp:Content>
