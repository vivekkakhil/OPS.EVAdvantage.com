<%@ Page Language="C#" MasterPageFile="EVASsv.master" AutoEventWireup="true" CodeFile="forgetPwd.aspx.cs" Inherits="SocialService_forgetPwd" Title="Forget Password?" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 93px;
        }
        .style4
        {
            width: 93px;
            height: 9px;
        }
        .style5
        {
            height: 10px;
        }
        .style6
        {
            width: 93px;
            height: 21px;
        }
        .style7
        {
            height: 21px;
        }
    </style><link href="../style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate><div class="content1">
  
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
              <td>
                  <table cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                          <td>
                              <asp:Label ID="Label1" runat="server"  CssClass="label"
                                  Text="Please enter user name and password will send to your email"></asp:Label>
                          </td>
                          <td align="right">
                              <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" 
                                  Text="*"></asp:Label>
                              <asp:Label ID="Label17" runat="server" Font-Italic="True" 
                                  Text="Marked fields are mandatory."></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td colspan="2">
                              <hr style="width: 798px" />
                          </td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                          <td align="right">
                              &nbsp;</td>
                      </tr>
                  </table>
              </td>
          </tr>
          <tr>
              <td>
                  <table cellpadding="0" cellspacing="0"  width="100%">
                      <tr>
                          <td class="style1">
                             
                              <table  id="tblUser" runat="server" cellpadding="0" cellspacing="0" class="style2">
                                  <tr>
                                      <td class="style3">
                                          <asp:Label ID="Label3" runat="server" ForeColor="Red" style="font-weight: 700" 
                                              Text="*"></asp:Label>
                                          <asp:Label ID="Label2" runat="server" Text="User Name :"></asp:Label>
                                      </td>
                                      <td>
                                          <asp:TextBox ID="txtUser" runat="server" CssClass="textbox" Width="158px" 
                                              ValidationGroup="user"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                              ControlToValidate="txtUser" ErrorMessage="Please enter User Name." 
                                              ValidationGroup="user">*</asp:RequiredFieldValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style4">
                                      </td>
                                      <td class="style5">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style3">
                                          &nbsp;</td>
                                      <td>
                                          <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                                              Text="Submit" ValidationGroup="user" />
                                          &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                              onclick="btnCancel_Click" Text="Cancel" />
                                      </td>
                                  </tr>
                              </table>
                             
                          </td>
                      </tr>
                      <tr>
                          <td class="style1">
                              <table id="tblQuestion" runat="server" cellpadding="0" cellspacing="0" class="style2">
                                  <tr>
                                      <td class="style6">
                                          &nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Question :"></asp:Label>
                                      </td>
                                      <td class="style7">
                                          <asp:Label ID="lblQuestion" runat="server"></asp:Label>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style3">
                                          <asp:Label ID="Label6" runat="server" ForeColor="Red" style="font-weight: 700" 
                                              Text="*"></asp:Label>
                                          <asp:Label ID="Label7" runat="server" Text="Answer :"></asp:Label>
                                      </td>
                                      <td>
                                          <asp:TextBox ID="txtAns" runat="server" CssClass="textbox" Width="158px" 
                                              ValidationGroup="question"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                              ControlToValidate="txtAns" ErrorMessage="Please enter answer." 
                                              ValidationGroup="question">*</asp:RequiredFieldValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style3">
                                          &nbsp;</td>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td class="style3">
                                          &nbsp;</td>
                                      <td>
                                          <asp:Button ID="btnSubmit1" runat="server" Text="Submit" 
                                              ValidationGroup="question" onclick="btnSubmit1_Click" />
                                          &nbsp;<asp:Button ID="btnCancel1" runat="server" Text="Cancel" 
                                              CausesValidation="False" onclick="btnCancel1_Click" />
                                      </td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
                  </table>
              </td>
          </tr>
      </table>
      </div><div class="clear">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" 
                    ShowSummary="False" ValidationGroup="user" />
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" 
                    ShowSummary="False" ValidationGroup="question" />
            </div>
            
      </ContentTemplate>
      </asp:UpdatePanel>
</asp:Content>



