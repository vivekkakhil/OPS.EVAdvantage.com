<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true"
    CodeFile="VerifierLogin.aspx.cs" Inherits="VerifierLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
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
    <script type="text/javascript">
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <contenttemplate>
<div class="content">
 <table width="400" border="0" cellspacing="0" cellpadding="0" align="center" 
        style="height: 209px">
                    <tr>
                        <td align="center">
         <div class="verifierLogin">
                    <table width="375" border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                            <td colspan="3" height="33px">
                                <img src="images/vLogin.gif" width="124" height="33" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" height="10px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <ul>
                                    <li>Verify a person&#39;s Employment and Income</li>
                                    <li>Establish a Verifier Account</li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" height="10px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table width="375" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="right" class="style5">
                                            <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:Label ID="Label18" runat="server" Text="User Name :"></asp:Label>
                                        </td>
                                        <td>
                                            <label>
                                                <asp:TextBox ID="txtVUser" runat="server" ValidationGroup="verifier" CssClass="textbox"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVUser"
                                                    ErrorMessage="Please enter User Name." ValidationGroup="verifier">*</asp:RequiredFieldValidator>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5">
                                            <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:Label ID="Label17" runat="server" Text="Password :"></asp:Label>
                                        </td>
                                        <td>
                                            <label>
                                                <asp:TextBox ID="txtVPwd" runat="server" TextMode="Password" ValidationGroup="verifier"
                                                    CssClass="textbox"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtVPwd"
                                                    ErrorMessage="Please enter Password." ValidationGroup="verifier">*</asp:RequiredFieldValidator>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="imgbtnVLogin" runat="server" ImageUrl="images/login_btn.jpg"
                                                Width="96" Height="34" OnClick="imgbtnVLogin_Click" ValidationGroup="verifier" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style5">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:ImageButton ID="imgbtnNewUserVerif" runat="server" ImageUrl="images/newUser.gif"
                                                CausesValidation="False" ValidationGroup="verifier" OnClick="imgbtnNewUserVerif_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:LinkButton ID="lnkForgetVeri" runat="server" CausesValidation="False" Text="Forgot Password?"
                                                OnClick="lnkForgetVeri_Click" ValidationGroup="verifier"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>

                        </td></tr></table>
    <div class="clear">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />
    </div>
</div></contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
