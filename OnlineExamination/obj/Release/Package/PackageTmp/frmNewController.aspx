<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmNewController.aspx.cs" Inherits="OnlineExamination.frmNewController" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 100%;
        }
        .auto-style7 {
            height: 23px;
            width: 340px;
        }
        .auto-style8 {
        }
        .auto-style9 {
            height: 23px;
            width: 121px;
        }
        .auto-style10 {
            width: 340px;
        }
        .auto-style11 {
            width: 44px;
        }
        .auto-style12 {
            text-align: center;
        }
        .auto-style13 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Add New User With Examination Controller Authority</h2>
    <hr />
    <div>
       
        <table class="auto-style6" align="cEnter">
            <tr>
                <td class="auto-style8">Name</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtName" runat="server" CssClass="formControl"></asp:TextBox>
                </td>
                <td class="auto-style11" rowspan="13" style="vertical-align: top">
                    </td>
                <td rowspan="13" style="vertical-align: top">
                    <strong><span class="auto-style13">Existing Examination Controllers</span></strong>
                    <asp:GridView ID="GridView1" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style12" DataKeyNames="cid" Font-Size="14pt" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="name" HeaderText="Examination Controller Name" />
                            <asp:BoundField DataField="cont_no" HeaderText="Contact No." />
                            <asp:BoundField DataField="email_id" HeaderText="Email Address" />
                            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
                                <asp:TemplateField><ItemTemplate>
                                    <asp:Label ID="lblcid" runat="server" Text='<%# Eval("cid") %>' Visible="false" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('are you sure to delete this user!')"/>
                                               </ItemTemplate></asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            Record Not Found!
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
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ControlToValidate="txtName" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter name" ValidationGroup="NewController" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="auto-style8">Contact No</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtContact" runat="server" CssClass="formControl" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10"><asp:RequiredFieldValidator ControlToValidate="txtContact" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Contact No." ValidationGroup="NewController" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtContact" Display="Dynamic" runat="server" ErrorMessage="Invalied Mobile No." ValidationGroup="NewController" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Email ID</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="formControl" placeholder="example@gmail.com"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10"><asp:RequiredFieldValidator ControlToValidate="txtEmail" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email ID" ValidationGroup="NewController" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmail" Display="Dynamic" runat="server" ErrorMessage="in-correct format of email id " ValidationGroup="NewController" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">User ID</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtUserid" runat="server" CssClass="formControl"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10"><asp:RequiredFieldValidator ControlToValidate="txtUserid" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter User ID" ValidationGroup="NewController" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="auto-style9">Password</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtPwd" TextMode="Password" runat="server" CssClass="formControl"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10"><asp:RequiredFieldValidator ControlToValidate="txtPwd" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Password" ValidationGroup="NewController" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="auto-style8">Confirm Password</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtConfirmPwd" runat="server" CssClass="formControl" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10"><asp:RequiredFieldValidator ControlToValidate="txtConfirmPwd" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter name" Display="Dynamic" ValidationGroup="NewController" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtConfirmPwd" ControlToCompare="txtPwd" runat="server" ErrorMessage="Password doesn't match" Display="Dynamic" ValidationGroup="NewController" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:cEnter" colspan="2">
                    <asp:Button ID="btnNewController" runat="server" CssClass="btn-lg" Text="Add" ValidationGroup="NewController" OnClick="btnNewController_Click" />
&nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="btn-lg" Text="Update" ValidationGroup="NewController" OnClick="btnUpdate_Click" Visible="False" />
&nbsp;
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn-lg" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
       
    </div>
</asp:Content>
