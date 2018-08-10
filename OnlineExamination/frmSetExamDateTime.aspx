<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmSetExamDateTime.aspx.cs" Inherits="OnlineExamination.frmSetExamDateTime" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
          .auto-style6 {
            margin-left: 296px;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            margin-top: 0px;
        }
        .auto-style9 {
            margin-left: 296px;
        }
        .adjustWidth {
     width:auto;
     height:30px;
border-radius:10px;
}
        .auto-style10 {
            margin-bottom: 0px;
        }
        .auto-style11 {
            height: -12px;
        }
        .auto-style12 {
            width: 100%;
        }
        .auto-style13 {
            height: 30px;
            color: #FFFFFF;
            font-weight: 700;
            font-size: large;
            background-color: #6666FF;
        }
        .auto-style14 {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="auto-style7">
      <h2 style="margin-bottom: 2px">Set the Examination Date &amp; Time when the exam stert and end.</h2>
    <p style="text-align: center; margin-top: 0px">
        (<span class="auto-style14">Exam Start On time &amp; end after 1hour</span>.)</p>
    <div>
        <hr />
        <asp:RadioButtonList ID="rblOptions" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblOptions_SelectedIndexChanged" CellPadding="10" CssClass="auto-style6" RepeatDirection="Horizontal" Width="48%" Height="36px">
            <asp:ListItem Selected="True">Set New Exam</asp:ListItem>
            <asp:ListItem>Update Existing</asp:ListItem>
        </asp:RadioButtonList>
        <hr class="auto-style8" />
    </div>
    <asp:Panel ID="pnlNew" runat="server" style="text-align:center">
        <br />
 Exam Date :- <asp:TextBox ID="txtExamDate" runat="server" placeholder="Enter Date" CssClass="adjustWidth" />
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtExamDate">
            </asp:CalendarExtender>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtExamDate" Display="Dynamic" ErrorMessage="Enter Date" ForeColor="Red" ValidationGroup="new"></asp:RequiredFieldValidator>
    <br />
    <br />
    <span>Enter Start Time :- <asp:TextBox ID="txtStartTime" runat="server" TextMode="Time" placeholder="00:59 AM" CssClass="adjustWidth" /> &nbsp;&nbsp;&nbsp; Enter End Time :- <asp:TextBox ID="txtEndTime" runat="server" TextMode="Time" placeholder="00:59 AM" CssClass="adjustWidth" /> 
        <br />
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStartTime" Display="Dynamic" ErrorMessage="Enter start time" ForeColor="Red" ValidationGroup="new"></asp:RequiredFieldValidator>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEndTime" Display="Dynamic" ErrorMessage="Enter end time" ForeColor="Red" ValidationGroup="new"></asp:RequiredFieldValidator>
        <br />
        <br />
        </span>
        <asp:Button ID="btnSet" runat="server" CssClass="btn-lg" Text="Set" ValidationGroup="new" OnClick="btnSet_Click" />

        </asp:Panel>
        <asp:Panel ID="pnlUpdate" runat="server" style="text-align:center;">
        <br />
 Exam Date :- <asp:TextBox ID="txtUpdateExamD" runat="server" placeholder="Enter Date" CssClass="adjustWidth" />
            <asp:CalendarExtender ID="txtUpdateExamD_CalendarExtender" runat="server" TargetControlID="txtUpdateExamD">
            </asp:CalendarExtender>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUpdateExamD" Display="Dynamic" ErrorMessage="Enter Date" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator>
    <br />
    <br />
    <span>Enter Start Time :- <asp:TextBox ID="txtUpdateST" runat="server" TextMode="Time" placeholder="00:59 AM" CssClass="adjustWidth" /> &nbsp;&nbsp;&nbsp; Enter End Time :- <asp:TextBox ID="txtUpdateET" runat="server" TextMode="Time" placeholder="00:59 AM" CssClass="adjustWidth"   /> 
        <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtUpdateST" Display="Dynamic" ErrorMessage="Enter start time" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUpdateET" Display="Dynamic" ErrorMessage="Enter end time" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator>
            <br /> </span>
            <br />
        <asp:Button ID="btnUpdate" runat="server" CssClass="btn-lg" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="Update" />
            &nbsp;<asp:Button ID="btnUpdateCancel" runat="server" CssClass="btn-lg" Text="Cancel" />

        </asp:Panel>
        <br />
        <asp:Panel ID="Panel1" runat="server" style="text-align:center;">
            <h2 class="auto-style10">Select Subjects for Exam</h2>
            <hr class="auto-style11" />
            <table class="auto-style12">
                <tr>
                    <td class="auto-style13">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" CellPadding="5" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        <br />
                  <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Large" Width="80%" AutoGenerateColumns="False" CssClass="" DataKeyNames="examid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RowNum" HeaderText="Sr. No." />
                    <asp:BoundField DataField="date" HeaderText="Exam Date" />
                    <asp:BoundField DataField="start_time" HeaderText="Start Time" />
                    <asp:BoundField DataField="end_time" HeaderText="End Time" />
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:CommandField ButtonType="Button" DeleteText="Cancel Exam" ShowDeleteButton="True" />
                    <asp:TemplateField>
                     <ItemTemplate>
                <asp:Label Visible="false" ID="lblid" runat="server" Text='<%# Eval("examid") %>' style="text-align:center"/>
            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
                      <EmptyDataTemplate>
                          No Exams are scheduled.
                      </EmptyDataTemplate>
            </asp:GridView>
            <br />
        </asp:Panel>
        </div>
</asp:Content>
