<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true"
    CodeFile="EmployeeLogin.aspx.cs" Inherits="EmployeeLogin" %>

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
         <div class="employeeLogin">
                    <table width="375" border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                            <td colspan="3" height="33px">
                                <img src="images/eLogin.gif" width="150" height="33" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" height="10px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <ul>
                                    <li>Access your account</li>
                                    <li>Generate a Salary Authorization Code</li>
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
                                        <td align="right" class="style4">
                                            <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:Label ID="Label5" runat="server" Text="User Name :"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtUser" runat="server" ValidationGroup="Employee" CssClass="textbox"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser"
                                                ErrorMessage="Please enter User Name." ValidationGroup="Employee">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style4">
                                            <asp:Label ID="Label16" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:Label ID="Label6" runat="server" Text="Password :"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" ValidationGroup="Employee"
                                                CssClass="textbox"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                                                ErrorMessage="Please enter Password." ValidationGroup="Employee">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="style4">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style4">
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="imgbtnLogin" runat="server" ImageUrl="images/login_btn.jpg"
                                                Width="96" Height="34" OnClick="imgbtnLogin_Click" ValidationGroup="Employee" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style4">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:ImageButton ID="imgbtnNewUser" runat="server" ImageUrl="images/newUser.gif"
                                                OnClick="imgbtnNewUser_Click" CausesValidation="False" ValidationGroup="Employee" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:LinkButton ID="lnkForget" runat="server" CausesValidation="False" Text="Forgot Password?"
                                                OnClick="lnkForget_Click" ValidationGroup="Employee"></asp:LinkButton>
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
