<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true" CodeFile="forgetPwd.aspx.cs" Inherits="forgetPwd" Title="forget password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 122px;
        }
        </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate><div class="content">
  
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
              <td>
                  <table cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                          <td>
                              <asp:Label ID="Label1" runat="server"                                  
                                  Text="Please enter user name and password will send to your email" CssClass="label"></asp:Label>
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
                  <table cellpadding="0" cellspacing="0" class="style1">
                      <tr>
                          <td class="style2">
                              <asp:Label ID="Label3" runat="server" ForeColor="Red" style="font-weight: 700" 
                                  Text="*"></asp:Label>
                              <asp:Label ID="Label2" runat="server" 
                                  Text="User Name :"></asp:Label>
                          </td>
                          <td>
                              <asp:TextBox ID="txtUser" runat="server" Width="158px" CssClass="textbox"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                  ControlToValidate="txtUser" ErrorMessage="Please enter User Name.">*</asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="style2">
                              &nbsp;</td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style2">
                              &nbsp;</td>
                          <td>
                              <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                  onclick="btnSubmit_Click" />
                              &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                  onclick="btnCancel_Click" Text="Cancel" />
                          </td>
                      </tr>
                  </table>
              </td>
          </tr>
      </table>
      </div><div class="clear">
   <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" 
                    ShowSummary="False" />
            </div>
            
      </ContentTemplate>
      </asp:UpdatePanel>
</asp:Content>

