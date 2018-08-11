<%@ Page Title="" Language="C#" MasterPageFile="~/ExaminationController.Master" AutoEventWireup="true" CodeBehind="frmStudRegistration.aspx.cs" Inherits="OnlineExamination.frmStudRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css">
          .auto-style6 {
            /*//margin-left: 20px;*/
            margin-right: 20px;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            margin-top: 0px;
            width:500px;
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
     .div-style {
 padding:8px;    
     }

     .lbl-style {
     width:100px;
     
     }
     .btn-style {
     padding:5px 5px 10px 10px;
     
     }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Student Registration</h2>
    <div id="divStudDetail" runat="server">
                    <div class="div-style">
                        <asp:Label ID="lblStudName" runat="server" Text="Student Name :-" CssClass="lbl-style"></asp:Label>
            <asp:TextBox ID="txt_StudName" runat="server" Height="24px" CssClass="auto-style6" Width="330px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_StudName" ErrorMessage="Can't be leave field  Empty." ForeColor="Red" ValidationGroup="Subject"></asp:RequiredFieldValidator>
                </div>
            <div class="div-style">
                        <asp:Label ID="lblClass" runat="server" Text="Class :-" CssClass="lbl-style"></asp:Label>
                  
                  <asp:DropDownList ID="ddl_Class" runat="server"  CssClass="auto-style33" Height="35px" Width="265px"></asp:DropDownList>
            
            </div>
            <div class="div-style">             
                <asp:Label ID="lblRollNo" runat="server" Text="Roll No. :-"></asp:Label>
          <asp:TextBox ID="txt_RollNo" runat="server" Height="24px" CssClass="auto-style6" Width="330px"></asp:TextBox>
    
                        </div>
            <div class="div-style">
                <asp:Label ID="lblUserID" runat="server" Text="User ID :-"></asp:Label>
            <asp:TextBox ID="txt_UserID" runat="server" Height="24px" CssClass="auto-style6" Width="330px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_UserID" ErrorMessage="Can't be leave field  Empty." ForeColor="Red" ValidationGroup="Subject"></asp:RequiredFieldValidator>
                     </div>
             <div class="div-style">
                 <asp:Label ID="lblPassward" runat="server" Text="Passward :-"></asp:Label>
            <asp:TextBox ID="txt_Passward" runat="server" Height="24px" CssClass="auto-style6" Width="330px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Passward" ErrorMessage="Can't be leave field  Empty." ForeColor="Red" ValidationGroup="Subject"></asp:RequiredFieldValidator>
                     </div>
        </div>
      

    <div id="divDGSlist" runat="server">
    <div>
        <h2>Existing Student List</h2>
    </div>
    
                    <asp:GridView ID="DGVStudList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="DGVStudList_SelectedIndexChanged" AutoGenerateColumns="False">
                        <Columns> 
            <asp:BoundField DataField="srno" HeaderText="Sr. No." />
            <asp:BoundField DataField="studName" HeaderText="Name" />
            <asp:BoundField DataField="SClass" HeaderText="Class" />
            <asp:BoundField DataField="RollNo" HeaderText="Roll No." />
            <asp:BoundField DataField="UserID" HeaderText="User ID" />
            <asp:BoundField DataField="passward" HeaderText="Passward" />
            <asp:BoundField DataField="regdate" HeaderText="Date " />
                           <%-- <asp:BoundField DataField="activeflag" HeaderText="A Flag" />
            <asp:BoundField DataField="delflag" HeaderText="D Flag" />--%>

                        <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="BtnSelect" runat="server" Height="30px" CommandName="Select" Text="Select" />
                    <%--<asp:Button ID="BtnRemove" runat="server" Height="30px" CommandName="Delete" OnClientClick="return confirm('are you sure to remove this Question?')" Text="Remove" />--%>
                 </ItemTemplate>
            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
        </div>
      <div id="divBtn" class="btn-style">
            <asp:Button ID="BtnAdd" runat="server" CssClass="btn-lg"  Text="Add"  style="width:100px" OnClick="BtnAdd_Click"/>
            <asp:Button ID="BtnSave" runat="server" CssClass="btn-lg"  Text="Save" ValidationGroup="Subject" style="width:100px" OnClick="BtnSave_Click"/>
            <asp:Button ID="BtnEdit" runat="server" CssClass="btn-lg"  Text="Edit"  style="width:100px" OnClick="BtnEdit_Click"/>
            <asp:Button ID="BtnCancel" runat="server" CssClass="btn-lg"  Text="Cancel" style="width:100px" OnClick="BtnCancel_Click"/>
      </div>
    <asp:HiddenField ID="txt_StudSrno" runat="server" Value="0" />
    
        </asp:Content>
