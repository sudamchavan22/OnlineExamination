<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmResult.aspx.cs" Inherits="OnlineExamination.frmResult" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 100%;
        }
    .auto-style7 {
        text-align: right;
        width: 98px;
            height: 40px;
        }
    .auto-style8 {
        text-align: right;
        width: 273px;
            height: 40px;
        }
    .auto-style9 {
        width: 129px;
            height: 40px;
        }
    .auto-style10 {
        width: 135px;
            height: 40px;
        }
        .auto-style11 {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <h1>View Result by entering Exam Date and setting Criteria</h1><hr />
    
    <table class="auto-style6">
        <tr>
            <td class="auto-style8">Exam Date :- </td>
            <td class="auto-style9"> <asp:TextBox ID="txtdate" runat="server" CssClass="formControl"/> <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtdate"> </asp:CalendarExtender></td>
            <td class="auto-style7">Criteria (%) :-</td>
            <td class="auto-style10"><asp:TextBox ID="txtCriteria" TextMode="Number" runat="server" CssClass="formControl">60</asp:TextBox>
            </td>
            <td class="auto-style11">
                <asp:Button ID="btnResult" runat="server" CssClass="btn-lg" Text="View Result" ValidationGroup="result" OnClick="btnResult_Click" />
            </td>
        </tr>
    </table>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdate" Display="Dynamic" ErrorMessage="Enter Date" ForeColor="red" ValidationGroup="result"></asp:RequiredFieldValidator>
    &nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic" MaximumValue="100" MinimumValue="1" ValidationGroup="result" ControlToValidate="txtCriteria" ForeColor="Red" ErrorMessage="Criteria set should be within the 1-100 only" Type="Integer"></asp:RangeValidator>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="examid" ForeColor="Black" GridLines="Vertical" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField HeaderText="Sr. No" DataField="RowNum"/>
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lbldate" runat="server" Text='<%#Eval("date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Exam Start Time" DataField="start_time"/>
            <asp:BoundField HeaderText="Exam End Time" DataField="end_time"/>
           
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
        </Columns>
        <EmptyDataTemplate>
            Record Not Found!
        </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />
</asp:Content>
