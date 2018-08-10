<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckConnection.aspx.cs" Inherits="OnlineExamination.CheckConnection" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       Connection State <asp:Label ID="Label1" runat="server" Text="">
            <br />
        </asp:Label><asp:Button ID="btnTestConn" runat="server" Text="Test Connection" OnClick="btnTestConn_Click" />
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                     <asp:UpdatePanel runat="server" ID="pnlClock" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:Timer ID="Timer2" runat="server" Interval="1000" OnTick="Timer2_Tick" >
        </asp:Timer>
        <h1 style="color:#b6ff00">Clock : <asp:Label runat="server" ID="lblClock" /></h1>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
