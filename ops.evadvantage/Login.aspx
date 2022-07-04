<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" Title="Welcome to Admin module of EVAdvantage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 133px;
        }
        .style3
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
<div class="content">
 <table width="400" border="0" cellspacing="0" cellpadding="0" align="center" 
        style="height: 209px">
                    <tr>
                        <td align="center">
         <div class="adminLogin" >
      <table id="tblLogin" runat="server" width="375" border="0" cellspacing="0" cellpadding="0" align="center">
         <tr>
          <td align="left" class="style3" >
              <asp:Label ID="Label17" runat="server" Text="Admin Login" 
                  style="text-decoration: underline; font-size: x-large"></asp:Label>
             </td>
        </tr>
        <tr>
          <td height="10px"></td>
        </tr>
         <tr>
          <td height="10px">&nbsp;</td>
        </tr>
         <tr>
          <td align="left"><ul>
              <li>Enable or Disable Employee and Verifier Account</li>
              <li>Search Employee by Company </li>
            </ul></td>
        </tr>
          <tr>
              <td height="10px">
                  &nbsp;</td>
          </tr>
        <tr>
          <td>
              <table border="0" cellpadding="0" cellspacing="0" width="375">
                  <tr>
                      <td align="right" class="style1">
                          <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red" 
                              Text="*"></asp:Label>
                          <asp:Label ID="Label5" runat="server" Text="User Name :"></asp:Label>
                          &nbsp; &nbsp; </td>
                      <td align="left">
                          <asp:TextBox ID="txtUser" runat="server" CssClass="textbox"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                              ControlToValidate="txtUser" ErrorMessage="Please enter User Name.">*</asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" height="10px">
                      </td>
                  </tr>
                  <tr>
                      <td align="right" class="style1">
                          <asp:Label ID="Label16" runat="server" Font-Bold="True" ForeColor="Red" 
                              Text="*"></asp:Label>
                          <asp:Label ID="Label6" runat="server" Text="Password :"></asp:Label> &nbsp; &nbsp; 
                      </td>
                      <td align="left">
                          <asp:TextBox ID="txtPwd" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                              ControlToValidate="txtPwd" ErrorMessage="Please enter Password.">*</asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td align="right" class="style1">
                          &nbsp;</td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td align="left" class="style1">
                          &nbsp;</td>
                      <td align="left">
                          <asp:ImageButton ID="imgbtnLogin" runat="server" height="34" 
                              ImageUrl="../images/login_btn.jpg" onclick="imgbtnLogin_Click" width="96" />
                          <%-- <img src="images/login_btn.jpg" width="96" height="34" />--%></td>
                  </tr>
                  <tr>
                      <td align="right" class="style1">
                          &nbsp;</td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td align="right" class="style1">
                          &nbsp;</td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td align="center" colspan="2">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td align="center" colspan="2">
                          &nbsp;</td>
                  </tr>
              </table>
            </td>
        </tr>
      </table>
        </div></td></tr></table>
    <div class="clear">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />
    </div>
</div></ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
