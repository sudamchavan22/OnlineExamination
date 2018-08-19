<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintResult.aspx.cs" Inherits="OnlineExamination.PrintResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style2 {
            height: -12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="lbtnPrintUp" runat="server" OnClientClick="javascript:window.print();">Print</asp:LinkButton>
        <br />
        <div align="center">
            <hr class="auto-style2" /> 
            <h2>Result of&nbsp; Online Exam held on&nbsp;
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </h2>
            <hr class="auto-style1" />
        </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="20" CellSpacing="10" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
           <Columns>
               <asp:TemplateField>
                   <HeaderTemplate>
                       <table style="width:100%;border:4px;">
                           <tr>
                               <th>SR. NO.</th>
                               <th>Cadidate Name</th>
                               <th>Email Address</th>
                               <th>Time left </th>
                               <th>Score</th>
                           </tr>
                           <tr>
                           <td colspan="5"><hr /></td>
                       </tr>
                   </HeaderTemplate>
                   <ItemTemplate>
                       <tr>
                            <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("RowNum") %>' /></td>
                           <td><asp:Label ID="lblname" runat="server" Text='<%# Eval("name") %>' /></td>
                           <td><asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>' /></td>
                           <td><asp:Label ID="lbltime" runat="server" Text='<%# Eval("solved_time") %>' /></td>
                           <td><asp:Label ID="lblans" runat="server" Text='<%# Eval("ans") %>' /></td>
                       </tr>
                       <tr>
                           <td colspan="5"><hr /></td>
                       </tr>
                   </ItemTemplate>
                   <FooterTemplate>
                       </table>
                   </FooterTemplate>
               </asp:TemplateField>
           </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
