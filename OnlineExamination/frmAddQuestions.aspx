<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmAddQuestions.aspx.cs" Inherits="OnlineExamination.frmAddQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style6 {
        width: 100%;
    }
    .auto-style7 {
        text-align: right;
        width: 85px;
    }
    .auto-style8 {
        width: 85px;
    }
    .auto-style10 {
        width: 85px;
        height: 23px;
    }
    .auto-style12 {
        height: 23px;
            text-align: left;
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
    .auto-style17 {            text-align: left;
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
        .auto-style22 {
            text-align: left;
        }
        .auto-style23 {}
        .auto-style24 {
            text-align: right;
            width: 85px;
            height: 35px;
        }
        .auto-style25 {
            height: 35px;
        }
    .auto-style26 {
        width: 85px;
        height: 34px;
    }
    .auto-style27 {
        text-align: right;
        width: 5px;
        height: 34px;
    }
    .auto-style28 {
        text-align: left;
        height: 34px;
    }
    .auto-style29 {
        text-align: right;
        width: 34px;
        height: 34px;
    }
    .auto-style30 {
        height: 34px;
    }
    .auto-style32 {
        height: 23px;
    }
    .auto-style33 {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Questions</h1>
    <hr />
    <br />
        <table class="auto-style6" __designer:mapid="4cd">
              <tr __designer:mapid="4ce">
        <td class="auto-style24" style="vertical-align: top" __designer:mapid="4cf"><strong>Class </strong>:- </td>
        <td colspan="4" style="vertical-align: top" __designer:mapid="4d0" class="auto-style32"> 

            <asp:DropDownList ID="lstClass" AutoPostBack="true" OnSelectedIndexChanged="lstClass_SelectedIndexChanged" runat="server" CssClass="auto-style33" Height="35px" Width="265px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="Select Subject first." ForeColor="red" ValidationGroup="AddQuestion" InitialValue="--Select Subject--"></asp:RequiredFieldValidator>
        </td>
        <td style="vertical-align: top" __designer:mapid="4d0" class="auto-style32"> 
            </td>
    </tr>
    <tr __designer:mapid="4ce">
        <td class="auto-style24" style="vertical-align: top" __designer:mapid="4cf"><strong>Subject </strong>:- </td>
        <td colspan="4" style="vertical-align: top" __designer:mapid="4d0" class="auto-style32"> 

            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style33" Height="35px" Width="265px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="Select Subject first." ForeColor="red" ValidationGroup="AddQuestion" InitialValue="--Select Subject--"></asp:RequiredFieldValidator>
        </td>
        <td style="vertical-align: top" __designer:mapid="4d0" class="auto-style32"> 
            </td>
    </tr>
    <tr __designer:mapid="4ce">
        <td class="auto-style7" style="vertical-align: top" __designer:mapid="4cf">&nbsp;</td>
        <td colspan="4" style="vertical-align: top" __designer:mapid="4d0"> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtQuestion" Display="Dynamic" ErrorMessage="Enter Question" ForeColor="red" ValidationGroup="AddQuestion"></asp:RequiredFieldValidator>
        </td>
        <td style="vertical-align: top" __designer:mapid="4d0"> 
            &nbsp;</td>
    </tr>
    <tr __designer:mapid="4d2">
        <td class="auto-style24" style="vertical-align: top" __designer:mapid="4d3"><strong>Question :- </strong> </td>
        <td colspan="4" style="vertical-align: top" __designer:mapid="4d4" class="auto-style25"> <asp:TextBox ID="txtQuestion" TextMode="MultiLine" Width="64%" runat="server" CssClass="formControl" Height="38px"></asp:TextBox>
        </td>
        <td style="vertical-align: top" __designer:mapid="4d4" class="auto-style25"> </td>
    </tr>
    <tr __designer:mapid="4d6">
        <td class="auto-style8" __designer:mapid="4d7">&nbsp;</td>
        <td class="auto-style13" __designer:mapid="4d8">&nbsp;</td>
        <td class="auto-style17" __designer:mapid="4d9">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOpt1" Display="Dynamic" ErrorMessage="Enter option 1st" ForeColor="red" ValidationGroup="AddQuestion"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style19" __designer:mapid="4db">&nbsp;</td>
        <td __designer:mapid="4dc" class="auto-style17">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtOpt2" Display="Dynamic" ErrorMessage="Enter option 2nd" ForeColor="red" ValidationGroup="AddQuestion"></asp:RequiredFieldValidator>
        </td>
        <td __designer:mapid="4dc">
            &nbsp;</td>
    </tr>
    <tr __designer:mapid="4de">
        <td class="auto-style10" __designer:mapid="4df"></td>
        <td class="auto-style14" __designer:mapid="4e0">a)</td>
        <td class="auto-style18" __designer:mapid="4e1">
            <asp:TextBox ID="txtOpt1" runat="server" CssClass="formControl" Height="24px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td class="auto-style20" __designer:mapid="4e3">b)</td>
        <td class="auto-style17" __designer:mapid="4e4">
            <asp:TextBox ID="txtOpt2" runat="server" CssClass="formControl" Height="23px" Width="350px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td class="auto-style12" __designer:mapid="4e4">
        </td>
    </tr>
    <tr __designer:mapid="4e6">
        <td class="auto-style8" __designer:mapid="4e7">&nbsp;</td>
        <td class="auto-style13" __designer:mapid="4e8">&nbsp;</td>
        <td class="auto-style17" __designer:mapid="4e9">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtOpt3" Display="Dynamic" ErrorMessage="Enter option 3rd" ForeColor="red" ValidationGroup="AddQuestion"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style19" __designer:mapid="4eb">&nbsp;</td>
        <td __designer:mapid="4ec" class="auto-style17">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtOpt4" Display="Dynamic" ErrorMessage="Enter option 4th" ForeColor="red" ValidationGroup="AddQuestion"></asp:RequiredFieldValidator>
        </td>
        <td __designer:mapid="4ec">
            &nbsp;</td>
    </tr>
    <tr __designer:mapid="4ee">
        <td class="auto-style26" __designer:mapid="4ef"></td>
        <td class="auto-style27" __designer:mapid="4f0">c)</td>
        <td class="auto-style28" __designer:mapid="4f1">
            <asp:TextBox ID="txtOpt3" runat="server" CssClass="formControl" Height="24px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td class="auto-style29" __designer:mapid="4f3">d)</td>
        <td __designer:mapid="4f4" class="auto-style28">
            <asp:TextBox ID="txtOpt4" runat="server" CssClass="formControl" Height="24px" Width="350px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td __designer:mapid="4f4" class="auto-style30">
            </td>
    </tr>
    <tr __designer:mapid="4f6">
        <td class="auto-style8" __designer:mapid="4f7">&nbsp;</td>
        <td class="auto-style13" __designer:mapid="4f8">&nbsp;</td>
        <td class="auto-style17" __designer:mapid="4f9">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="rblAnswer" Display="Dynamic" ErrorMessage="Select Answer for this Question" ForeColor="red" ValidationGroup="AddQuestion"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style19" __designer:mapid="4fb">&nbsp;</td>
        <td __designer:mapid="4fc" class="auto-style17">&nbsp;</td>
        <td __designer:mapid="4fc">&nbsp;</td>
    </tr>
    <tr __designer:mapid="4fd">
        <td class="auto-style10" __designer:mapid="4fe"></td>
        <td class="auto-style14" __designer:mapid="4ff"></td>
        <td class="auto-style12" colspan="3" __designer:mapid="500"><strong class="auto-style22" __designer:mapid="501">Select Answer</strong></td>
        <td class="auto-style12" __designer:mapid="500">&nbsp;</td>
    </tr>
    <tr __designer:mapid="502">
        <td class="auto-style8" __designer:mapid="503">&nbsp;</td>
        <td class="auto-style13" __designer:mapid="504">&nbsp;</td>
        <td class="auto-style17" colspan="3" __designer:mapid="505">
            <asp:RadioButtonList ID="rblAnswer" runat="server" CellPadding="5" CellSpacing="5" CssClass="auto-style23" RepeatDirection="Horizontal" Width="243px">
                <asp:ListItem Value="a">a)</asp:ListItem>
                <asp:ListItem Value="b">b)</asp:ListItem>
                <asp:ListItem Value="c">c)</asp:ListItem>
                <asp:ListItem Value="d">d)</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lblSelcetedAns" CssClass="menu" runat="server" Text="Selected Answer :- " ForeColor="Red" Visible="False"></asp:Label>
        </td>
        <td class="auto-style17" __designer:mapid="505">
            &nbsp;</td>
    </tr>
    <tr __designer:mapid="50c">
        <td class="auto-style8" __designer:mapid="50d">&nbsp;</td>
        <td class="auto-style13" __designer:mapid="50e">&nbsp;</td>
        <td class="auto-style17" colspan="3" __designer:mapid="50f">
            <asp:Button ID="Button1" runat="server" CssClass="btn-lg" Height="45px" Text="Add Question" Width="162px" ValidationGroup="AddQuestion" OnClick="Button1_Click" />
        &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="btn-lg" Height="45px" Text="Update" Width="162px" ValidationGroup="AddQuestion" OnClick="btnUpdate_Click" Visible="False" />
        &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="btn-lg" Height="45px" Text="Cancel" Width="162px" OnClick="btnCancel_Click" />
        </td>
        <td class="auto-style17" __designer:mapid="50f">
            &nbsp;</td>
    </tr>
</table>
    <hr />
    Get Records filtred By Subject : 
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style33" Height="35px" Width="265px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
    <hr />
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="100%" Font-Size="20px" DataKeyNames="q_id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:TemplateField>
  <ItemTemplate><asp:Label ID="lblID" runat="server" Text='<%#Eval("q_id")%>' Visible="false"/></ItemTemplate>
                         </asp:TemplateField>
            <asp:BoundField DataField="Q_Number" HeaderText="Sr. No." />
            <asp:BoundField DataField="question" HeaderText="Questions" />
            <asp:BoundField DataField="opt_1" HeaderText="Option 1st" />
            <asp:BoundField DataField="opt_2" HeaderText="Option 2nd" />
            <asp:BoundField DataField="opt_3" HeaderText="Option 3rd" />
            <asp:BoundField DataField="opt_4" HeaderText="Option 4th" />
            <asp:BoundField DataField="ans" HeaderText="Answer" />
                       <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="lbtnSelect" runat="server" Height="30px" CommandName="Select" Text="Select" />
                    <asp:Button ID="lbtnRemove" runat="server" Height="30px" CommandName="Delete" OnClientClick="return confirm('are you sure to remove this Question?')" Text="Remove" />
                 </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            Questions Not Found!
        </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    </asp:Content>
