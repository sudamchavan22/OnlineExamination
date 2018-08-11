<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmTest.aspx.cs" Inherits="OnlineExamination.frmTest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Examination</title>
    <link href="Styles/design.css" rel="stylesheet" />
       <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #FFFFFF;
            height: 50px;
        }
        .auto-style2 {
            width: 257px;
            color:greenyellow;
            background-color:#000000
        }
        .auto-style3 {
            width: 786px;
            font-size:18px;
        }
        .auto-style5 {
            width: 100%;
            height: 32px;
            background-color: #FFFFFF;
        }
        .auto-style6 {
            width: 288px;
        }
        .auto-style7 {
            background-color: #FFFFFF;
        }
        .auto-style8 {
            margin-bottom: 0px;
        }
        .auto-style9 {
            width: 100%;
        }
        .auto-style10 {
            height: 22px;
        }
        .auto-style11 {
            height: 35px;
        }
        .auto-style12 {}
           .auto-style14 {
               text-align: left;
           }
        </style>
</head>
<body style="background-image: url('/images/max.jpg');background-size:cover;">
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
 
        <div>
                   
        <table class="auto-style1" aria-orientation="horizontal" style="color: #FFFFFF; background-image: url('images/background.PNG'); background-repeat: repeat-x">
            <tr>
                <td class="auto-style2" style="vertical-align: top; text-align: center; border-radius:20px;background-color:white" >
                    <asp:UpdatePanel runat="server" ID="pnlClock" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:Timer ID="Timer2" runat="server" Interval="1000" OnTick="Timer2_Tick" >
        </asp:Timer>
                
        <h1 style="color:#000000;border-radius:50%">Remainning Time<br /><asp:Label runat="server" ID="lblClock" /></h1>
        </ContentTemplate>
        </asp:UpdatePanel>
                  
                </td>

                <td class="auto-style3" style="vertical-align: top; padding-left: 3em;padding-top: 1em;">
                    Name :
                    <asp:Label ID="lblName" runat="server"></asp:Label>
                    <br />
                    <br />
                    Email Address :
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    <br />
                    <br />
                    Subject Names :<asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemPlaceHolder" GroupItemCount="3">
                        <ItemTemplate>
                            <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("subject_name") %>' />&nbsp;
                        </ItemTemplate>
                        <GroupTemplate>
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </GroupTemplate>

                    </asp:ListView>
                </td>
                <td style="vertical-align: middle">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Test" CssClass="btn-lg" Height="49px" Width="186px" OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure to Submit thw test?')" />
                </td>
            </tr>
            <tr><td colspan="3"><hr /></td></tr>
        </table>
        </div>
        <div class="auto-style7" runat="server" id="updatePage"> 
            
                    <table class="auto-style5">
                        <tr>

                            <td class="auto-style6" style="vertical-align: top">
                                <table class="auto-style9">
                                    <tr>
                                        <td>
                               <asp:Button ID="btnUnsolve" Text="Q" runat="server" CssClass="btn-lg" Width="50px" Height="35px" BackColor="Red"/>
                                       
                                        </td>
                                        <td>Visited Questions                            </tr>
                                    <tr>
                                        <td>
                               <asp:Button ID="btnUnsolve0" Text="Q" runat="server" CssClass="btn-lg" Width="50px" Height="35px" BackColor="Green"/>
                                       
                                        </td>
                                        <td>Solve Questions</td>
                                    </tr>
                                    <tr>
                                        <td>
                               <asp:Button ID="btnUnsolve1" Text="Q" runat="server" CssClass="btn-lg" Width="50px" Height="35px"/>
                                       
                                        </td>
                                        <td>Un-Solve Questions</td>
                                    </tr>
                                </table>
                                <br />
                                       
                                <asp:ListView ID="lvIndexOfQ" runat="server" GroupItemCount="5" ItemPlaceholderID="ItemPlaceHolder" OnItemDataBound="lvIndexOfQ_ItemDataBound" OnSelectedIndexChanged="lvIndexOfQ_SelectedIndexChanged" OnSelectedIndexChanging="lvIndexOfQ_SelectedIndexChanging">
                                    <ItemTemplate> 
                                        <asp:Button ID="btnIndexOfQ" runat="server" Text='<%# Eval("Q_Number") %>' CommandName="Select" CssClass="btn-lg" Width="50px" Height="35px"/>
                                    </ItemTemplate>
                                    <GroupTemplate>
                                        <asp:PlaceHolder ID="ItemPlaceHolder" runat="server" />
                                
                                            </GroupTemplate>
                                    <GroupSeparatorTemplate>
                                        <br />
                                    </GroupSeparatorTemplate>
                                    </asp:ListView>
                            </td>
                            <td style="vertical-align: top">
                  
                                <asp:DataList ID="DataList1" runat="server" CssClass="auto-style8" Height="100px" Width="100%" OnItemDataBound="DataList1_ItemDataBound" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" OnItemCommand="DataList1_ItemCommand" >
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <ItemStyle BackColor="White" />
                                    <ItemTemplate>
                                       
                                        <table class="auto-style9">
                                            <tr>
                                                <td class="auto-style11">
                                                    <h2>&nbsp;<asp:Label ID="lblQNo" runat="server" Text='<%# Eval("Q_Number") %>'></asp:Label>)
                                                        <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                                                    </h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style10" style="text-align: left">
                                                    <asp:RadioButtonList ID="rblQstList" runat="server" CellPadding="10" CellSpacing="10">
                                                                
                                                    </asp:RadioButtonList>
                                                           </td>
                                            </tr>
                                            <tr>
                                                <td><asp:HiddenField runat="server" ID="hfq_id" Value='<%# Eval("q_id") %>' /></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">
                                                    <asp:Button ID="btnNext" runat="server" CommandArgument='<%# Eval("ans") %>' CssClass="btn-lg" Height="43px" Width="100px" Text="Next" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                </asp:DataList>
                                
          
                                <h2>
                                    <asp:Label ID="Label1" runat="server" ForeColor="#00CC00"></asp:Label>
                                </h2>
                                
          
                                <br />
                                
                            </td>
                        </tr>
                    </table>
               
            <br />
             <asp:HiddenField ID="HiddenField1" runat="server" /> <asp:HiddenField ID="HiddenField2" runat="server" />
             <asp:ModalPopupExtender ID="OneMinWarning" runat="server" PopupControlID="OneMinWarningDiv" TargetControlID="HiddenField1" CancelControlID="Button1" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
           <div id="OneMinWarningDiv" style="text-align:center;background-color:white;color:red;width:566px; height:115px; border-radius:20px">
<h2>Hurry up 1 Minute</h2>
               <br />
               <asp:Button ID="Button1" runat="server" Text="Ok" Width="101px" Height="33px" CssClass="btn-lg auto-style12"/>

           </div>
            <asp:ModalPopupExtender ID="FiveMinWarning" runat="server" PopupControlID="FiveMinWarningDiv" TargetControlID="HiddenField2" CancelControlID="btnClose" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
           <div id="FiveMinWarningDiv" style="text-align:center;background-color:white;color:red;width:568px; height:119px; border-radius:20px">
<h2>Hurry up Your Time is upto the end!</h2>
               <br />
               <asp:Button ID="btnClose" runat="server" Text="Ok" Width="101px" Height="33px" CssClass="btn-lg auto-style12"/>
               </div>

             <asp:ModalPopupExtender ID="ShowAllQuestionSummery" runat="server" PopupControlID="Div1" TargetControlID="HiddenField2" CancelControlID="btnCancel" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
           <div id="Div1" style="text-align:center;background-color:white;color:green;width:566px; height:256px; border-radius:20px">
<h2>Questions Summery!</h2>
               <br />
            <table class="auto-style9">
                                    <tr>
                                        <td>
                               <asp:Label ID="btnSUnsolve" Text="Q" runat="server" Enabled="False" CssClass="btn-lg" Width="50px" Height="35px" BackColor="Red" Font-Bold="True" Font-Size="Larger" ForeColor="Black" />
                                       
                                        </td>
                                        <td class="auto-style14">Questions are Visited!</tr> 
                                    <tr>
                                        <td>
                               <asp:Label ID="btnSsolve" Text="Q" runat="server" Enabled="False" CssClass="btn-lg" Width="50px" Height="35px" BackColor="Green" Font-Bold="True" Font-Size="Larger" ForeColor="Black"/>
                                       
                                        </td>
                                        <td class="auto-style14">Questions are Solved!</td>
                                    </tr>
                                    <tr>
                                        <td>
                               <asp:Label ID="btnSUnAttempted" Text="Q" runat="server" Enabled="False" CssClass="btn-lg" Width="50px" Height="35px" Font-Bold="True" Font-Size="Larger" ForeColor="Black"/>
                                       
                                        </td>
                                        <td class="auto-style14">Questions are not Attempted! </td>
                                    </tr>
                                </table>
               <asp:Button ID="btnSaveTest" runat="server" Text="Done!" CssClass="btn-lg" Height="49px" Width="186px" OnClick="btnSaveTest_Click" />
               &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-lg" Height="49px" Width="186px" />
                              </div>
                   
            </div>
    </form>
</body>
</html>
