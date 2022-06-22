<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true"
    CodeFile="verifiers.aspx.cs" Inherits="verifiers" Title="Verifier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 91px;
        }
    </style>
    <SCRIPT type=text/javascript>
    function doClick(buttonName,e)
    {
//the purpose of this function is to allow the enter key to 

//point to the correct button to click.

        var key;

         if(window.event)
              key = window.event.keyCode;     //IE

         else
              key = e.which;     //firefox

    
        if (key == 13)
        {
            //Get the button the user wants to have clicked

            var btn = document.getElementById(buttonName);
            if (btn != null)
            { //If we find the button click it

                btn.click();
                event.keyCode = 0
            }
        }
   }
    </SCRIPT>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
            <div class="content">
                <table width="400" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td align="center">
                            <div class="verifierLogin">
                           <table id="tblLogin" runat="server" width="375" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td colspan="3" height="33px" align="left"><img src="images/vLogin.gif" width="124" height="33" /></td>
        </tr>
        <tr>
          <td colspan="3" height="10px"></td>
        </tr>
        <tr align="left">
          <td colspan="3"><ul>
                <li>Verify a person's Employment and income</li>
              <li>Establish a Verifier Account</li>
            </ul></td>
        </tr>
        <tr>
          <td colspan="3" height="10px"></td>
        </tr>
        <tr>
          <td colspan="3">
              <table width="375" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="right" class="style1">
                      <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red" 
                          Text="*"></asp:Label>
                      <asp:Label ID="Label18" runat="server" 
                          Text="User Name :"></asp:Label>
                    </td>
                  <td align="left"><label>
                    <asp:TextBox ID="txtVUser" runat="server" ValidationGroup="verifier" 
                          CssClass="textbox"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                          ControlToValidate="txtVUser" ErrorMessage="Please enter User Name." 
                          ValidationGroup="verifier">*</asp:RequiredFieldValidator>
                    </label></td>
                </tr>
                <tr>
                  <td colspan="2" height="10px"></td>
                </tr>
                <tr>
                  <td align="right" class="style1">
                      <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" 
                          Text="*"></asp:Label>
                      <asp:Label ID="Label17" runat="server" 
                          Text="Password :"></asp:Label>
                    </td>
                  <td align="left"><label>
                    <asp:TextBox ID="txtVPwd" runat="server" TextMode="Password" 
                          ValidationGroup="verifier" CssClass="textbox"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                          ControlToValidate="txtVPwd" ErrorMessage="Please enter Password." 
                          ValidationGroup="verifier">*</asp:RequiredFieldValidator>
                    </label></td>
                </tr>
                <tr>
                  <td align="right" class="style1">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="right" class="style1">&nbsp;</td>
                  <td align="left">
                  <asp:ImageButton ID="imgbtnVLogin" runat="server" ImageUrl="images/login_btn.jpg" 
                          width="96" height="34" onclick="imgbtnVLogin_Click" 
                          ValidationGroup="verifier" />
                 </td>
                </tr>
                <tr>
                  <td align="right" class="style1">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2" align="center">
                  <asp:ImageButton ID="imgbtnNewUserVerif" runat="server" ImageUrl="images/newUser.gif" 
                          CausesValidation="False" 
                          ValidationGroup="verifier" onclick="imgbtnNewUserVerif_Click" />
                  
                  </td>
                </tr>
                 <tr>
                  <td colspan="2" align="center" >
                      &nbsp;</td>
                </tr>
                  <tr>
                      <td align="center" colspan="2">
                          <asp:LinkButton ID="lnkForgetVeri" runat="server" CausesValidation="False" 
                               Text="Forgot Password?" 
                              onclick="lnkForgetVeri_Click" ValidationGroup="verifier"></asp:LinkButton>
                      </td>
                  </tr>
              </table>
              </td></tr></table>
              <table id="tblMsg" runat="server" width="375" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
          <td>
          <asp:Label ID="lblMsg" runat="server" style="font-size: medium"></asp:Label>
          </td>
          </tr>
          </table>
                            </div>
                        </td>
                    </tr>
                </table>
                
                <div class="clear">
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="verifier" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
