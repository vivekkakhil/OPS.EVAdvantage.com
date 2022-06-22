<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="loginN.aspx.cs" Inherits="SocialService_loginN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            width: 100px;
        }
        </style>
    
    <SCRIPT type=text/javascript>
        function doClick(buttonName, e) {
            //the purpose of this function is to allow the enter key to 

            //point to the correct button to click.

            var key;

            if (window.event)
                key = window.event.keyCode;     //IE

            else
                key = e.which;     //firefox


            if (key == 13) {
                //Get the button the user wants to have clicked

                var btn = document.getElementById(buttonName);
                if (btn != null) { //If we find the button click it

                    btn.click();
                    event.keyCode = 0
                }
            }
        }
    </SCRIPT>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="content">
 <table width="400" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td align="center">
         <div class="employeeLogin_page">
      <table id="tblLogin" runat="server" width="375" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td colspan="3" height="33px" align="left"><asp:Label ID="Label17" runat="server" Text="Social Service Login" 
                  style="text-decoration: underline; font-size: x-large"></asp:Label></td>
        </tr>
        <tr>
          <td colspan="3" height="10px"></td>
        </tr>
        <tr>
          <td colspan="3" align="left"><ul>
              <li>Access your account</li>
              <li>Do Social Service Verification</li>
            </ul></td>
        </tr>
        <tr>
          <td colspan="3" height="10px"></td>
        </tr>
        <tr>
          <td colspan="3">
              <table width="375" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="right" class="style2" >
                      <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red" 
                          Text="*"></asp:Label>
                      <asp:Label ID="Label5" runat="server" 
                          Text="User Name :"></asp:Label>
                    </td>
                  <td  align="left">
                      <asp:TextBox ID="txtUser" runat="server" CssClass="textbox"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                          ControlToValidate="txtUser" ErrorMessage="Please enter User Name.">*</asp:RequiredFieldValidator>
                      </td>
                </tr>
                <tr>
                  <td colspan="2" height="10px"></td>
                </tr>
                <tr>
                  <td align="right" class="style2"  >
                      <asp:Label ID="Label16" runat="server" Font-Bold="True" ForeColor="Red" 
                          Text="*"></asp:Label>
                      <asp:Label ID="Label6" runat="server" 
                          Text="Password :"></asp:Label>
                    </td>
                  <td  align="left">
                      <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                          ControlToValidate="txtPwd" ErrorMessage="Please enter Password.">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                  <td align="right" class="style2"  >&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td  align="left" class="style2" >&nbsp;</td>
                  <td  align="left"><asp:ImageButton ID="imgbtnLogin" runat="server" 
                          ImageUrl="../images/login_btn.jpg" width="96" height="34" 
                          onclick="imgbtnLogin_Click" /> <%-- <img src="images/login_btn.jpg" width="96" height="34" />--%></td>
                </tr>
                <tr>
                  <td align="right" class="style2" >&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2" align="center" >
                  <asp:ImageButton ID="imgbtnNewUser" runat="server" ImageUrl="../images/newUser.gif" 
                          onclick="imgbtnNewUser_Click" CausesValidation="False" />
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="center" >
                      &nbsp;</td>
                </tr>
                  <tr>
                      <td align="center" colspan="2">
                          <asp:LinkButton ID="lnkForget" runat="server" CausesValidation="False" 
                              Text="Forgot Password?" 
                              onclick="lnkForget_Click"></asp:LinkButton>
                      </td>
                  </tr>
              </table>
            </td>
        </tr>
      </table>
          <table id="tblMsg" runat="server" width="375" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
          <td align="center">
          <asp:Label ID="lblMsg" runat="server" style="font-size: medium"></asp:Label>
          </td>
          </tr>
          </table>
        </div></td></tr></table>
    <div class="clear">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />
    </div>
</div>
</asp:Content>

